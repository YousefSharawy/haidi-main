part of 'workshop_widgets_imports.dart';

class BuildTimeRow extends StatelessWidget {
  final String day;
  final String from;
  final String to;
  final bool isClosed;

  const BuildTimeRow(
      {required this.day,
      required this.from,
      required this.to,
      required this.isClosed});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(flex: 1, child: MyText(title: day, size: 10.5)),
      SizedBox(width: 15),
      Expanded(
        flex: 3,
        child: from.isNotEmpty && to.isNotEmpty
            ? Row(
                children: [
                  isClosed
                      ? Expanded(
                          child: Center(child: Text(tr(context, 'close'))))
                      : Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xffE6E6E6)),
                                borderRadius: BorderRadius.circular(5)),
                            child: MyText(
                              alien: TextAlign.center,
                              title: from,
                              size: 11,
                              color: Color(0xff7D7D7D),
                            ),
                          ),
                        ),
                  SizedBox(width: 15),
                  isClosed
                      ? Expanded(child: SizedBox())
                      : Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xffE6E6E6)),
                                borderRadius: BorderRadius.circular(5)),
                            child: MyText(
                              alien: TextAlign.center,
                              title: to,
                              size: 11,
                              color: Color(0xff7D7D7D),
                            ),
                          ),
                        ),
                ],
              )
            : SizedBox(
                height: 30,
              ),
      ),
    ]);
  }
}
