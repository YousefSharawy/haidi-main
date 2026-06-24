part of 'workshop_widgets_imports.dart';

class WorkshopImage extends StatelessWidget {
  final String providerImage;

  const WorkshopImage({required this.providerImage});

  @override
  Widget build(BuildContext context) {
    return CachedImage(
        borderRadius: BorderRadius.circular(25),
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height * 0.17,
        url: providerImage);
  }
}
