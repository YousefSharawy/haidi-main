part of 'general_ads_imports.dart';

class GeneralAdsData {
  late GenericBloc<int> index;
  late GenericBloc<List<GeneralAdModel>> allAds;
  late GenericBloc<bool> isLoading;
  late GenericBloc<bool> isPaginateLoading;
  late GenericBloc<bool> last;
  late GenericBloc<List<AdsSubCategoriesModel>> subCategoriesCubit;
  List<GeneralAdModel> adsList = [];
  int currentPage = 1;
  bool nextPage = true;

  Future<void> initData(BuildContext context)async {
    index = GenericBloc(0);
    allAds = GenericBloc([]);
    isLoading = GenericBloc(true);
    isPaginateLoading = GenericBloc(false);
    last = GenericBloc(false);
    subCategoriesCubit = GenericBloc([]);
    getGeneralAds(context, firstTime: true);
    getAdsSubCategories(context);
  }
  
  Future<void> getGeneralAds(BuildContext context,
      {int pageNumber = 1, bool firstTime = false}) async {
    if (!firstTime) {
      isPaginateLoading.onUpdateData(true);
    }
    var ads = await CustomerRepository(context).getGeneralAds(pageNumber);
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

  Future<void> getProductsBySubCategoryId(
      BuildContext context, int subCategoryId,
      {int pageNumber = 1, bool firstTime = false}) async {
    if (!firstTime) {
      isPaginateLoading.onUpdateData(true);
    }
    List<GeneralAdModel> ads = await CustomerRepository(context)
        .getAdsBySubCategoryId(subCategoryId, pageNumber);
    allAds.onUpdateData(ads);
    if (firstTime) {
      adsList = [];
    }
    if (ads.length < 10) {
      last.onUpdateData(true);
    }
    adsList.addAll(ads);

    allAds.onUpdateData(adsList);
    if (!firstTime) {
      isPaginateLoading.onUpdateData(false);
    }

    isLoading.onUpdateData(false);

    currentPage += 1;
  }

  Future<List<AdsSubCategoriesModel>> getAdsSubCategories(
      BuildContext context) async {
    List<AdsSubCategoriesModel> subCategories =
        await CustomerRepository(context).getAdsSubCategories();
    subCategories.insert(
        0, AdsSubCategoriesModel(id: 0, name: tr(context, 'all')));
    subCategoriesCubit.onUpdateData(subCategories);
    return subCategoriesCubit.state.data;
  }
}
