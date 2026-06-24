part of 'MainWidgetImports.dart';

class BuildMainItems extends StatefulWidget {
  final MainPageData mainPageData;

  const BuildMainItems({required this.mainPageData});

  @override
  State<BuildMainItems> createState() => _BuildMainItemsState();
}

class _BuildMainItemsState extends State<BuildMainItems> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<CategoryModel>>,
        GenericState<List<CategoryModel>>>(
      bloc: widget.mainPageData.categoryModelsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return GridView.builder(
            padding: EdgeInsets.only(bottom: 40),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 8 / 9),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.data.length,
            itemBuilder: (context, index) => MainItem(
                page: state.data[index].type! == 0
                    ? Store()
                    : Workshops(
                        categoryId: state.data[index].id!,
                        appBarName: state.data[index].name!,
                        categoryType: state.data[index].type!,
                      ),
                imageUrl: state.data[index].image!,
                title: state.data[index].name),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: CircularProgressIndicator(
                color: MyColors.primary,
              ),
            ),
          );
        }
      },
    );
  }
}
