part of 'ad_details_imports.dart';

class AdDetailsData {
  GenericBloc<AdDetailsModel?> adDetailsBloc = GenericBloc(null);
  Future<void> initData(BuildContext context, int id) async {
    var adDetails = await CustomerRepository(context).getAdDetails(id);
    if (adDetails != null) {
      adDetailsBloc.onUpdateData(adDetails);
    }
    EasyLoading.dismiss();
  }
}
