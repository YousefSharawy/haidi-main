part of 'MainWidgetImports.dart';

class MainItem extends StatelessWidget {
  final String imageUrl;
  final title;
  final Widget page;

  const MainItem(
      {required this.imageUrl, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: page,
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: Platform.isIOS
            ? PageTransitionAnimation.cupertino
            : PageTransitionAnimation.fade,
      ),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: CachedImage(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        fit: BoxFit.cover,
                        url: imageUrl)),
              ),
              SizedBox(height: 7.5),
              MyText(
                title: title,
                size: 13,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
