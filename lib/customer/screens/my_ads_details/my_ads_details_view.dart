part of 'my_ads_details_imports.dart';

class MyAdsDetails extends StatefulWidget {
  final bool edit;
  final int? id;
  const MyAdsDetails({super.key, required this.edit, this.id});

  @override
  State<MyAdsDetails> createState() => _MyAdsDetailsState();
}

class _MyAdsDetailsState extends State<MyAdsDetails> {
  MyAdsDetailsData myAdsDetailsData = MyAdsDetailsData();
  @override
  void initState() {
    myAdsDetailsData.initDataBloc=GenericBloc(!widget.edit);
    if (widget.edit) {
      myAdsDetailsData.initData(context, widget.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc:myAdsDetailsData.initDataBloc ,
      builder: (context, state) {
        if(state.data){
          return HomeScaffold(
          child: Form(
            key: myAdsDetailsData.formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                DefaultAppBar(title: tr(context, 'myAds')),
                SizedBox(
                  height: 10,
                ),
                MyText(
                  title: tr(context, 'selectDep'),
                  size: 11,
                  color: MyColors.black,
                  alien: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                DropdownTextField<AdsSubCategoriesModel?>(
                  itemAsString: (dynamic u) => u.name,
                  dropKey: myAdsDetailsData.cityKey,
                  // hint: tr(context, 'selectDep'),
                  validate: (value) {
                    return null;
                  },
                  fontSize: 10,
                  textSize: 11,
                  fillColor: MyColors.secondary,
                  radius: BorderRadius.circular(50),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  onChange: myAdsDetailsData.selectDepartment,
                  useName: true,
                  // searchHint: tr(context, 'search'),
                  selectedItem: myAdsDetailsData.departmentModel,
                  finData: (v) async =>
                      await myAdsDetailsData.getAdsSubCategories(context),
                ),
                SizedBox(
                  height: 5,
                ),
                MyText(
                  title: tr(context, 'adImg'),
                  size: 11,
                  color: MyColors.black,
                  alien: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  fieldTypes: FieldTypes.clickable,
                  // hint: tr(context, 'determineAddress'),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  type: TextInputType.name,
                  controller: myAdsDetailsData.adImgs,
                  validate: (value) => value!.noValidate(),
                  action: TextInputAction.none,
                  suffixIcon: Icon(Icons.camera_alt, color: MyColors.black),
                  onTab: () => myAdsDetailsData.getDepartments(context),
                ),
                // InkWell(onTap: () async => await Utils.getImages(), child: Container()),
                BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
                  bloc: myAdsDetailsData.image,
                  builder: (context, state) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        state.data != null
                            ? ImageCard(
                                fileCubit: myAdsDetailsData.image,
                              )
                            : Container(),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                MyText(
                  title: tr(context, 'nameAr'),
                  size: 11,
                  color: MyColors.black,
                  alien: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  fieldTypes: FieldTypes.normal,
                  // hint: tr(context, 'mail'),
                  controller: myAdsDetailsData.nameAr,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  validate: (value) => value!.validateEmpty(context),
                ),
                SizedBox(
                  height: 5,
                ),
                MyText(
                  title: tr(context, 'nameEn'),
                  size: 11,
                  color: MyColors.black,
                  alien: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  fieldTypes: FieldTypes.normal,
                  // hint: tr(context, 'mail'),
                  controller: myAdsDetailsData.nameEn,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  validate: (value) => value!.validateEmpty(context),
                ),
                SizedBox(
                  height: 5,
                ),
                MyText(
                  title: tr(context, 'contactPhone'),
                  size: 11,
                  color: MyColors.black,
                  alien: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  fieldTypes: FieldTypes.normal,
                  // hint: tr(context, 'phone'),
                  controller: myAdsDetailsData.phone,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.phone,
                  validate: (value) => value!.validatePhone(context),
                ),
                SizedBox(
                  height: 5,
                ),
                MyText(
                  title: tr(context, 'descAr'),
                  size: 11,
                  color: MyColors.black,
                  alien: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  fieldTypes: FieldTypes.normal,
                  // hint: tr(context, 'phone'),
                  maxLines: 5,
                  radius: BorderRadius.circular(20),
                  controller: myAdsDetailsData.descAr,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.newline,
                  type: TextInputType.multiline,
                  validate: (value) => value!.validateEmpty(context),
                ),
                SizedBox(
                  height: 5,
                ),
                MyText(
                  title: tr(context, 'descEn'),
                  size: 11,
                  color: MyColors.black,
                  alien: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  fieldTypes: FieldTypes.normal,
                  // hint: tr(context, 'phone'),
                  maxLines: 5,
                  radius: BorderRadius.circular(20),
                  controller: myAdsDetailsData.descEn,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.newline,
                  type: TextInputType.multiline,
                  validate: (value) => value!.validateEmpty(context),
                ),
              ],
            ),
          ),
          bottom: widget.edit
              ? DefaultButton(
                  onTap: () =>myAdsDetailsData.editAd(context,widget.id!),
                  title: tr(context, 'edit'),
                  margin: EdgeInsets.zero,
                  height: 50,
                  fontSize: 14,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                )
              : DefaultButton(
                  onTap: () => myAdsDetailsData.addAd(context),
                  title: tr(context, 'addAd'),
                  margin: EdgeInsets.zero,
                  height: 50,
                  fontSize: 14,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
        );
        }else{
          return Center(child: CircularProgressIndicator(color: MyColors.primary,));
        }
        
      },
    );
  }
}
