part of 'payment_imports.dart';

class Payment extends StatefulWidget {
  final String providerId;
  final String price;
  final String deliveryPrice;
  final String totalPrice;
  final String tax;
  final String vatPrice;
  final String discount;

  const Payment(
      {required this.price,
      required this.deliveryPrice,
      required this.totalPrice,
      required this.tax,
      required this.discount,
      required this.vatPrice,
      required this.providerId});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  // Created once and kept stable for the life of the screen. Previously this
  // lived inside build(), so any rebuild produced a fresh locationCubit +
  // controller — orphaning the cubit the location picker emits into, which is
  // why a picked location never showed up in the field.
  final PaymentData paymentData = PaymentData();

  @override
  Widget build(BuildContext context) {
    List<String> paymentImages = [
      Res.wallet,
      Res.mastercard,
      Res.mada,
      Res.sdad
    ];
    List<String> paymentTypes = ['محفظة', 'فيزا', 'مدى', 'سداد'];
    return HomeScaffold(
      children: [
        DefaultAppBar(title: tr(context, 'pay')),
        Flexible(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Form(
                key: paymentData.formKey,
                child: BlocConsumer<LocationCubit, LocationState>(
                  bloc: paymentData.locationCubit,
                  listener: (_, state) {
                    paymentData.address = state.model?.address ?? "";
                    paymentData.lat = state.model?.lat.toString();
                    paymentData.lng = state.model?.lng.toString();
                    paymentData.location.text = state.model?.address ?? "";
                  },
                  builder: (_, state) {
                    return GenericTextField(
                      fieldTypes: FieldTypes.clickable,
                      label: tr(context, 'determineAddress'),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      type: TextInputType.name,
                      controller: paymentData.location,
                      validate: (value) => value!.validateEmpty(context),
                      action: TextInputAction.next,
                      suffixIcon:
                          Icon(Icons.location_on, color: MyColors.primary),
                      onTab: () => paymentData.onLocationClick(context),
                    );
                  },
                )),
            SizedBox(height: 20),
            MyText(
                title: tr(context, 'payMethod'),
                size: 15,
                fontWeight: FontWeight.bold),
            ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => PaymentTypeItem(
                      type: paymentTypes[index],
                      image: paymentImages[index],
                      isSelected: paymentData.paymentSelect.state.data == index,
                      index: index,
                      paymentData: paymentData,
                    ),
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 1,
                        color: MyColors.grey,
                      ),
                    ),
                itemCount: paymentImages.length)
          ],
        ))
      ],
      bottom: TotalContainer(
        paymentData: paymentData,
        price: widget.price,
        deliveryPrice: widget.deliveryPrice,
        tax: widget.tax,
        discount: widget.discount,
        totalPrice: widget.totalPrice,
        vatPrice: widget.vatPrice,
        providerId: widget.providerId,
      ),
    );
  }
}
