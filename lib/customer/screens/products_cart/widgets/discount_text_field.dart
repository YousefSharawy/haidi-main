part of 'products_cart_widgets_imports.dart';

class DiscountTextField extends StatelessWidget {
  final ProductsCartData productsCartData;

  const DiscountTextField({required this.productsCartData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              GenericTextField(
                  fillColor: Colors.white,
                  radius: BorderRadius.circular(5),
                  controller: productsCartData.discountController,
                  fieldTypes: FieldTypes.normal,
                  hint: tr(context, 'insertCoupon'),
                  suffixIcon: InkWell(
                    onTap: () => productsCartData.useCopon(context),
                    child: Container(
                        alignment: Alignment.center,
                        width: 70,
                        child: MyText(
                          title: tr(context, 'active'),
                          size: 11,
                          color: MyColors.primary,
                        )),
                  ),
                  hintColor: Color(0xffACACAC),
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  validate: (value) => value!.validateEmpty(context)),
              SizedBox(height: 10),
              if (productsCartData.discount.state.data != '')
                MyText(
                    title: tr(context, 'couponDone'), size: 13, color: Colors.green)
            ],
          ),
        ),
      ],
    );
  }
}
