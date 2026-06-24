part of 'SelectLangImports.dart';

class SelectLang extends StatefulWidget {
  @override
  _SelectLangState createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  SelectLangData selectLangData = SelectLangData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Res.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment(0, 0.5),
            child: Container(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                      tag: 'logoTagSelect',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Image.asset(Res.logo),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  MyText(
                      title: tr(context, 'selectLang'),
                      size: 15,
                      color: MyColors.black),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => selectLangData.setUserLang(context, 'ar'),
                        child: Container(
                          height: 95,
                          width: 95,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border:
                                Border.all(color: MyColors.primary, width: 1.7),
                          ),
                          child: Center(
                            child: MyText(
                                title: tr(context, 'langAr'),
                                size: 13,
                                color: MyColors.primary),
                          ),
                        ),
                      ),
                      SizedBox(width: 35),
                      InkWell(
                        onTap: () => selectLangData.setUserLang(context, 'en'),
                        child: Container(
                          height: 95,
                          width: 95,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border:
                                Border.all(color: MyColors.primary, width: 1.5),
                          ),
                          child: Center(
                            child: MyText(
                                title: tr(context, 'langEn'),
                                size: 13,
                                color: MyColors.primary),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: selectLangData.onBackPressed,
    );
  }
}
