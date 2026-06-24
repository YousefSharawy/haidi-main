part of 'payment_method_imports.dart';


class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr(context, 'paymentMethod')),
      body: BlocBuilder<GenericBloc<PaymentMethodEnum>, GenericState<PaymentMethodEnum>>(
        bloc: PaymentMethodData().paymentMethodCubit,
        builder: (context, state) {
          return Column(
            children: [
              RadioListTile(
                title: MyText(
                  title: tr(context, PaymentMethodEnum.Visa.name),
                  size: 12,
                  color: MyColors.primary,
                ),
                value: PaymentMethodEnum.Visa,
                groupValue: state.data,
                onChanged: (value) {
                  PaymentMethodData().selectedPaymentMethod(value!);
                },
              ),
              RadioListTile(
                title: MyText(
                  title: tr(context, PaymentMethodEnum.Master.name),
                  size: 12,
                  color: MyColors.primary,
                ),
                value: PaymentMethodEnum.Master,
                groupValue: state.data,
                onChanged: (value) {
                  PaymentMethodData().selectedPaymentMethod(value!);
                },
              ),
              RadioListTile(
                title: MyText(
                  title: tr(context, PaymentMethodEnum.Mada.name),
                  size: 12,
                  color: MyColors.primary,
                ),
                value: PaymentMethodEnum.Mada,
                groupValue: state.data,
                onChanged: (value) {
                  PaymentMethodData().selectedPaymentMethod(value!);
                },
              ),
              RadioListTile(
                title: MyText(
                  title: tr(context, PaymentMethodEnum.Sadad.name),
                  size: 12,
                  color: MyColors.primary,
                ),
                value: PaymentMethodEnum.Sadad,
                groupValue: state.data,
                onChanged: (value) {
                  PaymentMethodData().selectedPaymentMethod(value!);
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: DefaultButton(
        height: 56,
        margin: EdgeInsets.zero,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        onTap: () {
          Navigator.of(context).pop();
        },
        title: tr(context, 'confirm'),
      ),
    );
  }
}
