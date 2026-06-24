part of 'reservations_imports.dart';

class Reservations extends StatefulWidget {
  const Reservations({Key? key}) : super(key: key);

  @override
  _ReservationsState createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  final ReservationsData reservationsData = ReservationsData();

  @override
  Widget build(BuildContext context) {
    var authorized = context.read<AuthCubit>().state.authorized;
    if (authorized) {
      return DefaultTabController(
            length: 2,
            child: HomeScaffold(
              children: [
                BlocBuilder<GenericBloc<int>, GenericState<int>>(
                  bloc: reservationsData.index,
                  builder: (context, state) {
                    return DefaultAppBar(
                      title: tr(context, 'myReservations'),
                      haveCartIConButton: true,
                      haveNotifyIConButton: true,
                      isStore: state.data == 0 ? false : true,
                      leading: Container(),
                    );
                  },
                ),
                ReservationTabBar(
                  reservationsData: reservationsData,
                ),
                Flexible(
                  child: TabBarView(children: [
                    Services(),
                    Products(),
                  ]),
                )
              ],
            ),
          );
    } else {
      return Container();
    }
  }
}
