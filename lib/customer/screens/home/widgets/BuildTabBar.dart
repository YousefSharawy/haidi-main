part of 'HomeWidgetImports.dart';

class BuildTabBar extends StatelessWidget {
  const BuildTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: TabBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        labelColor: MyColors.white,
        indicatorColor: MyColors.primary,
        unselectedLabelColor: MyColors.offWhite.withOpacity(.7),
        tabs: [
          const Icon(Icons.home, size: 25),
          const Icon(Icons.assignment, size: 25),
          const Icon(Icons.person, size: 25)
        ],
      ),
    );
  }
}
