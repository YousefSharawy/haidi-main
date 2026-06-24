part of 'workshops_imports.dart';

class Workshops extends StatefulWidget {
  final int categoryId;
  final String appBarName;
  final int categoryType;

  const Workshops({
    required this.categoryId,
    required this.appBarName,
    required this.categoryType,
  });

  @override
  State<Workshops> createState() => _WorkshopsState();
}

class _WorkshopsState extends State<Workshops> {
  final WorkshopsData workshopsData = WorkshopsData();

  @override
  void initState() {
    workshopsData.getProvider(context, widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(children: [
      SizedBox(height: 10),
      DefaultAppBar(
          haveNotifyIConButton: true,
          haveCartIConButton: true,
          title: widget.appBarName,
          leading: Row(
            children: [
              SizedBox(width: 20),
              InkWell(
                  onTap: () => Nav.navigateTo(
                      Filter(
                          workshopsData: workshopsData,
                          categoryId: widget.categoryId),
                      navigatorType: NavigatorType.push),
                  child: Icon(Icons.menu, color: MyColors.primary)),
            ],
          )),
      Flexible(
          child: RefreshIndicator(
        color: MyColors.primary,
        onRefresh: () => workshopsData.getProvider(context, widget.categoryId),
        child: ListView(
          padding: EdgeInsets.only(top: 0, bottom: 32, right: 10, left: 10),
          children: [
            BuildSwiper(),
            Providers(
                workshopsData: workshopsData, categoryType: widget.categoryType)
          ],
        ),
      ))
    ]);
  }
}
