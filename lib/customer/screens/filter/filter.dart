part of 'filter_imports.dart';

class Filter extends StatelessWidget {
  final int categoryId;
  final WorkshopsData workshopsData;

  const Filter({required this.workshopsData, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      children: [
        DefaultAppBar(title: ''),
        Flexible(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                TitleContainer(title: tr(context, 'rating')),
                BuildRatingRadioButton(workshopsData: workshopsData),
                TitleContainer(title: tr(context, 'servicesTypes')),
                BuildCheckBoxes(
                    workshopsData: workshopsData, categoryId: categoryId),
                TitleContainer(title: tr(context, 'price')),
                BuildFilterPriceRange(workshopsData: workshopsData),
                DropdownTextField<CityModel?>(
                  itemAsString: (dynamic u) => u.name,
                  dropKey: workshopsData.cityKey,
                  hint: tr(context, 'city'),
                  validate: (value) {
                    return null;
                  },
                  fontSize: 10,
                  textSize: 12,
                  fillColor: MyColors.secondary,
                  radius: BorderRadius.circular(50),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  onChange: workshopsData.selectCity,
                  useName: true,
                  searchHint: tr(context, 'search'),
                  selectedItem: workshopsData.cityModel,
                  finData: (v) async =>
                      await CustomerRepository(context).getCities(),
                ),
              ]),
        )
      ],
      bottom: DefaultButton(
        height: 56,
        margin: EdgeInsets.zero,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        onTap: () {
          workshopsData.filter(context, categoryId);
          Navigator.of(context).pop();
        },
        title: tr(context, 'search'),
      ),
    );
  }
}
