part of 'store_imports.dart';

class Store extends StatefulWidget {
  const Store();

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final StoreData storeData = StoreData();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    storeData.getProducts(context, firstTime: true);
    super.initState();
  }

  _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 0)).then((value) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          storeData.isPaginateLoading.state.data
              ? _scrollController.position.maxScrollExtent - 10
              : _scrollController.position.maxScrollExtent,
          duration: storeData.isPaginateLoading.state.data
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
        !_scrollController.position.outOfRange) {
      if (storeData.subCategoriesCubit.state.data[0].id == 0) {
        if (storeData.nextPage) {
          _scrollToBottom();
          storeData
              .getProducts(context,
                  firstTime: false, pageNumber: storeData.currentPage + 1)
              .then((value) {
            _scrollToBottom();
          });
        }
      }
      if (storeData.index.state.data > 0) {
        if (storeData.nextPage) {
          _scrollToBottom();
          storeData
              .getProductsBySubCategoryId(
                  context,
                  storeData.subCategoriesCubit.state
                      .data[storeData.index.state.data].id!,
                  firstTime: true)
              .then((value) {
            _scrollToBottom();
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(children: [
      DefaultAppBar(
          isStore: true,
          title: tr(context, 'store'),
          haveNotifyIConButton: true,
          haveCartIConButton: true,
          leading: Container()),
      Flexible(
          child: ListView(
        controller: _scrollController,
        padding: EdgeInsets.only(top: 0, left: 10, bottom: 40, right: 10),
        children: [
          BuildSwiper(),
          StoreTabBar(storeData: storeData),
          InkWell(
            onTap: () =>
                Nav.navigateTo(Products(), navigatorType: NavigatorType.push),
            child: Container(
                padding: EdgeInsetsDirectional.only(end: 10, bottom: 10),
                alignment: AlignmentDirectional.topEnd,
                child: MyText(
                  title: tr(context, 'seeAll'),
                  size: 12,
                  color: MyColors.blackOpacity,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: storeData.isLoading,
              builder: (context, boolState) {
                return !boolState.data
                    ? BlocBuilder<GenericBloc<List<MarketProducts>>,
                        GenericState<List<MarketProducts>>>(
                        bloc: storeData.allProducts,
                        builder: (context, state) {
                          if (state is GenericUpdateState) {
                            return state.data.isEmpty
                                ? Expanded(
                                    child: Center(
                                        child: Text(tr(context, 'noProducts'))),
                                  )
                                : StaggeredGrid.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    children: state.data
                                        .map((productModel) => ProductCard(
                                            productModel: productModel,
                                            providerId:
                                                productModel.providerId!))
                                        .toList(),
                                  );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: MyColors.primary)),
                            );
                          }
                        },
                      )
                    : Center(
                        child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child:
                            CircularProgressIndicator(color: MyColors.primary),
                      ));
              },
            ),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: storeData.isPaginateLoading,
            builder: (context, state) {
              return Visibility(
                  visible: state.data,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Center(
                        child:
                            CircularProgressIndicator(color: MyColors.primary)),
                  ));
            },
          )
        ],
      ))
    ]);
  }
}
