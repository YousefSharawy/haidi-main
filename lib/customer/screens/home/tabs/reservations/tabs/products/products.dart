part of 'products_imports.dart';

class Products extends StatefulWidget {
  const Products();

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final ProductsData productsData = ProductsData();

  @override
  void initState() {
    productsData.getProductOrders(context, 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: MyColors.primary,
      onRefresh: () => productsData.getProductOrders(
          context, productsData.index.state.data + 1),
      child: ListView(padding: EdgeInsets.zero, children: [
        ProductsTabBar(productsData: productsData),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: productsData.isLoading,
          builder: (context, boolState) {
            return !boolState.data
                ? BlocBuilder<GenericBloc<List<ProductOrderModel>>,
                    GenericState<List<ProductOrderModel>>>(
                    bloc: productsData.productOrderModelsCubit,
                    builder: (context, state) {
                      if (state is GenericUpdateState) {
                        if (state.data.isNotEmpty) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ProductItem(
                              orderId: state.data[index].orderId ?? 0,
                              image: state.data[index].providerImage ?? '',
                              date: state.data[index].orderDate ?? '',
                              providerName:
                                  state.data[index].providerName ?? '',
                            ),
                            separatorBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Divider(
                                color: Color(0xff5D34367F),
                                height: 3,
                                thickness: 1,
                              ),
                            ),
                            itemCount: state.data.length,
                            padding: EdgeInsets.only(
                                top: 0, bottom: 40, right: 20, left: 20),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: MyText(
                                title: 'لا يوجد طلبات',
                                size: 19,
                                color: MyColors.primary,
                                alien: TextAlign.center),
                          );
                        }
                      } else {
                        return SizedBox();
                      }
                    },
                  )
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: CircularProgressIndicator(color: MyColors.primary),
                  ));
          },
        )
      ]),
    );
  }
}
