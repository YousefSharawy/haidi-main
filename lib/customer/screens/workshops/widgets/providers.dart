part of 'workshops_widgets_imports.dart';

class Providers extends StatelessWidget {
  final int categoryType;
  final WorkshopsData workshopsData;

  const Providers({required this.workshopsData, required this.categoryType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<ProviderModel>>,
        GenericState<List<ProviderModel>>>(
      bloc: workshopsData.providerModelsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => WorkshopsItem(
                    serviceId: state.data[index].id!,
                    categoryType: categoryType,
                    providerImage: state.data[index].providerImage ?? '',
                    image: state.data[index].image ?? '',
                    placeName: state.data[index].placeName ?? '',
                    providerName: state.data[index].providerName ?? '',
                    providerId: state.data[index].providerId ?? '',
                    cityName: state.data[index].cityName ?? '',
                    rate: state.data[index].rate!,
                    description: state.data[index].description ?? '',
                    showRate: state.data[index].rate! > 0,
                    location: state.data[index].location ?? '',
                    lng: double.parse(state.data[index].lng ?? '0.0') ?? 0.0,
                    lat: double.parse(state.data[index].lat ?? '0.0') ?? 0.0,
                  ),
              separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(
                      color: Color(0xff5D34367F),
                      height: 3,
                      thickness: 1,
                    ),
                  ),
              itemCount: state.data.length);
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
