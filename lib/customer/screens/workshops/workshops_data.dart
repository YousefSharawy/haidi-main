part of 'workshops_imports.dart';

class WorkshopsData {
  final GenericBloc<List<ProviderModel>> providerModelsCubit = GenericBloc([]);
  final GenericBloc<List<SubCategoryModel>> subCategoryCubit = GenericBloc([]);
  final GlobalKey<DropdownSearchState> cityKey = new GlobalKey();

  final GenericBloc<RangeValues> rangeValuesCubit =
      GenericBloc(RangeValues(0, 0));
  final GenericBloc<bool> topRatedTypeBool = GenericBloc(false);
  final GenericBloc<bool> lowestRatedTypeBool = GenericBloc(false);

  Future<List<ProviderModel>> getProvider(
      BuildContext context, int categoryId) async {
    List<ProviderModel> providers =
        await CustomerRepository(context).getProvidersByCategoryId(categoryId);
    providerModelsCubit.onUpdateData(providers);
    return providerModelsCubit.state.data;
  }

  Future<List<SubCategoryModel>> getSubCategories(
      BuildContext context, int categoryId) async {
    List<SubCategoryModel> subCategories =
        await CustomerRepository(context).getSubCategories(categoryId);
    subCategoryCubit.onUpdateData(subCategories);
    return subCategoryCubit.state.data;
  }

  void checkBoxOnChange(value, int index) {
    subCategoryCubit.state.data[index].selected = value;
    subCategoryCubit.onUpdateData(subCategoryCubit.state.data);
  }

  CityModel? cityModel;

  void selectCity(CityModel? model) {
    cityModel = model != null ? model : null;
  }

  List<int>? subCategoryList() {
    List<int>? intList = [];
    subCategoryCubit.state.data.forEach((element) {
      if (element.selected ?? false) {
        intList.add(element.id!);
      }
    });
    return intList;
  }

  Future<List<ProviderModel>> filter(
      BuildContext context, int categoryId) async {
    List<ProviderModel> providers =
        await CustomerRepository(context).filterInSideCategory(
      categoryId,
      1,
      highRated: topRatedTypeBool.state.data,
      lowRated: lowestRatedTypeBool.state.data,
      priceFrom: rangeValuesCubit.state.data.start,
      priceTo: rangeValuesCubit.state.data.end,
      subCategoryIds: subCategoryList()!.isEmpty ? null : subCategoryList(),
      cityId: cityModel == null ? 0 : cityModel!.id,
    );
    print('gggdddggg${topRatedTypeBool.state.data}');
    providerModelsCubit.onUpdateData(providers);
    return providerModelsCubit.state.data;
  }
}
