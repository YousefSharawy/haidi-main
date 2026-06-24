part of 'customer_repository_imports.dart';

class CustomerHttpMethods {
  final BuildContext context;

  CustomerHttpMethods(this.context);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<dynamic> register(RegisterModel model) async {
    final data = await GenericHttp(context).callApi(
      name: ApiNames.registerClient,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      jsonBody: model.toJson(),
      showLoader: true,
    );
    return data;
  }

  Future<bool> createServiceOrder(CreateServiceOrderModel model) async {
    final data = await GenericHttp(context).callApi(
      name: ApiNames.createServiceOrder,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      jsonBody: model.toJson(),
      showLoader: true,
    );
    CustomToast.showSimpleToast(msg: data['msg']);
    return data != null;
  }

  Future<bool> removeServiceFromCart(int id) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp(context).callApi(
      name: ApiNames.removeServiceFromCart,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      query: {'lang': lang, 'id': id},
      showLoader: true,
    );
    return data != null;
  }

  Future<dynamic> removeProductFromCart(int id) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp(context).callApi(
      name: ApiNames.removeProductFromCart,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      query: {'lang': lang, 'id': id},
      showLoader: true,
    );
    return data;
  }

  Future<dynamic> updateProductCountInCart(int productId, count) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp(context).callApi(
      name: ApiNames.updateProductCountInCart,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      query: {'lang': lang, 'ProductId': productId, 'count': count},
      showLoader: true,
    );
    return data;
  }

  Future<dynamic> useCopon(
      String coponCode, num totalPricesWithoutAnyThing) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp(context).callApi(
      name: ApiNames.useCopon,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      query: {
        'lang': lang,
        'coponCode': coponCode,
        'totalPricesWithoutAnyThing': totalPricesWithoutAnyThing
      },
      showLoader: true,
    );
    return data;
  }

  Future<List<CityModel>> getCities() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<CityModel>(context).callApi(
        name: ApiNames.registrationCities,
        returnType: ReturnType.List,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => CityModel.fromJson(json));
    return data;
  }
  Future<List<DepartmentModel>> getDepartments() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<DepartmentModel>(context).callApi(
        name: ApiNames.registrationCities,
        returnType: ReturnType.List,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => DepartmentModel.fromJson(json));
    return data;
  }

  Future<List<NotifyModel>> clientNotifications() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<NotifyModel>(context).callApi(
        name: ApiNames.clientNotifications,
        returnType: ReturnType.List,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => NotifyModel.fromJson(json));
    return data;
  }

  Future<List<SliderModel>> getSliders() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<SliderModel>(context).callApi(
        name: ApiNames.homeSliders,
        returnType: ReturnType.List,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => SliderModel.fromJson(json));
    return data;
  }

  Future<ContactUsModel> contacts() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<SliderModel>(context).callApi(
        name: ApiNames.contacts,
        returnType: ReturnType.Model,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ContactUsModel.fromJson(json));
    return data;
  }

  Future<bool> updateProfile(UpdateProfileModel model) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.updateDataUser,
      jsonBody: model.toJson(),
      returnType: ReturnType.Type,
      showLoader: true,
      methodType: MethodType.Put,
      returnDataFun: (json) => json,
    );
    if (data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user = UserModel.fromJson(data);
      user.token = GlobalState.instance.get("token");
      await Utils.saveUserData(user);
      context.read<UserCubit>().onUpdateUserData(user);
      CustomToast.showSimpleToast(msg: tr(context, 'dataUpdatedSuccessfully'));
      return true;
    }
    return true;
  }

  Future<List<CategoryModel>> getCategories() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<CategoryModel>(context).callApi(
        name: ApiNames.homeCategories,
        returnType: ReturnType.List,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => CategoryModel.fromJson(json));
    return data;
  }

  Future<SearchModel> searchWithText(String query) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<SearchModel>(context).callApi(
        name: ApiNames.searchWithText,
        returnType: ReturnType.Model,
        refresh: true,
        query: {'lang': lang, 'text': query},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => SearchModel.fromJson(json));
    return data;
  }

  Future<List<ProviderModel>> getProvidersByCategoryId(int categoryId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<ProviderModel>(context).callApi(
        name: ApiNames.providersByCategoryId,
        returnType: ReturnType.List,
        refresh: true,
        query: {'mainCategoryId': categoryId, 'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ProviderModel.fromJson(json));
    return data;
  }

  Future<List<ProviderModel>> filterInSideCategory(
      int parentId, int currentPage,
      {bool? highRated = false,
      bool? lowRated = false,
      List<int>? subCategoryIds,
      num? priceFrom,
      num? priceTo,
      int? cityId}) async {
    Map<String, dynamic> body = {
      'highRated': highRated,
      'lowRated': lowRated,
      'subCategoryIds': subCategoryIds,
      'priceFrom': priceFrom,
      'priceTo': priceTo,
      'cityId': cityId
    };
    body.removeWhere(
        (key, value) => value == null || value == 0.0 || value == false);
    print('body is $body');
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<ProviderModel>(context).callApi(
        name: ApiNames.filterInSideCategory,
        returnType: ReturnType.List,
        refresh: true,
        query: {'parentId': parentId, 'lang': lang, 'currentPage': 1},
        jsonBody: body,
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ProviderModel.fromJson(json));
    return data;
  }

  Future<List<ProviderOffersModel>> getProviderOffers(String providerId) async {
    var data = await GenericHttp<ProviderOffersModel>(context).callApi(
        name: ApiNames.providerOffers,
        returnType: ReturnType.List,
        refresh: true,
        query: {'providerId': providerId},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ProviderOffersModel.fromJson(json));
    return data;
  }

  Future<List<ProviderServicesModel>> getProviderServices(
      String providerId, int categoryType , int serviceId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<ProviderServicesModel>(context).callApi(
        name: ApiNames.providerServices,
        returnType: ReturnType.List,
        refresh: true,
        query: {
          'id' : serviceId,
          'providerId': providerId,
          'lang': lang,
          'categoryType': categoryType
        },
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ProviderServicesModel.fromJson(json));
    return data;
  }

  Future<ServiceOrderDetailsModel> getOrderDetailsForUser(int orderId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    ServiceOrderDetailsModel data = await GenericHttp<dynamic>(context).callApi(
        name: ApiNames.getServiceOrderDetailsForUser,
        returnType: ReturnType.Model,
        refresh: true,
        query: {'orderId': orderId, 'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ServiceOrderDetailsModel.fromJson(json));
    return data;
  }

  Future<ProductOrderDetailsModel> getProductOrderDetailsForUser(
      int orderId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    ProductOrderDetailsModel data = await GenericHttp<dynamic>(context).callApi(
        name: ApiNames.getProductOrderDetailsForUser,
        returnType: ReturnType.Model,
        refresh: true,
        query: {'orderId': orderId, 'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ProductOrderDetailsModel.fromJson(json));
    return data;
  }

  Future<ProductDetailsModel> getProductDetails(String productId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    ProductDetailsModel data = await GenericHttp<ProductDetailsModel>(context)
        .callApi(
            name: ApiNames.getProductDetails,
            returnType: ReturnType.Model,
            refresh: true,
            query: {'productId': productId, 'lang': lang},
            methodType: MethodType.Get,
            showLoader: false,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => ProductDetailsModel.fromJson(json));
    return data;
  }

  Future<List<OrderModel>> getOrders(int status) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<OrderModel>(context).callApi(
        name: ApiNames.listServiceOrdersByStatus,
        returnType: ReturnType.List,
        refresh: true,
        query: {'status': status, 'lang': lang},
        methodType: MethodType.Get,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => OrderModel.fromJson(json));
    return data;
  }

  Future<List<ProductOrderModel>> productOrders(int status) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<ProductOrderModel>(context).callApi(
        name: ApiNames.listProductOrdersByStatus,
        returnType: ReturnType.List,
        refresh: true,
        query: {'status': status, 'lang': lang},
        methodType: MethodType.Get,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ProductOrderModel.fromJson(json));
    return data;
  }

  Future<ProductModel> getProducts(int currentPage) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<ProductModel>(context).callApi(
        name: ApiNames.listMarketProducts,
        returnType: ReturnType.Model,
        refresh: true,
        query: {'lang': lang, 'currentPage': currentPage},
        methodType: MethodType.Get,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ProductModel.fromJson(json));
    return data;
  }
  Future<List<GeneralAdModel>> getGeneralAds(int currentPage) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    List<GeneralAdModel> data = await GenericHttp<GeneralAdModel>(context).callApi(
        name: ApiNames.allAdvertisements,
        returnType: ReturnType.List,
        refresh: true,
        query: {'lang': lang, 'currentPage': currentPage},
        methodType: MethodType.Get,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => GeneralAdModel.fromJson(json));
    return data;
  }
  Future<List<GeneralAdModel>> getMyAds(int currentPage) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    List<GeneralAdModel> data = await GenericHttp<GeneralAdModel>(context).callApi(
        name: ApiNames.clientAdvertisements,
        returnType: ReturnType.List,
        refresh: true,
        query: {'lang': lang, 'currentPage': currentPage},
        methodType: MethodType.Get,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => GeneralAdModel.fromJson(json));
    return data;
  }
  Future<List<GeneralAdModel>> getAdsBySubCategoryId(int categoryId,int currentPage) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<GeneralAdModel>(context).callApi(
        name: ApiNames.filterAdvertisementByCategoryId,
        returnType: ReturnType.List,
        refresh: true,
        query: {'categoryId':categoryId,'lang': lang, 'currentPage': currentPage},
        methodType: MethodType.Get,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => GeneralAdModel.fromJson(json));
    return data;
  }

  Future<ProductModel> getProductsBySubCategoryId(
      int subCategoryId, int currentPage) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<ProductModel>(context).callApi(
        name: ApiNames.listProductsBySubCategoryId,
        returnType: ReturnType.Model,
        refresh: true,
        query: {
          'lang': lang,
          'subCategoryId': subCategoryId,
          'currentPage': currentPage
        },
        methodType: MethodType.Get,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ProductModel.fromJson(json));
    return data;
  }
  Future<AdDetailsModel?> getAdDetails(int id) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<AdDetailsModel>(context).callApi(
        name: ApiNames.getUserAdvertisementById,
        returnType: ReturnType.Model,
        refresh: true,
        query: {
          'advId': id,
          'lang': lang
        },
        methodType: MethodType.Get,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => AdDetailsModel.fromJson(json));
    return data;
  }
  Future<AdEditDetailsModel?> getEditAdDetailsById(int id) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<AdEditDetailsModel>(context).callApi(
        name: ApiNames.getUserAdvertisementByForEditById,
        returnType: ReturnType.Model,
        refresh: true,
        query: {
          'advId': id,
          'lang': lang
        },
        methodType: MethodType.Get,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => AdEditDetailsModel.fromJson(json));
    return data!=null?data:null;
  }

  Future<List<ProviderDatesModel>> getProviderDates(String providerId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<ProviderDatesModel>(context).callApi(
        name: ApiNames.getProviderDates,
        returnType: ReturnType.List,
        refresh: true,
        query: {'providerId': providerId, 'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ProviderDatesModel.fromJson(json));
    return data;
  }

  Future<bool> addServiceToCart(AddServiceToCartModel model) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addServiceToCart,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      jsonBody: model.toJson(),
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
      context.read<SettingCubit>().onUpdateSettingData(SettingModel(
          productCart: context.read<SettingCubit>().state.model.productCart,
          serviceCart: true,
          notifications:
              context.read<SettingCubit>().state.model.notifications));
    }
    return data != null;
  }

  Future<bool> createProductOrder(CreateProductOrderModel model) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.createProductOrder,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      jsonBody: model.toJson(),
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
    }
    return data != null;
  }
  
  Future<bool> adAdd(AddAdModel model) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addNewAdvertisement,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      jsonBody: model.toJson(),
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data);
    }
    return data != null;
  }
  Future<bool> editAdd(AddAdModel model) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.updateAdvertisement,
      returnType: ReturnType.Type,
      methodType: MethodType.Patch,
      jsonBody: model.toJson(),
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data);
    }
    return data != null;
  }

  Future<bool> cancelMyServiceOrder(int orderId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<dynamic>(context).callApi(
        name: ApiNames.cancelMyServiceOrder,
        returnType: ReturnType.Type,
        methodType: MethodType.Post,
        query: {'lang': lang, 'orderId': orderId});
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
    }
    return data != null;
  }

  Future<bool> finishMyProductOrder(int orderId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<dynamic>(context).callApi(
        name: ApiNames.finishMyProductOrder,
        returnType: ReturnType.Type,
        methodType: MethodType.Post,
        query: {'lang': lang, 'orderId': orderId});
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
    }
    return data != null;
  }
  Future<bool> deleteAd(int orderId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    String query = "?AdverisementId=$orderId&lang=$lang";
    
    var data = await GenericHttp<dynamic>(context).callApi(
        name: ApiNames.deleteAd+query,
        returnType: ReturnType.Type,
        methodType: MethodType.Delete,
        );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data);
    }
    return data != null;
  }

  Future<bool> rateServiceOrder(int orderId, int rate) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<dynamic>(context).callApi(
        name: ApiNames.rateServiceOrder,
        returnType: ReturnType.Type,
        methodType: MethodType.Post,
        query: {'lang': lang, 'orderId': orderId, 'rate': rate});
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
    }
    return data != null;
  }

  Future<dynamic> addProductToCart(
      int productId, int count, String providerId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    var body = {
      'lang': lang,
      'productId': productId,
      'count': count,
      'providerId': providerId
    };
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addProductToCart,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      query: body,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
      context.read<SettingCubit>().onUpdateSettingData(SettingModel(
          productCart: true,
          serviceCart: context.read<SettingCubit>().state.model.serviceCart,
          notifications:
              context.read<SettingCubit>().state.model.notifications));
    }
    return data;
  }

  Future<List<CartServiceModel>> getCartService() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<CartServiceModel>(context).callApi(
        name: ApiNames.getServiceCart,
        returnType: ReturnType.List,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => CartServiceModel.fromJson(json));
    return data;
  }

  Future<List<SubCategoryModel>> getSubCategories(int mainCategoryId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<SubCategoryModel>(context).callApi(
        name: ApiNames.getSubCategories,
        returnType: ReturnType.List,
        refresh: true,
        query: {'lang': lang, 'mainCategoryId': mainCategoryId},
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => SubCategoryModel.fromJson(json));
    return data;
  }

  Future<CartServiceDetailsModel> getServiceCartDetails(
      String providerId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    CartServiceDetailsModel data =
        await GenericHttp<CartServiceDetailsModel>(context).callApi(
            name: ApiNames.getServiceCartDetails,
            returnType: ReturnType.Model,
            refresh: true,
            query: {'lang': lang, 'providerId': providerId},
            methodType: MethodType.Get,
            showLoader: false,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => CartServiceDetailsModel.fromJson(json));
    return data;
  }

  Future<num?> getWallet() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<String>(context).callApi(
        name: ApiNames.getWallet,
        returnType: ReturnType.Type,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data["wallet"]);
    // toJsonFunc: (json) => ProviderServicesModel.fromJson(json));
    return data;
  }

  Future<SettingModel> clientSettings() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    SettingModel data = await GenericHttp<SettingModel>(context).callApi(
        name: ApiNames.clientSettings,
        returnType: ReturnType.Model,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => SettingModel.fromJson(json));
    return data;
  }

  Future<List<SubCategoriesModel>> getMarketSubCategories() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    List<SubCategoriesModel> data =
        await GenericHttp<SubCategoriesModel>(context).callApi(
            name: ApiNames.listMarketSubCategories,
            returnType: ReturnType.List,
            refresh: true,
            query: {'lang': lang},
            methodType: MethodType.Get,
            showLoader: false,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => SubCategoriesModel.fromJson(json));
    return data;
  }
  Future<List<AdsSubCategoriesModel>> getAdsSubCategories() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    List<AdsSubCategoriesModel> data =
        await GenericHttp<AdsSubCategoriesModel>(context).callApi(
            name: ApiNames.clientAdvertismentMainCategories,
            returnType: ReturnType.List,
            refresh: true,
            query: {'lang': lang},
            methodType: MethodType.Get,
            showLoader: false,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => AdsSubCategoriesModel.fromJson(json));
    return data;
  }

  Future<ProductCartModel> getProductCart() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    ProductCartModel data = await GenericHttp<ProductCartModel>(context)
        .callApi(
            name: ApiNames.getProductCart,
            returnType: ReturnType.Model,
            refresh: true,
            query: {'lang': lang},
            methodType: MethodType.Get,
            showLoader: false,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => ProductCartModel.fromJson(json));
    return data;
  }
}
