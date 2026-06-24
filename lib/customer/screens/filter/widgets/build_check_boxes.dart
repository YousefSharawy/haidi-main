part of 'filter_widgets_imports.dart';

class BuildCheckBoxes extends StatefulWidget {
  final int categoryId;
  final WorkshopsData workshopsData;

  const BuildCheckBoxes(
      {required this.workshopsData, required this.categoryId});

  @override
  State<BuildCheckBoxes> createState() => _BuildCheckBoxesState();
}

class _BuildCheckBoxesState extends State<BuildCheckBoxes> {
  @override
  void initState() {
    widget.workshopsData.getSubCategories(context, widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<SubCategoryModel>>,
        GenericState<List<SubCategoryModel>>>(
      bloc: widget.workshopsData.subCategoryCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 15),
            shrinkWrap: true,
            itemCount: state.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 5,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => BuildCheckBoxItem(
                onTap: (value) =>
                    widget.workshopsData.checkBoxOnChange(value, index),
                selected: state.data[index].selected!,
                name: state.data[index].name ?? ''),
          );
        } else {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: CircularProgressIndicator(color: MyColors.primary),
          ));
        }
      },
    );
  }
}
