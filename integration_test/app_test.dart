// End-to-end integration test for the Haidi customer app, driven against the
// LIVE backend (https://63.181.125.139/api/v1/, MockApi.enabled = false).
//
// Run with:
//   flutter drive \
//     --driver=test_driver/integration_test.dart \
//     --target=integration_test/app_test.dart \
//     -d emulator-5554
//
// `flutter drive` installs a fresh app with no saved session, so the launch
// routes splash -> SelectLang -> Login. We drive the auth-free VISITOR path
// (Choose English -> "Log in as a visitor") to reach Home, then assert on real
// data returned by the live backend — verifying the API integration
// end-to-end, not merely that widgets exist.
//
// The app does heavy global init in main() and never lets the frame scheduler
// idle (sliders, image loaders, splash timer), so we pump fixed frames instead
// of pumpAndSettle.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:base_flutter/main.dart' as app;

/// Pump until [finder] matches or [timeout] elapses; returns whether it matched.
Future<bool> pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 40),
  Duration step = const Duration(milliseconds: 250),
}) async {
  final end = timeout.inMilliseconds ~/ step.inMilliseconds;
  for (var i = 0; i < end; i++) {
    await tester.pump(step);
    if (finder.evaluate().isNotEmpty) return true;
  }
  return finder.evaluate().isNotEmpty;
}

/// Pump until one of [finders] matches; returns the index of the first match,
/// or -1 if none matched within [timeout]. Used to branch on whichever screen
/// the app settles on (Home if a session is persisted, else SelectLang).
Future<int> pumpUntilAny(
  WidgetTester tester,
  List<Finder> finders, {
  Duration timeout = const Duration(seconds: 50),
  Duration step = const Duration(milliseconds: 250),
}) async {
  final end = timeout.inMilliseconds ~/ step.inMilliseconds;
  for (var i = 0; i < end; i++) {
    await tester.pump(step);
    for (var f = 0; f < finders.length; f++) {
      if (finders[f].evaluate().isNotEmpty) return f;
    }
  }
  return -1;
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Haidi customer — live end-to-end (visitor → Home → Salons)',
      (tester) async {
    // main() installs a demo-mode ErrorWidget.builder; the framework verifies
    // it is unchanged at the END of the test body (before tearDowns run), so we
    // snapshot it and restore it in a finally — guaranteeing restoration before
    // the body returns, and surfacing any real assertion failure instead of
    // masking it with the ErrorWidget.builder assertion.
    final originalErrorBuilder = ErrorWidget.builder;
    try {
      await _runFlow(tester);
    } finally {
      ErrorWidget.builder = originalErrorBuilder;
    }
  });
}

Future<void> _runFlow(WidgetTester tester) async {
    app.main();

    // After the splash, the app settles on Home (index 0) if a session is
    // persisted, or SelectLang (index 1) on a fresh install. Branch on whichever
    // appears so the test is deterministic regardless of saved state.
    final landed = await pumpUntilAny(
        tester, [find.text('Market'), find.text('English')]);
    expect(landed, isNot(-1),
        reason: 'app should boot to Home or the language-selection screen');

    if (landed == 1) {
      // SelectLang -> choose English (sets lang=en), opening Login.
      await tester.tap(find.text('English').first);
      await tester.pump(const Duration(seconds: 1));

      // Login -> "Log in as a visitor" -> Home.
      final onLogin =
          await pumpUntilFound(tester, find.textContaining('visitor'));
      expect(onLogin, isTrue, reason: 'choosing a language should open Login');
      await tester.tap(find.textContaining('visitor').first);

      // Home loads HomeCategories over the live network.
      final homeLoaded = await pumpUntilFound(tester, find.text('Market'));
      expect(homeLoaded, isTrue,
          reason: 'HomeCategories should return the live "Market" category');
    }

    // Live categories from HomeCategories.
    expect(find.text('Salons'), findsWidgets);
    expect(find.text('Spa'), findsWidgets);

    // Regression: the reservations empty-state must never render the old
    // hardcoded Arabic literal (now resolved via tr(context,"noOrders")).
    expect(find.text('لا يوجد طلبات'), findsNothing,
        reason: 'empty-state must use the localized key, not an Arabic literal');

    // Opening Salons lists the real seeded provider (ListProvidersByCategoryId):
    // "Elegance Salon" / "صالون الأناقة".
    await tester.tap(find.text('Salons').first);
    final hasProvider =
        await pumpUntilFound(tester, find.textContaining('الأناقة'));
    expect(hasProvider, isTrue,
        reason: 'Salons category should list the live provider');
}
