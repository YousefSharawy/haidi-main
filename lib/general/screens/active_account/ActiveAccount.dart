part of 'ActiveAccountImports.dart';

class ActiveAccount extends StatefulWidget {
  final String userId;

  const ActiveAccount({required this.userId});

  @override
  _ActiveAccountState createState() => _ActiveAccountState();
}

class _ActiveAccountState extends State<ActiveAccount> {
  ActiveAccountData activeAccountData = new ActiveAccountData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Res.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment(0, 5),
            child: Container(
              height: 800,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Hero(
                      tag: 'logoTagAcitve',
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Image.asset(Res.logo))),
                  BuildText(),
                  BuildFormInputs(activeAccountData: activeAccountData),
                  BuildButtonList(
                    activeAccountData: activeAccountData,
                    userId: widget.userId,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
