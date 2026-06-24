part of 'products_cart_imports.dart';

class ProductsCartData {
  final GenericBloc<ProductCartModel?> productCartModelsCubit =
      GenericBloc(null);
  final GenericBloc<String> discount = GenericBloc('');
  final TextEditingController discountController = TextEditingController();

  Future<ProductCartModel?> getProductCart(BuildContext context) async {
    ProductCartModel productCart =
        await CustomerRepository(context).getProductCart();
    print(">>>>> ${productCart.providerId}");
    productCartModelsCubit.onUpdateData(productCart.totalPrice == null ? null : productCart);
    return productCartModelsCubit.state.data;
  }

  void increaseCount(
      int index, int productId, int count, BuildContext context) async {
    var newCount = count + 1;
    var data = await CustomerRepository(context)
        .updateProductCountInCart(productId, newCount);
    if (data != null) {
      productCartModelsCubit.state.data!.priceWithoutAnyThing =
          data['priceWithoutAnyThing'];
      productCartModelsCubit.state.data!.totalPrice = data['totalPrice'];
      productCartModelsCubit.state.data!.delivery = data['delivery'];

      productCartModelsCubit.state.data!.productsInCartCount =
          data['productsInCartCount'];

      productCartModelsCubit.state.data!.vatPrice =
      data['vatPrice'];
      productCartModelsCubit.state.data!.productsInCart![index].quantity =
          newCount;
      productCartModelsCubit.onUpdateData(productCartModelsCubit.state.data!);
    }
  }

  void decreaseCount(
      int index, int productId, int count, BuildContext context, int id) async {
    if (productCartModelsCubit.state.data!.productsInCart![index].quantity! >
        1) {
      var newCount = count - 1;
      var data = await CustomerRepository(context)
          .updateProductCountInCart(productId, newCount);

      if (data != null) {
        productCartModelsCubit.state.data!.priceWithoutAnyThing =
            data['priceWithoutAnyThing'];
        productCartModelsCubit.state.data!.totalPrice = data['totalPrice'];
        productCartModelsCubit.state.data!.delivery = data['delivery'];
        productCartModelsCubit.state.data!.productsInCartCount =
            data['productsInCartCount'];
        productCartModelsCubit.state.data!.vatPrice =
        data['vatPrice'];
        productCartModelsCubit.state.data!.productsInCart![index].quantity =
            newCount;
        productCartModelsCubit.onUpdateData(productCartModelsCubit.state.data!);
      }
    } else {
      removeItemFromCart(context, id);
    }
  }

  void removeItemFromCart(BuildContext context, int id) async {
    var data = await CustomerRepository(context).removeProductFromCart(id);
    if (data != null) {
      productCartModelsCubit.state.data!.productsInCart!.removeWhere((element) {
        return element.id == id;
      });
      productCartModelsCubit.state.data!.priceWithoutAnyThing =
          data['totalPrices'];
      productCartModelsCubit.state.data!.totalPrice = data['finalTotalPrice'];
      productCartModelsCubit.onUpdateData(productCartModelsCubit.state.data!);
      if (productCartModelsCubit.state.data!.productsInCart!.length == 0) {
        context.read<SettingCubit>().onUpdateSettingData(SettingModel(
            productCart: false,
            serviceCart: context.read<SettingCubit>().state.model.serviceCart,
            notifications:
                context.read<SettingCubit>().state.model.notifications));
      }
    }
  }

  void useCopon(BuildContext context) async {
    var data = await CustomerRepository(context).useCopon(
        discountController.text,
        productCartModelsCubit.state.data!.priceWithoutAnyThing!);
    if (data != null) {
      discount.onUpdateData(data['discountRate'].toString());
      print('>>>>>>>>${data['discountRate']}');
      print('>>>>>>>>${data['totalPriceincart']['totalPrice']}');
      productCartModelsCubit.state.data!.totalPrice = data['totalPriceincart']['totalPrice'];
      productCartModelsCubit.onUpdateData(productCartModelsCubit.state.data!);
    }
  }
}
