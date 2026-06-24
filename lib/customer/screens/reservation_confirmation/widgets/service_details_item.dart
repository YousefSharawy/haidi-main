part of 'reservation_confirmation_widgets_imports.dart';

class ServiceDetailsItem extends StatelessWidget {
  final ServicesItem servicesItem;
  final int index;
  final ReservationConfirmationData reservationConfirmationData;

  const ServiceDetailsItem(
      {required this.servicesItem,
      required this.reservationConfirmationData,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xffF7F5F5)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => reservationConfirmationData.removeItemFromCart(
                    context, servicesItem.id!),
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColors.primary, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    MyText(
                        title: tr(context, 'serviceType') + ' : ',
                        size: 11,
                        color: MyColors.primary),
                    Expanded(
                      child: MyText(
                          overflow: TextOverflow.ellipsis,
                          title: servicesItem.serviceType ?? '',
                          size: 11,
                          color: Color(0xffB9A5A4)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    MyText(
                        title: tr(context, 'orderDate') + ' : ',
                        size: 11,
                        color: MyColors.primary),
                    MyText(
                        title: servicesItem.date!,
                        size: 11,
                        color: Color(0xffB9A5A4)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    MyText(
                        title: tr(context, 'servicePrice') + ' : ',
                        size: 11,
                        color: MyColors.primary),
                    MyText(
                        title: servicesItem.servicePrice!.toString() +
                            ' ' +
                            tr(context, 'sar'),
                        size: 11,
                        color: Color(0xffB9A5A4)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    MyText(
                        title: tr(context, 'orderTime') + ' : ',
                        size: 11,
                        color: MyColors.primary),
                    MyText(
                        title: servicesItem.time.contains('AM')
                            ? servicesItem.time.replaceAll('AM' ,tr(context, 'am'))
                            : servicesItem.time.contains('PM')
                                ? servicesItem.time.replaceAll('PM' , tr(context, 'pm'))
                                : servicesItem.time ?? '',
                        size: 11,
                        color: Color(0xffB9A5A4)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
