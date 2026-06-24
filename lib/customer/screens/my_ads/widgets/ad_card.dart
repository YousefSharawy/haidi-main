part of 'my_ads_widgets_imports.dart';

class AdCard extends StatelessWidget {
  final String image;
  final String title;
  final int index;
  final int id;
  final MyAdsData myAdsData;
  const AdCard(
      {required this.image,
      required this.title,
      required this.index,
      required this.myAdsData,
       required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo(
          AdDetails(id: id),
          navigatorType: NavigatorType.push),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: Hero(
                    tag: index,
                    child: CachedImage(
                        height: 140,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        fit: BoxFit.cover,
                        url: image),
                  ),
                ),
                BlocBuilder<GenericBloc<int>,GenericState<int>>(
                  bloc: myAdsData.editBloc,
                  builder: (context,state) {
                    return PopupMenuButton(
                      onSelected: (value) {
                        switch(value){
                          case 0 :
                          myAdsData.edit(id);
                          break;
                          case 1 :
                          myAdsData.delete(context,id);
                          break;
                        }
                        myAdsData.editBloc.onUpdateData(value);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      color: Colors.white,
                      itemBuilder: (ctx) => [
                        PopupMenuItem(
                          value: 0,
                          child: Text(tr(context, 'edit')),
                          // onTap: () => myAdsData.edit(id),
                        ),
                        PopupMenuItem(
                          // onTap: () => myAdsData.delete(id),
                          value: 1,
                          child: Text(tr(context, 'delete')),
                        ),
                        // PopupMenuItem(
                        //   // onTap: () => myAdsData.delete(id),
                        //   value: 2,
                        //   child: Text(tr(context, 'report')),
                        // )
                      ],
                    );
                  }
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    title: title,
                    size: 11,
                    color: MyColors.blackOpacity,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
