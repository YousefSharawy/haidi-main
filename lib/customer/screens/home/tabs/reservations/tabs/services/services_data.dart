part of 'services_imports.dart';

class ServicesData {
  final GenericBloc<int> index = GenericBloc(0);
  final GenericBloc<bool> isLoading = GenericBloc(true);
  final GenericBloc<List<OrderModel>> orderModelsCubit = GenericBloc([]);

  Future<List<OrderModel>> getOrders(BuildContext context, int status) async {
    List<OrderModel> servicesOrders =
        await CustomerRepository(context).getOrders(status);
    orderModelsCubit.onUpdateData(servicesOrders);
    isLoading.onUpdateData(false);

    return orderModelsCubit.state.data;
  }
}
