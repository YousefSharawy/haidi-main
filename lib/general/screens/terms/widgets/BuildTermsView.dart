part of 'TermsWidgetsImports.dart';

class BuildTermsView extends StatelessWidget {
  final String text;

  const BuildTermsView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          MyText(
              title: text,
              size: 13,
              color: MyColors.primary,
              alien: TextAlign.center)
        ],
      ),
    );
  }
}
