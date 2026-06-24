part of 'general_ads_imports.dart';

class GeneralAds extends StatefulWidget {
  const GeneralAds({super.key});

  @override
  State<GeneralAds> createState() => _GeneralAdsState();
}

class _GeneralAdsState extends State<GeneralAds> {
  GeneralAdsData generalAdsData = GeneralAdsData();
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(_scrollListener);
    generalAdsData.initData(context);
    super.initState();
  }

  // _scrollToBottom() {
  //   Future.delayed(const Duration(milliseconds: 0)).then((value) {
  //     if (_scrollController.hasClients) {
  //       _scrollController.animateTo(
  //         storeData.isPaginateLoading.state.data
  //             ? _scrollController.position.maxScrollExtent - 10
  //             : _scrollController.position.maxScrollExtent,
  //         duration: storeData.isPaginateLoading.state.data
  //             ? const Duration(milliseconds: 100)
  //             : const Duration(seconds: 20),
  //         curve: Curves.linear,
  //       );
  //     }
  //   });
  // }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (generalAdsData.index.state.data == 0) {
        if (!generalAdsData.last.state.data) {
          generalAdsData.getGeneralAds(context,
              firstTime: false, pageNumber: generalAdsData.currentPage);
        }
      }

      if (generalAdsData.index.state.data > 0) {
        if (!generalAdsData.last.state.data) {
          generalAdsData.getProductsBySubCategoryId(
              context,
              generalAdsData.subCategoriesCubit.state
                  .data[generalAdsData.index.state.data].id!,
              firstTime: true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      child: ListView(
        controller: _scrollController,
        padding: EdgeInsets.only(top: 0, bottom: 40),
        children: [
          GeneralAdsAppBar(),
          BuildSwiper(),
          BlocBuilder<GenericBloc<List<AdsSubCategoriesModel>>,
              GenericState<List<AdsSubCategoriesModel>>>(
            bloc: generalAdsData.subCategoriesCubit,
            builder: (context, parentState) {
              return BlocBuilder<GenericBloc<int>, GenericState<int>>(
                bloc: generalAdsData.index,
                builder: (context, state) {
                  return Container(
                    color: MyColors.white,
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: ListView.separated(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: parentState.data.length,
                        itemBuilder: (_, index) => StoreTabBarItem(
                          title: parentState.data[index].name!,
                          isSelected: state.data == index,
                          onTap: () async {
                            generalAdsData.index.onUpdateData(index);
                            generalAdsData.currentPage = 1;
                            generalAdsData.last.onUpdateData(false);
                            if (index == 0) {
                              generalAdsData.isLoading.onUpdateData(true);
                              await generalAdsData.getGeneralAds(context,
                                  firstTime: true);
                            } else {
                              generalAdsData.isLoading.onUpdateData(true);
                              await generalAdsData.getProductsBySubCategoryId(
                                  context, parentState.data[index].id!,
                                  pageNumber: generalAdsData.currentPage,
                                  firstTime: true);
                              generalAdsData.index.onUpdateData(index);
                            }
                          },
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: generalAdsData.isLoading,
              builder: (context, boolState) {
                return !boolState.data
                    ? BlocBuilder<GenericBloc<List<GeneralAdModel>>,
                        GenericState<List<GeneralAdModel>>>(
                        bloc: generalAdsData.allAds,
                        builder: (context, state) {
                          if (state is GenericUpdateState) {
                            return StaggeredGrid.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              children: state.data
                                  .map(
                                    (adModel) => GeneralAdCard(
                                      adModel: adModel,
                                        image: adModel.adImageUrls ?? '',
                                        title: adModel.name ?? '',
                                        generalAdsData: generalAdsData,
                                        id: adModel.id ?? 0),
                                  )
                                  .toList(),
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
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: generalAdsData.isPaginateLoading,
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
        ],
      ),
    );
  }
}
