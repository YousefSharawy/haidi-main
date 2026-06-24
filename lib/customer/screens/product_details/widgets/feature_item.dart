part of 'product_details_widgets_imports.dart';

class FeatureItem extends StatelessWidget {
  final String item;

  const FeatureItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.square,
          size: 10,
        ),
        SizedBox(width: 10),
        Expanded(
          child: MyText(title: item, color: Color(0xff8A8A8A), size: 10),
        )
      ],
    );
  }
}
