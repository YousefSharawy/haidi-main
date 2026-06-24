part of 'purchase_activate_imports.dart';

class PurchaseActivate extends StatelessWidget {
  const PurchaseActivate();

  @override
  Widget build(BuildContext context) {
    final PurchaseActivateData purchaseActivateData = PurchaseActivateData();
    return HomeScaffold(children: [
      DefaultAppBar(title: ''),
      Flexible(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        children: [
          Column(
            children: [
              MyText(
                  title: 'ممكن فضلك قم بتاكيد رقم الجوال للتاكيد',
                  size: 13,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 20),
              MyText(
                title:
                    'هذا النص هو مثال للنص يمكن ان يستبدل في نفس المساحة لقد تم توليد هذا النص من مولد النص العربي حيث يمكن',
                size: 11,
                color: Color(0xffA4A4A4),
              ),
              SizedBox(height: 20),
              MyText(
                title: '0096353535373',
                size: 11,
                color: Color(0xffA4A4A4),
              ),
              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: PinCodeTextField(
                  length: 4,
                  appContext: context,
                  onChanged: (String value) {},
                  backgroundColor: Colors.transparent,
                  //  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderWidth: 1.5,
                      fieldOuterPadding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      inactiveColor: Color(0xffD6D6D6),
                      activeColor: MyColors.primary,
                      selectedFillColor: MyColors.white,
                      selectedColor: MyColors.primary,
                      inactiveFillColor: MyColors.white,
                      activeFillColor: MyColors.white,
                      disabledColor: MyColors.primary),
                  animationDuration: Duration(milliseconds: 300),
                  textStyle: TextStyle(color: MyColors.primary),
                  controller: purchaseActivateData.code,
                  // validator: (value) =>
                  //     Validator(value!).validateEmpty(context, message: ''),
                ),
              ),
              SizedBox(height: 20),
              DefaultButton(
                  onTap: () {
                    // Nav.navigateTo( Payment(),
                    //     navigatorType: NavigatorType.push);
                  },
                  title: tr(context, 'confirm'),
                  margin: EdgeInsets.zero,
                  height: 45,
                  fontSize: 14,
                  borderRadius: BorderRadius.circular(25)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    title: 'ارسال الرمز تاني',
                    size: 11,
                    color: Color(0xffA4A4A4),
                  ),
                  MyText(
                    title: 'تغيير الرقم',
                    size: 11,
                    color: MyColors.primary,
                  ),
                ],
              )
            ],
          )
        ],
      ))
    ]);
  }
}
