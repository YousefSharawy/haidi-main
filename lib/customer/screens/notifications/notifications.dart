part of 'notifications_imports.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final NotificationsData notificationsData = NotificationsData();

  @override
  void initState() {
    notificationsData.clientNotifications(context);
    context.read<SettingCubit>().onUpdateSettingData(SettingModel(
        productCart: context.read<SettingCubit>().state.model.productCart,
        serviceCart: context.read<SettingCubit>().state.model.serviceCart,
        notifications: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(children: [
      DefaultAppBar(title: tr(context, 'notifications')),
      Flexible(
          child: BlocBuilder<GenericBloc<List<NotifyModel>>,
              GenericState<List<NotifyModel>>>(
        bloc: notificationsData.notifyModelsCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return RefreshIndicator(
              color: MyColors.primary,
              onRefresh: () => notificationsData.clientNotifications(context),
              child: state.data.isEmpty
                  ? Center(
                      child: Text(tr(context, 'noNotifications')),
                    )
                  : ListView.separated(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      itemBuilder: (context, index) => NotificationItem(
                            text: state.data[index].text ?? '',
                            orderId: state.data[index].orderId ?? 0,
                            orderType: state.data[index].orderType ?? 0,
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemCount: state.data.length),
            );
          } else {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: CircularProgressIndicator(color: MyColors.primary),
            ));
          }
        },
      ))
    ]);
  }
}
