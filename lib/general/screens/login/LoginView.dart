part of 'LoginImports.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final loginData = LoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginData.formKey,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Image.asset(
                Res.background,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            ListView(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Image.asset(Res.logo)),
                BuildText(),
                SizedBox(height: 5),
                BuildFormInputs(loginData: loginData),
                BuildLoginButton(loginData: loginData),
                BuildForgetText(),
                BuildNewRegister(),
                BuildVisitorButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
