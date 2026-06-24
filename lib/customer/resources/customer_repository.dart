part of 'customer_repository_imports.dart';

class CustomerRepository {
  late BuildContext _context;
  late CustomerHttpMethods _customerHttpMethods;

  CustomerRepository(BuildContext context) {
    _context = context;
    _customerHttpMethods = CustomerHttpMethods(_context);
  }

  Future<dynamic> register(RegisterModel model) =>
      _customerHttpMethods.register(model);

  Future<List<CityModel>> getCities() => _customerHttpMethods.getCities();

  Future<List<DepartmentModel>> getDepartments() => _customerHttpMethods.getDepartments();

  Future<List<SliderModel>> getSliders() => _customerHttpMethods.getSliders();

  Future<bool> updateProfile(UpdateProfileModel model) =>
      _customerHttpMethods.updateProfile(model);

  Future<List<CategoryModel>> getCategories() =>
      _customerHttpMethods.getCategories();

  Future<SearchModel> searchWithText(String query) =>
      _customerHttpMethods.searchWithText(query);

  Future<List<ProviderModel>> getProvidersByCategoryId(int categoryId) =>
      _customerHttpMethods.getProvidersByCategoryId(categoryId);

  Future<List<ProviderModel>> filterInSideCategory(
          int parentId, int currentPage,
          {bool highRated = false,
          bool lowRated = false,
          List<int>? subCategoryIds = const [],
          num? priceFrom,
          num? priceTo,
          int? cityId}) =>
      _customerHttpMethods.filterInSideCategory(parentId, currentPage,
          highRated: highRated,
          lowRated: lowRated,
          subCategoryIds: subCategoryIds,
          priceTo: priceTo,
          priceFrom: priceFrom,
          cityId: cityId);

  Future<List<ProviderOffersModel>> getProvidersOffers(String providerId) =>
      _customerHttpMethods.getProviderOffers(providerId);

  Future<List<ProviderServicesModel>> getProviderServices(
          String providerId, int categoryType, int serviceId) =>
      _customerHttpMethods.getProviderServices(providerId, categoryType , serviceId);

  Future<ContactUsModel> contacts() => _customerHttpMethods.contacts();

  Future<List<OrderModel>> getOrders(int status) =>
      _customerHttpMethods.getOrders(status);

  Future<List<ProductOrderModel>> productOrders(int status) =>
      _customerHttpMethods.productOrders(status);

  Future<ProductModel> getProducts(int currentPage) =>
      _customerHttpMethods.getProducts(currentPage);

  Future<List<GeneralAdModel>> getGeneralAds(int currentPage) =>
      _customerHttpMethods.getGeneralAds(currentPage);

  Future<AdDetailsModel?> getAdDetails(int id) =>
      _customerHttpMethods.getAdDetails(id);

  Future<List<GeneralAdModel>> getMyAds(int currentPage) =>
      _customerHttpMethods.getMyAds(currentPage);

  Future<ProductModel> getProductsBySubCategoryId(
          int subCategoryId, int currentPage) =>
      _customerHttpMethods.getProductsBySubCategoryId(
          subCategoryId, currentPage);

  Future<List<GeneralAdModel>> getAdsBySubCategoryId(int mainCategoryId,int currentPage) =>
      _customerHttpMethods.getAdsBySubCategoryId(mainCategoryId,currentPage);

  Future<List<ProviderDatesModel>> getProviderDates(String providerId) =>
      _customerHttpMethods.getProviderDates(providerId);

  Future<List<NotifyModel>> clientNotifications() =>
      _customerHttpMethods.clientNotifications();

  Future<List<CartServiceModel>> getCartService() =>
      _customerHttpMethods.getCartService();

  Future<List<SubCategoryModel>> getSubCategories(int mainCategoryId) =>
      _customerHttpMethods.getSubCategories(mainCategoryId);

  Future<ServiceOrderDetailsModel> getOrderDetailsForUser(int orderId) =>
      _customerHttpMethods.getOrderDetailsForUser(orderId);

  Future<ProductOrderDetailsModel> getProductOrderDetailsForUser(int orderId) =>
      _customerHttpMethods.getProductOrderDetailsForUser(orderId);

  Future<ProductDetailsModel> getProductDetails(String productId) =>
      _customerHttpMethods.getProductDetails(productId);

  Future<CartServiceDetailsModel> getServiceCartDetails(String providerId) =>
      _customerHttpMethods.getServiceCartDetails(providerId);

  Future<num?> getWallet() => _customerHttpMethods.getWallet();

  Future<SettingModel> clientSettings() =>
      _customerHttpMethods.clientSettings();

  Future<ProductCartModel> getProductCart() =>
      _customerHttpMethods.getProductCart();

  Future<bool> removeServiceFromCart(int id) =>
      _customerHttpMethods.removeServiceFromCart(id);

  Future<dynamic> removeProductFromCart(int id) =>
      _customerHttpMethods.removeProductFromCart(id);

  Future<dynamic> updateProductCountInCart(int productId, count) =>
      _customerHttpMethods.updateProductCountInCart(productId, count);

  Future<bool> createServiceOrder(CreateServiceOrderModel model) =>
      _customerHttpMethods.createServiceOrder(model);

  Future<bool> addServiceToCart(AddServiceToCartModel model) =>
      _customerHttpMethods.addServiceToCart(model);

  Future<bool> createProductOrder(CreateProductOrderModel model) =>
      _customerHttpMethods.createProductOrder(model);

  Future<bool> adAdd(AddAdModel adDetailsModel) =>
      _customerHttpMethods.adAdd(adDetailsModel);

  Future<bool> editAdd(AddAdModel adDetailsModel) =>
      _customerHttpMethods.editAdd(adDetailsModel);

  Future<bool> cancelMyServiceOrder(int orderId) =>
      _customerHttpMethods.cancelMyServiceOrder(orderId);

  Future<bool> finishMyProductOrder(int orderId) =>
      _customerHttpMethods.finishMyProductOrder(orderId);

  Future<bool> deleteAd(int orderId) =>
      _customerHttpMethods.deleteAd(orderId);

  Future<bool> rateServiceOrder(int orderId, int rate) =>
      _customerHttpMethods.rateServiceOrder(orderId, rate);

  Future<dynamic> useCopon(String coponCode, num totalPricesWithoutAnyThing) =>
      _customerHttpMethods.useCopon(coponCode, totalPricesWithoutAnyThing);

  Future<List<SubCategoriesModel>> getMarketSubCategories() =>
      _customerHttpMethods.getMarketSubCategories();

  Future<List<AdsSubCategoriesModel>> getAdsSubCategories() =>
      _customerHttpMethods.getAdsSubCategories();
      
  Future<AdEditDetailsModel?> getEditAdDetailsById(int id) =>
      _customerHttpMethods.getEditAdDetailsById(id);

  Future<dynamic> addProductToCart(
          int productId, int count, String providerId) =>
      _customerHttpMethods.addProductToCart(productId, count, providerId);
}
