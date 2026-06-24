part of 'search_screen_imports.dart';

class CustomSearchDelegate extends SearchDelegate {
  final bool searchIsGeneral;
  final String? searchType;
  final SearchScreenData searchDate = SearchScreenData();

  CustomSearchDelegate({required this.searchIsGeneral,this.searchType});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: Icon(Icons.clear, color: MyColors.primary),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios, color: MyColors.primary, size: 20),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    searchDate.searchWithText(context, query, searchIsGeneral);
    return BlocBuilder<GenericBloc<SearchModel?>, GenericState<SearchModel?>>(
      bloc: searchDate.searchModelsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state.data!.searchResult!.isNotEmpty) {
            return ListView.builder(
              itemCount: state.data!.searchResult!.length,
              itemBuilder: (context, index) {
                return SearchCard(
                    categoryType:
                        state.data!.searchResult![index].categoryType ?? 0,
                    categoryName:
                        state.data!.searchResult![index].categoryName ?? '',
                    searchScreenData: searchDate,
                    index: index,
                    image: state.data!.searchResult![index].imgUrl ?? '',
                    name: state.data!.searchResult![index].name ?? '',
                    type: state.data!.searchResult![index].type ?? '',
                    id: int.parse(state.data?.searchResult![index].id??"0"),
                    );
              },
            );
          } else {
            return Center(
                child: MyText(
              title: tr(context, 'searchForItems'),
              size: 12,
              color: MyColors.primary,
            ));
          }
        } else {
          return Center(
              child: CircularProgressIndicator(color: MyColors.primary));
        }
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    // List<String> matchQuery = [];
    // for (var fruit in searchTerms) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }
    // return ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     var result = matchQuery[index];
    //     return ListTile(
    //       title: Text(result),
    //     );
    //   },
    // );
    return SizedBox();
  }
}
