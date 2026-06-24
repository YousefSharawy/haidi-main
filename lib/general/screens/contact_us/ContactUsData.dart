part of 'ContactUsImports.dart';

class ContactUsData {
  final GenericBloc<ContactUsModel?> contactUsCubit = GenericBloc(null);

  Future<ContactUsModel?> getContactUs(BuildContext context) async {
    var contactUs = await CustomerRepository(context).contacts();
    contactUsCubit.onUpdateData(contactUs);
    return contactUsCubit.state.data;
  }
}
