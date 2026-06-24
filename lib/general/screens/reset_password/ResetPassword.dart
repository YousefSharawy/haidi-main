part of 'ResetPasswordImports.dart';

class ResetPassword extends StatefulWidget {
  final String userId;

  const ResetPassword({required this.userId});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ResetPasswordData resetPasswordData = ResetPasswordData();

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
                      tag: 'logoTagReset',
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Image.asset(Res.logo))),
                  BuildText(),
                  BuildFormInputs(
                    resetPasswordData: resetPasswordData,
                    userId: widget.userId,
                  ),
                  BuildButton(
                    resetPasswordData: resetPasswordData,
                    userId: widget.userId,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        title: tr(context, "noReceiveCode"),
                        size: 13,
                        color: MyColors.grey,
                      ),
                      InkWell(
                        onTap: () => resetPasswordData.onResendCode(
                            context, widget.userId),
                        child: MyText(
                            title: tr(context, "sendCode"),
                            size: 13,
                            color: MyColors.primary,
                            decoration: TextDecoration.underline),
                      ),
                    ],
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
