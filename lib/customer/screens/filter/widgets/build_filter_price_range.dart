part of 'filter_widgets_imports.dart';


class BuildFilterPriceRange extends StatelessWidget {
  final WorkshopsData workshopsData;

  const BuildFilterPriceRange({Key? key, required this.workshopsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GenericBloc<RangeValues>, GenericState<RangeValues>>(
      bloc: workshopsData.rangeValuesCubit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: "${state.data.start.round().toString()} " + tr(context, 'sar'),
                      color: MyColors.primary,
                      size: 12),
                  MyText(title: "  -  ", color: MyColors.primary, size: 12),
                  MyText(
                      title: "${state.data.end.round().toString()} " + tr(context, 'sar'),
                      color: MyColors.primary,
                      size: 12),
                ],
              ),
              RangeSlider(
                values: workshopsData.rangeValuesCubit.state.data,
                max: 5000,
                divisions: 100,
                labels: RangeLabels(
                  state.data.start.round().toString(),
                  state.data.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  workshopsData.rangeValuesCubit.onUpdateData(values);
                },
                min: 0,
                activeColor: MyColors.primary,
                // inactiveColor: MyColors.primary,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(title: '0 ' + tr(context, 'sar'), color: MyColors.primary, size: 12),
                    MyText(
                        title: '5000 ' + tr(context, 'sar'), color: MyColors.primary, size: 12),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
