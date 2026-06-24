part of 'workshop_widgets_imports.dart';

class WorksTime extends StatelessWidget {
  final String providerId;
  final WorkshopData workshopData;

  const WorksTime({required this.workshopData, required this.providerId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        workshopData.getProviderDates(context, providerId);
        showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xff505050),
                            borderRadius: BorderRadius.circular(5)),
                        width: 134,
                        height: 5),
                    SizedBox(height: 20),
                    Expanded(
                        child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      color: Color(0xffF8F8F8),
                      child: BlocBuilder<GenericBloc<List<ProviderDatesModel>>,
                          GenericState<List<ProviderDatesModel>>>(
                        bloc: workshopData.providerDatesModelsCubit,
                        builder: (context, state) {
                          if (state is GenericUpdateState) {
                            return ListView.separated(
                              padding: EdgeInsets.all(20),
                              itemBuilder: (BuildContext context, int index) =>
                                  BuildTimeRow(
                                day: state.data[index].dayName!,
                                from: state.data[index].from!,
                                to: state.data[index].to!,
                                isClosed: state.data[index].isClosed!,
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      SizedBox(height: 10),
                              itemCount: state.data.length,
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    )),
                    SizedBox(height: 20)
                  ],
                ),
              );
            });
      },
      child: Row(
        children: [
          MyText(
            title: tr(context, "workHours"),
            color: MyColors.primary,
            size: 10,
          ),
          Icon(Icons.keyboard_arrow_down_outlined,
              color: MyColors.primary, size: 25)
        ],
      ),
    );
  }
}
