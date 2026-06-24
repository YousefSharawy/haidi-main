part of 'cart_imports.dart';

class CartData {
  final GenericBloc<List<CartServiceModel>> cartServiceModelsCubit =
      GenericBloc([]);

  Future<List<CartServiceModel>> getCartService(BuildContext context) async {
    List<CartServiceModel> cartServices =
        await CustomerRepository(context).getCartService();
    cartServiceModelsCubit.onUpdateData(cartServices);
    return cartServiceModelsCubit.state.data;
  }
}
