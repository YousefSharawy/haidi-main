part of 'workshop_widgets_imports.dart';

class Offers extends StatefulWidget {
  final String providerId;
  final WorkshopData workshopData;

  const Offers({required this.workshopData, required this.providerId});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  void initState() {
    widget.workshopData.getProviderOffers(context, widget.providerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<ProviderOffersModel>>,
        GenericState<List<ProviderOffersModel>>>(
      bloc: widget.workshopData.providerOffersModelsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return state.data.length == 0 ? Center(child: MyText(title: tr(context, 'noOffer'), size: 12)) : ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.data.length,
            itemBuilder: (context, index) => CachedImage(
              height: MediaQuery.of(context).size.height * .19,
              borderRadius: BorderRadius.circular(25),
              fit: BoxFit.cover,
              url: state.data[index].image!,
            ),
            separatorBuilder: (context, index) => SizedBox(height: 7),
          );
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
