part of 'search_screen_imports.dart';

class SearchScreenData {
  final GenericBloc<SearchModel?> searchModelsCubit = GenericBloc(null);

  Future<void> searchWithText(
      BuildContext context, String query, bool generalSearch) async {
    //searchModelsCubit.onUpdateData(SearchModel(searchResult: []));
    if (generalSearch) {
      SearchModel searchResult =
          await CustomerRepository(context).searchWithText(query);
      searchModelsCubit.onUpdateData(searchResult);
    } else {
      SearchModel searchResult =
          await CustomerRepository(context).searchWithText(query);
      searchModelsCubit.onUpdateData(searchResult);
    }
  }

  void navigateTo(BuildContext context, int index) {
    switch (searchModelsCubit.state.data!.searchResult![index].searchType) {
      case 1:
        Nav.navigateTo(
            ProductDetails(
                productId: searchModelsCubit.state.data!.searchResult![index].id
                    .toString(),
                providerId: searchModelsCubit
                        .state.data!.searchResult![index].providerId ??
                    ''),
            navigatorType: NavigatorType.push);
        break;
      case 2:
      case 3:
        Nav.navigateTo(
            Workshop(
              serviceId: int.parse(
                  searchModelsCubit.state.data!.searchResult![index].id ?? '0'),
              img: searchModelsCubit.state.data!.searchResult![index].imgUrl ??
                  '',
              name:
                  searchModelsCubit.state.data!.searchResult![index].name ?? '',
              providerId: searchModelsCubit
                      .state.data!.searchResult![index].providerId ??
                  '',
              placeName: searchModelsCubit
                      .state.data!.searchResult![index].placeName ??
                  '',
              cityName:
                  searchModelsCubit.state.data!.searchResult![index].cityName ??
                      '',
              rate:
                  searchModelsCubit.state.data!.searchResult![index].rate ?? 0,
              description: searchModelsCubit
                      .state.data!.searchResult![index].description ??
                  '',
              providerName: searchModelsCubit
                      .state.data!.searchResult![index].providerName ??
                  '',
              providerImage: searchModelsCubit
                      .state.data!.searchResult![index].providerImage ??
                  '',
              categoryType: searchModelsCubit
                      .state.data!.searchResult![index].categoryType ??
                  1,
              lat: double.parse(
                  searchModelsCubit.state.data!.searchResult![index].lat == ''
                      ? '0.0'
                      : searchModelsCubit.state.data!.searchResult![index].lat),
              lng: double.parse(
                  searchModelsCubit.state.data!.searchResult![index].lng == ''
                      ? '0.0'
                      : searchModelsCubit.state.data!.searchResult![index].lng),
            ),
            navigatorType: NavigatorType.push);
        break;

      case 4:
        Nav.navigateTo(
            AdDetails(
                id: int.parse(
                    searchModelsCubit.state.data!.searchResult![index].id ??
                        "")),
            navigatorType: NavigatorType.push);
        break;
    }
  }
}
