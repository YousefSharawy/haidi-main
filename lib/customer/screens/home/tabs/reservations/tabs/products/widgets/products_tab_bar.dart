part of 'products_widgets_imports.dart';

class ProductsTabBar extends StatelessWidget {
  final ProductsData productsData;

  const ProductsTabBar({required this.productsData});

  @override
  Widget build(BuildContext context) {
    List titles = [
      tr(context, 'waiting'),
      tr(context, 'current'),
      tr(context, 'finished'),
    ];
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: productsData.index,
      builder: (context, state) {
        return Center(
          child: SizedBox(
            height: 70,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (_, index) => ProductsTabBarItem(
                  index: state.data,
                  onTap: () async {
                    productsData.index.onUpdateData(index);
                    productsData.isLoading.onUpdateData(true);
                    await productsData.getProductOrders(context, index + 1);
                  },
                  isSelected: state.data == index,
                  title: titles[index]),
            ),
          ),
        );
      },
    );
  }
}
