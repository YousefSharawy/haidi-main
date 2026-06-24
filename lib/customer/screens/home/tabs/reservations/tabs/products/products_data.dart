part of 'products_imports.dart';

class ProductsData {
  final GenericBloc<int> index = GenericBloc(0);
  final GenericBloc<bool> isLoading = GenericBloc(true);

  final GenericBloc<List<ProductOrderModel>> productOrderModelsCubit = GenericBloc([]);

  Future<List<ProductOrderModel>> getProductOrders(
      BuildContext context, int status) async {
    List<ProductOrderModel> productOrders =
        await CustomerRepository(context).productOrders(status);
    productOrderModelsCubit.onUpdateData(productOrders);
    isLoading.onUpdateData(false);

    return productOrderModelsCubit.state.data;
  }
}
