part of 'products_imports.dart';

class ProductsData {
  final GenericBloc<List<MarketProducts>> allProducts = GenericBloc([]);
  GenericBloc<bool> isLoading = GenericBloc<bool>(false);

  List<MarketProducts> productsList = [];
  int currentPage = 1;
  bool nextPage = true;
  int numberOfPages = 0;

  Future<void> getProducts(BuildContext context,
      {int pageNumber = 1, bool firstTime = false}) async {
    if (!firstTime) {
      isLoading.onUpdateData(true);
    }
    var products = await CustomerRepository(context).getProducts(pageNumber);
    allProducts.onUpdateData(products.marketProducts!);
    currentPage = products.pagination!.currentPage!;
    numberOfPages = products.pagination!.allPages!;
    nextPage = products.pagination!.next!;
    if (firstTime) {
      productsList = [];
    }
    products.marketProducts!.forEach((element) {
      productsList.add(element);
    });
    allProducts.onUpdateData(productsList);
    if (firstTime == false) {
      isLoading.onUpdateData(false);
    }
  }
}
