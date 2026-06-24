part of 'workshop_widgets_imports.dart';

class WorkshopTabBar extends StatelessWidget {
  final WorkshopData workshopData;

  const WorkshopTabBar({required this.workshopData});

  @override
  Widget build(BuildContext context) {
    List titles = [
      tr(context, 'information'),
      tr(context, 'services'),
      tr(context, 'offers'),
    ];
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: workshopData.index,
      builder: (context, state) {
        return SizedBox(
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 25),
            scrollDirection: Axis.horizontal,
            itemCount: titles.length,
            itemBuilder: (_, index) => WorkshopTabBarItem(
                workshopData: workshopData,
                index: state.data,
                onTap: () => workshopData.index.onUpdateData(index),
                isSelected: state.data == index,
                title: titles[index]),
          ),
        );
      },
    );
  }
}
