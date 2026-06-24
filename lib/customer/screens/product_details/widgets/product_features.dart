part of 'product_details_widgets_imports.dart';

class ProductFeatures extends StatelessWidget {
  final List<String> features;

  const ProductFeatures({required this.features});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
            title: tr(context, 'features'),
            size: 12,
            fontWeight: FontWeight.bold),
        SizedBox(height: 3),
        features.isEmpty
            ? Center(
                child: Text(tr(context, 'noFeatures')),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) =>
                    FeatureItem(item: features[index]),
                itemCount: features.length,
              )
      ],
    );
  }
}
