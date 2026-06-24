part of 'ForgetPasswordImports.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgerPasswordData forgerPasswordData = new ForgerPasswordData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Image.asset(
              Res.background,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              physics: const BouncingScrollPhysics(),
              children: [
                Hero(
                    tag: 'logoTag',
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Image.asset(Res.logo))),
                BuildText(),
                BuildFormInputs(forgerPasswordData: forgerPasswordData),
                BuildButton(forgerPasswordData: forgerPasswordData),
              ],
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: GestureDetector(
    //     onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage(Res.background),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       child: Align(
    //         alignment: Alignment(0, 5),
    //         child: Container(
    //           height: 800,
    //           child: ListView(
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //             physics: NeverScrollableScrollPhysics(),
    //             children: [
    //               Hero(
    //                   tag: 'logoTag',
    //                   child: Padding(
    //                       padding: const EdgeInsets.symmetric(horizontal: 40),
    //                       child: Image.asset(Res.logo))),
    //               BuildText(),
    //               BuildFormInputs(forgerPasswordData: forgerPasswordData),
    //               BuildButton(forgerPasswordData: forgerPasswordData),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
