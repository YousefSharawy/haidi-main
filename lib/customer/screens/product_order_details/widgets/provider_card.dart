part of'product_order_details_widgets_imports.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CachedImage(
                  width: 72,
                  height: 72,
                  borderRadius: BorderRadius.circular(72),
                  url:
                      'https://media.istockphoto.com/photos/spa-beauty-massage-health-wellness-spa-thai-therapy-treatment-for-picture-id1267147049?k=20&m=1267147049&s=612x612&w=0&h=gMDW_y7sJ5wxUhCUgBS1ZLslpgRWk0-zlSnM2Tw3CBw='),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: 'اسم مقدم الخدمة',
                    color: MyColors.primary,
                    size: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: MyColors.primary, size: 17),
                      MyText(
                        title: 'شارع عدد 23 الرياض السعودية',
                        size: 9,
                        color: MyColors.primary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Divider(
            color: Color(0xff5D34367F),
            height: 3,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
