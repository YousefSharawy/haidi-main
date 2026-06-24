part of 'notifications_imports.dart';

class NotificationsData {
  final GenericBloc<List<NotifyModel>> notifyModelsCubit = GenericBloc([]);

  Future<List<NotifyModel>> clientNotifications(BuildContext context) async {
    List<NotifyModel> notifications =
        await CustomerRepository(context).clientNotifications();
    notifyModelsCubit.onUpdateData(notifications);
    return notifyModelsCubit.state.data;
  }
}
