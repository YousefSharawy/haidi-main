part of 'store_imports.dart';
class StoreData {
  final GenericBloc<int> index = GenericBloc(0);
  final GenericBloc<List<MarketProducts>> allProducts = GenericBloc([]);
  final GenericBloc<bool> isLoading = GenericBloc(true);
  final GenericBloc<bool> isPaginateLoading = GenericBloc(false);
  final GenericBloc<List<SubCategoriesModel>> subCategoriesCubit =
      GenericBloc([]);

  List<MarketProducts> productsList = [];
  int currentPage = 1;
  bool nextPage = true;

  Future<void> getProducts(BuildContext context,
      {int pageNumber = 1, bool firstTime = false}) async {
    if (!firstTime) {
      isPaginateLoading.onUpdateData(true);
    }
    var products = await CustomerRepository(context).getProducts(pageNumber);
    allProducts.onUpdateData(products.marketProducts!);
    currentPage = products.pagination!.currentPage!;
    nextPage = products.pagination!.next!;
    if (firstTime) {
      productsList = [];
    }
    products.marketProducts!.forEach((element) {
      productsList.add(element);
    });
    allProducts.onUpdateData(productsList);
    if (!firstTime) {
      isPaginateLoading.onUpdateData(false);
    }
    isLoading.onUpdateData(false);
  }

  Future<void> getProductsBySubCategoryId(
      BuildContext context, int subCategoryId,
      {int pageNumber = 1, bool firstTime = false}) async {
    if (!firstTime) {
      isPaginateLoading.onUpdateData(true);
    }
    ProductModel products = await CustomerRepository(context)
        .getProductsBySubCategoryId(subCategoryId,pageNumber);
    allProducts.onUpdateData(products.marketProducts!);
    currentPage = products.pagination!.currentPage!;
    nextPage = products.pagination!.next!;
    if (firstTime) {
      productsList = [];
    }
    productsList.addAll(products.marketProducts??[]);
    // products.marketProducts!.forEach((element) {
    //   productsList.add(element);
    // });
    allProducts.onUpdateData(productsList);
    if (!firstTime) {
      isPaginateLoading.onUpdateData(false);
    }
    isLoading.onUpdateData(false);
  }

  Future<List<SubCategoriesModel>> getSubCategories(
      BuildContext context) async {
    List<SubCategoriesModel> subCategories =
        await CustomerRepository(context).getMarketSubCategories();
    subCategories.insert(
        0, SubCategoriesModel(id: 0, name: tr(context, 'all')));
    subCategoriesCubit.onUpdateData(subCategories);
    return subCategoriesCubit.state.data;
  }
}
