part of 'workshop_widgets_imports.dart';

class ProviderServices extends StatefulWidget {
  final String providerId;
  final int categoryType;
  final int serviceId;
  final WorkshopData workshopData;

  const ProviderServices(
      {required this.workshopData,
      required this.providerId,
      required this.serviceId,
      required this.categoryType});

  @override
  State<ProviderServices> createState() => _ProviderServicesState();
}

class _ProviderServicesState extends State<ProviderServices> {
  @override
  void initState() {
    widget.workshopData
        .getProviderServices(context, widget.providerId, widget.categoryType , widget.serviceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<ProviderServicesModel>>,
        GenericState<List<ProviderServicesModel>>>(
      bloc: widget.workshopData.providerServicesModelsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state.data.isNotEmpty && widget.workshopData.servicesIsEmpty()) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.data.length,
              itemBuilder: (context, index) =>
                  state.data[index].services!.isEmpty
                      ? const SizedBox()
                      : ServicesContent(
                          categoryType: widget.categoryType,
                          workshopData: widget.workshopData,
                          title: state.data[index].subCategoryName!,
                          services: state.data[index].services!,
                          mainIndex: index,
                        ),
              separatorBuilder: (context, index) => SizedBox(height: 20),
            );
          } else {
            return Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: MyText(
                      title: tr(context, 'noServices'),
                      size: 14,
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    )));
          }
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
                child: CircularProgressIndicator(color: MyColors.primary)),
          );
        }
      },
    );
  }
}
