part of 'ContactUsImports.dart';

class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final ContactUsData contactUsData = ContactUsData();

  @override
  void initState() {
    contactUsData.getContactUs(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      children: [
        DefaultAppBar(
          title: tr(context, 'contactUs'),
        ),
        BlocBuilder<GenericBloc<ContactUsModel?>,
            GenericState<ContactUsModel?>>(
          bloc: contactUsData.contactUsCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  MyText(
                      title: tr(context, 'contactUsWithNumbers'),
                      size: 14,
                      color: MyColors.primary),
                  SizedBox(height: 10),
                  MyText(
                      title: state.data!.phoneNumber ?? '',
                      size: 14,
                      color: Color(0xffB9A5A4)),
                  SizedBox(height: 10),
                  MyText(
                      title: tr(context, 'orContactUsVia'),
                      size: 14,
                      color: MyColors.primary),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (_, index) => SizedBox(width: 6),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.data!.sociaMedias!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () => Utils.launchURL(
                            url: state.data!.sociaMedias![index].url!),
                        child: CachedImage(
                            width: 40,
                            borderRadius: BorderRadius.circular(10),
                            url: state.data!.sociaMedias![index].img!),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Flexible(
                child: Center(
                    child: CircularProgressIndicator(color: MyColors.primary)),
              );
            }
          },
        ),
      ],
    );
  }
}
