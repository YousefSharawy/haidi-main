part of 'store_widgets_imports.dart';

class StoreTabBar extends StatefulWidget {
  final StoreData storeData;

  const StoreTabBar({required this.storeData});

  @override
  State<StoreTabBar> createState() => _StoreTabBarState();
}

class _StoreTabBarState extends State<StoreTabBar> {
  @override
  void initState() {
    widget.storeData.getSubCategories(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<SubCategoriesModel>>,
        GenericState<List<SubCategoriesModel>>>(
      bloc: widget.storeData.subCategoriesCubit,
      builder: (context, parentState) {
        return BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: widget.storeData.index,
          builder: (context, state) {
            return Container(
              color: MyColors.white,
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: parentState.data.length,
                  itemBuilder: (_, index) => StoreTabBarItem(
                    title: parentState.data[index].name!,
                    isSelected: state.data == index,
                    onTap: () async {
                      widget.storeData.index.onUpdateData(index);
                      if (index == 0) {
                        widget.storeData.isLoading.onUpdateData(true);
                        await widget.storeData.getProducts(context,firstTime: true);
                      } else {
                        widget.storeData.isLoading.onUpdateData(true);
                        await widget.storeData.getProductsBySubCategoryId(
                            context, parentState.data[index].id!,
                            firstTime: true);
                        widget.storeData.index.onUpdateData(index);
                      }
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
