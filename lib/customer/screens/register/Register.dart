part of 'RegisterImports.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final registerData = RegisterData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 200),
              height: MediaQuery.of(context).size.height * 1.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Res.background),
                  fit: BoxFit.fill,
                ),
              ),
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: Align(
                  alignment: Alignment(0, 0.1),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20,
                         right: 20,
                         
                         ),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Hero(
                            tag: 'logoTag',
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Image.asset(Res.logo))),
                        BuildText(),
                        BuildRegisterInputs(registerData: registerData),
                        BuildAccept(registerData: registerData),
                        BuildRegisterButton(registerData: registerData),
                        BuildHaveAccount()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
