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
              borderRadius: BorderRadius.circular(22),
              // White circular background so the back arrow stays clearly visible
              // over any image (incl. the red placeholder when the image is missing).
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: MyColors.primary,
                  size: 22,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
