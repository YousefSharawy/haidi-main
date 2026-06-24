part of 'MainImports.dart';

class Main extends StatefulWidget {
  const Main();

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  MainPageData mainPageData = MainPageData();

  @override
  void initState() {
    mainPageData.getCategories(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: MainAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          BuildSwiper(),
          BuildMainItems(mainPageData: mainPageData),
        ],
      ),
    );
  }
}
