part of 'MainImports.dart';

class MainPageData {
  final GenericBloc<List<CategoryModel>> categoryModelsCubit = GenericBloc([]);

  Future<List<CategoryModel>> getCategories(BuildContext context) async {
    List<CategoryModel> categories =
        await CustomerRepository(context).getCategories();
    categoryModelsCubit.onUpdateData(categories);
    return categoryModelsCubit.state.data;
  }


}
