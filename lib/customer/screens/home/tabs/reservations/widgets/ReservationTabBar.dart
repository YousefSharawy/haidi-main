part of 'ReservationsWidgetsImports.dart';

class ReservationTabBar extends StatelessWidget {
  ReservationTabBar({required this.reservationsData});

  final ReservationsData reservationsData;

  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: reservationsData.index,
      builder: (context, state) {
        return TabBar(
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelPadding: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          labelColor: MyColors.white,
          unselectedLabelColor: MyColors.primary,
          indicator: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: (v) {
            reservationsData.index.onUpdateData(v);
          },
          tabs: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              width: MediaQuery.of(context).size.width * .45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyColors.primary)),
              child: Text(
                tr(context, "services"),
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              width: MediaQuery.of(context).size.width * .44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyColors.primary)),
              child: Text(
                tr(context, 'products'),
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
