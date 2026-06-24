part of 'my_ads_details_imports.dart';

class MyAdsDetailsData {
  final TextEditingController adImgs = TextEditingController();
  GenericBloc<File?> image = GenericBloc(null);
  AdsSubCategoriesModel? departmentModel;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController nameAr = TextEditingController();
  final TextEditingController nameEn = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController descAr = TextEditingController();
  final TextEditingController descEn = TextEditingController();
  final GlobalKey<DropdownSearchState> cityKey = new GlobalKey();
  final GenericBloc<List<AdsSubCategoriesModel>> subCategoriesCubit =
      GenericBloc([]);
  late GenericBloc<bool> initDataBloc;
  void selectDepartment(AdsSubCategoriesModel? model) {
    departmentModel = model != null ? model : null;
  }

  void getDepartments(BuildContext context) async {
    image.onUpdateData(null);
    File? img = await Utils.getImage();
    image.onUpdateData(img);
  }

  Future<List<AdsSubCategoriesModel>> getAdsSubCategories(
      BuildContext context) async {
    List<AdsSubCategoriesModel> subCategories =
        await CustomerRepository(context).getAdsSubCategories();
    // subCategories.insert(
    //     0, AdsSubCategoriesModel(id: 0, name: tr(context, 'all')));
    subCategoriesCubit.onUpdateData(subCategories);
    return subCategoriesCubit.state.data;
  }

  Future<void> addAd(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (departmentModel == null) {
        CustomToast.showSimpleToast(msg: tr(context, 'selectCat'));
        return;
      }
      if (image.state.data == null) {
        CustomToast.showSimpleToast(msg: tr(context, 'selectImage'));
        return;
      }

      AddAdModel adModelDetails = AddAdModel(
          nameAr: nameAr.text,
          nameEn: nameEn.text,
          adImgUrl: image.state.data,
          adMainCategoryId: departmentModel!.id,
          descriptionAr: descAr.text,
          descriptionEn: descEn.text,
          phoneNumber: phone.text);
      bool response = await CustomerRepository(context).adAdd(adModelDetails);
      if (response) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> editAd(BuildContext context, int id) async {
    if (formKey.currentState!.validate()) {
      if (departmentModel == null) {
        CustomToast.showSimpleToast(msg: tr(context, 'selectCat'));
        return;
      }
      if (image.state.data == null) {
        CustomToast.showSimpleToast(msg: tr(context, 'selectImage'));
        return;
      }

      AddAdModel adModelDetails = AddAdModel(
          id: id,
          nameAr: nameAr.text,
          nameEn: nameEn.text,
          adImgUrl: image.state.data,
          adMainCategoryId: departmentModel!.id,
          descriptionAr: descAr.text,
          descriptionEn: descEn.text,
          phoneNumber: phone.text);
      bool response = await CustomerRepository(context).editAdd(adModelDetails);
      if (response) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> initData(BuildContext context, int id) async {
    List<AdsSubCategoriesModel> cats =
        await CustomerRepository(context).getAdsSubCategories();
    AdEditDetailsModel? adEditDetailsModel =
        await CustomerRepository(context).getEditAdDetailsById(id);
    nameAr.text = "${adEditDetailsModel?.nameAr}";
    nameEn.text = "${adEditDetailsModel?.nameEn}";
    image.onUpdateData(File(adEditDetailsModel?.oldImage ?? ''));
    // firstWhere throws (No element) when the ad's category isn't in the list
    // (e.g. deleted category, or offline placeholder ids don't line up), which
    // would leave the edit screen stuck on the loading spinner forever. Fall
    // back to the first category instead of crashing.
    final matchedCats = cats.where(
        (element) => element.id == adEditDetailsModel?.adMainCategoryId);
    departmentModel = matchedCats.isNotEmpty
        ? matchedCats.first
        : (cats.isNotEmpty ? cats.first : null);
    descAr.text = "${adEditDetailsModel?.descriptionAr}";
    descEn.text = "${adEditDetailsModel?.descriptionEn}";
    phone.text = "${adEditDetailsModel?.phoneNumber}";
    initDataBloc.onUpdateData(true);
  }
}
