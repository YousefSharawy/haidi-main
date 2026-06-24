part of 'product_details_widgets_imports.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
            title: tr(context, 'description'),
            size: 12,
            fontWeight: FontWeight.bold),
        SizedBox(height: 3),
        MyText(
          title: description,
          size: 10,
          color: MyColors.black.withOpacity(0.7),
        )
      ],
    );
  }
}
