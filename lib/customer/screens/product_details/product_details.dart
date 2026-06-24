part of 'product_details_imports.dart';

class ProductDetails extends StatefulWidget {
  final String productId;
  final String providerId;

  const ProductDetails({required this.productId, required this.providerId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductDetailsData productDetailsData = ProductDetailsData();

  @override
  void initState() {
    productDetailsData.getProductDetails(context, widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<ProductDetailsModel?>,
            GenericState<ProductDetailsModel?>>(
        bloc: productDetailsData.productDetailsModelsCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return Scaffold(
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      toolbarHeight: MediaQuery.of(context).size.height * 0.37,
                      flexibleSpace: ProductImage(
                          id: state.data!.id.toString(),
                          image: state.data!.productImage ?? ''),
                    )
                  ];
                },
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ProductInfo(
                      productName: state.data!.title ?? '',
                      price: state.data!.price ?? 0,
                      providerName: state.data!.providerName ?? '',
                      productDetailsData: productDetailsData,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductDescription(
                            description: state.data!.description ?? '',
                          ),
                          SizedBox(height: 15),
                          ProductFeatures(features: state.data!.features ?? [])
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: DefaultButton(
                  onTap: () async {
                    final auth = context.read<AuthCubit>().state.authorized;
                    if (!auth) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(authDialog: true);
                        },
                      );
                    } else {
                      var data = await CustomerRepository(context)
                          .addProductToCart(
                              state.data!.id!,
                              productDetailsData.count.state.data,
                              widget.providerId);
                      if (data != null) {
                        productDetailsData.showMyDialog(
                            context, state.data!.title ?? '');
                        productDetailsData.totalPrices
                            .onUpdateData(data['totalPrices']);
                        productDetailsData.count.onUpdateData(1);
                      }
                    }
                  },
                  title: tr(context, 'addToCart'),
                  margin: EdgeInsets.zero,
                  height: 50,
                  fontSize: 14,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(color: MyColors.primary));
          }
        });
  }
}
