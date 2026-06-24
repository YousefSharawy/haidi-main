part of 'cart_imports.dart';

class Cart extends StatefulWidget {
  const Cart();

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartData cartData = CartData();

  @override
  void initState() {
    cartData.getCartService(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(children: [
      DefaultAppBar(title: tr(context, 'cart')),
      Flexible(
          child: BlocBuilder<GenericBloc<List<CartServiceModel>>,
              GenericState<List<CartServiceModel>>>(
        bloc: cartData.cartServiceModelsCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return state.data.isNotEmpty
                ? ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return CartItem(
                          providerId: state.data[index].id!,
                          showRate: state.data[index].rate! > 0,
                          placeName: state.data[index].providerName!,
                          rate: state.data[index].rate!,
                          location: state.data[index].location ?? '',
                          image: state.data[index].image!);
                    },
                    separatorBuilder: (context, builder) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Divider(
                          color: Color(0xff5D34367F),
                          height: 3,
                          thickness: 1,
                        ),
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Res.emptyCart, scale: 4),
                      SizedBox(height: 25),
                      MyText(
                        alien: TextAlign.center,
                        title: tr(context, 'noServicesInCart'),
                        size: 18,
                        color: MyColors.primary,
                      ),
                    ],
                  );
          } else {
            return Center(
                child: CircularProgressIndicator(color: MyColors.primary));
          }
        },
      ))
    ]);
  }
}
