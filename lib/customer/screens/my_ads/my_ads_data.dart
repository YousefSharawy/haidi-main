part of 'my_ads_imports.dart';

class MyAdsData {
  late GenericBloc<int> editBloc;
  late GenericBloc<int> index;
  late GenericBloc<List<GeneralAdModel>> allAds;
  late GenericBloc<bool> isLoading = GenericBloc(true);
  late GenericBloc<bool> isPaginateLoading;
  late GenericBloc<bool> last;
  List<GeneralAdModel> adsList = [];
  int currentPage = 1;
  bool nextPage = true;

  Future<void> initData(BuildContext context) async {
    index = GenericBloc(0);
    editBloc = GenericBloc(0);
    allAds = GenericBloc([]);
    isLoading = GenericBloc(true);
    isPaginateLoading = GenericBloc(false);
    last = GenericBloc(false);
    getGeneralAds(context, firstTime: true);
  }

  Future<void> getGeneralAds(BuildContext context,
      {int pageNumber = 1, bool firstTime = false}) async {
    if (!firstTime) {
      isPaginateLoading.onUpdateData(true);
    }
    var ads = await CustomerRepository(context).getMyAds(pageNumber);
    allAds.onUpdateData(ads);

    if (firstTime) {
      adsList = [];
    }
    adsList.addAll(ads);

    allAds.onUpdateData(adsList);
    if (!firstTime) {
      isPaginateLoading.onUpdateData(false);
    }
    if (ads.length < 10) {
      last.onUpdateData(true);
    }
    isLoading.onUpdateData(false);

    currentPage += 1;
  }

  void delete(BuildContext context, int id) async {
    var response = await CustomerRepository(context).deleteAd(id);
    if (response) {
      allAds.state.data.removeWhere((element) => element.id == id);
      allAds.onUpdateData(allAds.state.data);
      // List<GeneralAdModel> list =allAds.state.data;
      // list.firstWhere((model)=>model.id == id);
      // allAds.onUpdateData(list);
    }
  }

  void edit(int id) {
    Nav.navigateTo(MyAdsDetails(edit: true, id: id),
        navigatorType: NavigatorType.push);
  }
}
