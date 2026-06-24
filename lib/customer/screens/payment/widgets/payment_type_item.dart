part of 'payment_widgets_imports.dart';

class PaymentTypeItem extends StatelessWidget {
  final int index;
  final String type;
  final String image;
  final PaymentData paymentData;
  final bool isSelected;

  const PaymentTypeItem(
      {required this.type,
      required this.image,
      required this.isSelected,
      required this.index,
      required this.paymentData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => paymentData.paymentSelect.onUpdateData(index),
      leading: Image.asset(image, scale: 3, fit: BoxFit.fill),
      title: MyText(title: type, size: 11, fontWeight: FontWeight.bold),
      trailing: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: paymentData.paymentSelect,
        builder: (context, state) {
          return Visibility(
            visible: state.data == index,
            child: Container(
              padding: EdgeInsets.all(3),
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                  color: MyColors.primary, shape: BoxShape.circle),
              child: Icon(Icons.check, color: Colors.white, size: 13),
            ),
            replacement: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.grey),
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
