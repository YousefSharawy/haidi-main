part of 'services_widgets_imports.dart';

class ServicesTabBar extends StatelessWidget {
  final ServicesData servicesData;

  const ServicesTabBar({required this.servicesData});

  @override
  Widget build(BuildContext context) {
    List titles = [
      tr(context, 'waiting'),
      tr(context, 'current'),
      tr(context, 'finished'),
      tr(context, 'canceled'),
    ];
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: servicesData.index,
      builder: (context, state) {
        return Center(
          child: SizedBox(
            height: 70,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              scrollDirection: Axis.horizontal,
              itemCount: titles.length,
              itemBuilder: (_, index) => ServicesTabBarItem(
                  index: state.data,
                  onTap: () async {
                    servicesData.index.onUpdateData(index);
                    servicesData.isLoading.onUpdateData(true);
                    await servicesData.getOrders(context, index + 1);
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
