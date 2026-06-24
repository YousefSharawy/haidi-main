part of 'ad_details_imports.dart';

class AdDetails extends StatefulWidget {
  final int id;

  AdDetails({super.key, required this.id});

  @override
  State<AdDetails> createState() => _AdDetailsState();
}

class _AdDetailsState extends State<AdDetails> {
  AdDetailsData adDetailsData = AdDetailsData();

  @override
  void initState() {
    adDetailsData.initData(context, widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<AdDetailsModel?>,
            GenericState<AdDetailsModel?>>(
        bloc: adDetailsData.adDetailsBloc,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return HomeScaffold(
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    DefaultAppBar(title: tr(context, 'adDetails')),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: Hero(
                        tag: 'adImage',
                        child: CachedImage(
                            height: MediaQuery.of(context).size.height * .35,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            fit: BoxFit.cover,
                            url: state.data?.adImageUrls ?? ''),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: MyText(
                        title: state.data?.name ?? '',
                        size: 14,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: MyText(
                        title: state.data?.adMainCategoryName ?? '',
                        size: 10,
                        color: MyColors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: MyText(
                        title: tr(context, 'description'),
                        size: 14,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                      ),
                    ),
                    MyText(
                      title: state.data?.description ?? '',
                      size: 12,
                      color: MyColors.black,
                    ),
                  ]),
              bottom: DefaultButton(
                onTap: () {
                  Utils.callPhone(phone: state.data?.phoneNumber);
                  // settingData.updateProfile(context);
                },
                title: tr(context, 'addAd'),
                margin: EdgeInsets.zero,
                height: 55,
                fontSize: 14,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(
                          Icons.phone_in_talk,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            title: tr(context, 'phone'),
                            size: 10,
                            color: MyColors.white,
                          ),
                          MyText(
                            title: state.data?.phoneNumber ?? '',
                            size: 14,
                            fontWeight: FontWeight.bold,
                            color: MyColors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
