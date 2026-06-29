part of 'my_ads_imports.dart';

class MyAds extends StatefulWidget {
  const MyAds({super.key});

  @override
  State<MyAds> createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  final MyAdsData myAdsData = MyAdsData();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    myAdsData.initData(context);
    _scrollController.addListener(_scrollListener);
    // TODO: implement initState
    super.initState();
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {

      if (!myAdsData.last.state.data) {
        myAdsData.isLoading.onUpdateData(false);
        myAdsData.getGeneralAds(context,
            firstTime: false, pageNumber: myAdsData.currentPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        controller: _scrollController,
        children: [
        DefaultAppBar(title: tr(context, 'myAds')),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: myAdsData.isLoading,
          builder: (context, boolState) {
            return !boolState.data
                ? BlocBuilder<GenericBloc<List<GeneralAdModel>>,
                    GenericState<List<GeneralAdModel>>>(
                    bloc: myAdsData.allAds,
                    builder: (context, state) {
                      if (state is GenericUpdateState) {
                        return StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          children: state.data.map(
                            (adModel) {
                              myAdsData.index.onUpdateData(
                                  myAdsData.index.state.data + 1);
                              return AdCard(
                                id: adModel.id??0,
                                image: adModel.adImageUrls ?? '',
                                index: myAdsData.index.state.data,
                                myAdsData: myAdsData,
                                title: adModel.name ?? '',
                                
                              );
                            },
                          ).toList(),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: MyColors.primary)),
                        );
                      }
                    },
                  )
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child:
                        CircularProgressIndicator(color: MyColors.primary),
                  ));
          },
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: myAdsData.isPaginateLoading,
            builder: (context, state) {
              return Visibility(
                  visible: state.data,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Center(
                        child:
                            CircularProgressIndicator(color: MyColors.primary)),
                  ));
            },
          )
      ]),
      bottom: DefaultButton(
        onTap: () async {
          await Nav.navigateTo(MyAdsDetails(edit: false),
              navigatorType: NavigatorType.push);
          // Reload after returning so a newly added ad shows up immediately
          // (the screen state is kept alive, so initState won't run again).
          myAdsData.currentPage = 1;
          myAdsData.last.onUpdateData(false);
          myAdsData.isLoading.onUpdateData(true);
          myAdsData.getGeneralAds(context, firstTime: true);
        },
        title: tr(context, 'addAd'),
        margin: EdgeInsets.zero,
        height: 50,
        fontSize: 14,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
    );
  }
}
