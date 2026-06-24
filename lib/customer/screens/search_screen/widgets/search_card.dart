part of 'search_screen_widgets_imports.dart';

class SearchCard extends StatelessWidget {
  final SearchScreenData searchScreenData;
  final int index;
  final String image;
  final String name;
  final String categoryName;
  final String type;
  final int categoryType;
  final int id;

  const SearchCard({
    required this.searchScreenData,
    required this.index,
    required this.image,
    required this.name,
    required this.type,
    required this.categoryType,
    required this.categoryName,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () => searchScreenData.navigateTo(context, index),
        child: Card(
            elevation: 2,
            color: Colors.white70.withOpacity(0.9),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedImage(
                      borderRadius: BorderRadius.circular(20),
                      fit: BoxFit.cover,
                      height: 75,
                      width: 75,
                      url: image)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                          title: name, size: 11, fontWeight: FontWeight.bold),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(title: type, size: 11, color: MyColors.black),
                          if (categoryType > 0)
                            MyText(
                                title: categoryName,
                                size: 11,
                                color: MyColors.primary),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
