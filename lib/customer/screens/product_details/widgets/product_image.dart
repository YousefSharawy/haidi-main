part of 'product_details_widgets_imports.dart';

class ProductImage extends StatelessWidget {
  final String id;
  final String image;

  const ProductImage({required this.id, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: id,
          child: CachedImage(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              fit: BoxFit.cover,
              url: image),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25, 60, 0, 0),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                color: MyColors.primary,
                size: 25,
              ),
            ),
          ),
        )
      ],
    );
  }
}
