part of 'settings_widgets_imports.dart';

class SettingsForm extends StatelessWidget {
  final SettingData settingData;

  const SettingsForm({required this.settingData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            hint: tr(context, 'username'),
            controller: settingData.name,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            hint: tr(context, 'phone'),
            controller: settingData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            hint: tr(context, 'mail'),
            controller: settingData.email,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmail(context),
          ),
          DropdownTextField<CityModel?>(
            itemAsString:(dynamic u)=>u.name ,
            dropKey: settingData.cityKey,
            hint: tr(context, 'city'),
            validate: (value) {
              return null;
            },
            fontSize: 10,
            textSize: 12,
            fillColor: MyColors.secondary,
            radius: BorderRadius.circular(50),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 0, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            onChange: settingData.selectCity,
            useName: true,
            searchHint: tr(context, 'search'),
            selectedItem: settingData.cityModel,
            finData: (v) async => await CustomerRepository(context).getCities(),
          ),
          BlocConsumer<LocationCubit, LocationState>(
            bloc: settingData.locationCubit,
            listener: (_, state) {
              settingData.address = state.model?.address ?? "";
              settingData.lat = state.model?.lat.toString();
              settingData.lng = state.model?.lng.toString();
              settingData.location.text = state.model?.address ?? "";
            },
            builder: (_, state) {
              return GenericTextField(
                fieldTypes: FieldTypes.clickable,
                hint: tr(context, 'determineAddress'),
                margin: const EdgeInsets.symmetric(vertical: 5),
                type: TextInputType.name,
                controller: settingData.location,
                validate: (value) => value!.validateEmpty(context),
                action: TextInputAction.next,
                suffixIcon: Icon(Icons.location_on, color: MyColors.primary),
                onTab: () => settingData.onLocationClick(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
