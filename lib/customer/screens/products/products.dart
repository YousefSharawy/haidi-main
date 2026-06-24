part of 'products_imports.dart';

class Products extends StatefulWidget {
  const Products();

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ProductsData productsData = ProductsData();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    productsData.getProducts(context, firstTime: true);
    super.initState();
  }

  _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          productsData.isLoading.state.data
              ? _scrollController.position.maxScrollExtent - 10
              : _scrollController.position.maxScrollExtent,
          duration: productsData.isLoading.state.data
              ? const Duration(milliseconds: 100)
              : const Duration(seconds: 20),
          curve: Curves.linear,
        );
      }
    });
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        productsData.nextPage) {
      _scrollToBottom();
      productsData
          .getProducts(context,
              firstTime: false, pageNumber: productsData.currentPage + 1)
          .then((value) {
        _scrollToBottom();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(children: [
      DefaultAppBar(title: tr(context, 'products')),
      Flexible(
          child: BlocBuilder<GenericBloc<List<MarketProducts>>,
              GenericState<List<MarketProducts>>>(
        bloc: productsData.allProducts,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return state.data.isEmpty
                ? Expanded(
                    child: Center(child: Text(tr(context, 'noProducts'))),
                  )
                : ListView(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    children: [
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        children: state.data
                            .map((productModel) => ProductCard(
                                  productModel: productModel,
                                  providerId: productModel.providerId!,
                                ))
                            .toList(),
                      ),
                      BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                        bloc: productsData.isLoading,
                        builder: (context, state) {
                          return Visibility(
                              visible: state.data,
                              child: Container(
                                padding: EdgeInsets.all(30),
                                child: Center(
                                    child: CircularProgressIndicator(
                                        color: MyColors.primary)),
                              ));
                        },
                      )
                    ],
                  );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                  child: CircularProgressIndicator(color: MyColors.primary)),
            );
          }
        },
      ))
    ]);
  }
}
