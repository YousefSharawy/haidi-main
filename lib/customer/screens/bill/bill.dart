part of 'bill_imports.dart';

class Bill extends StatelessWidget {
  final int orderId;

  const Bill({required this.orderId});

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(children: [
      DefaultAppBar(title: tr(context, 'bill')),
      Flexible(
        child: SfPdfViewer.network(
          'https://heidi.ip4s.com/invoice/createpdf/$orderId',
          canShowScrollStatus: true,
          initialScrollOffset: Offset(80, 0),
          initialZoomLevel: 1.7,
        ),
      ),
    ]);
  }
}
