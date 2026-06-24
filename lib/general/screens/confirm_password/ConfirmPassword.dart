part of 'ConfirmPasswordImports.dart';

class ConfirmPassword extends StatefulWidget {
  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  final ConfirmPasswordData confirmPasswordData = new ConfirmPasswordData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          HeaderLogo(),
          BuildText(),
          BuildFormInputs(
            confirmPasswordData: confirmPasswordData,
          ),
          BuildButtonList(
            confirmPasswordData: confirmPasswordData,
            userId: "",
          ),
        ],
      ), title: 'تغيير كلمة المرور', back: true,
    );
  }
}
