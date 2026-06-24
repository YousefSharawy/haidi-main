part of 'RegisterWidgetsImports.dart';

class BuildRegisterInputs extends StatelessWidget {
  final RegisterData registerData;

  const BuildRegisterInputs({required this.registerData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, 'username'),
            controller: registerData.name,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, 'phone'),
            controller: registerData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.phone,
            validate: (value) => value!.validatePhone(context),
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, 'mail'),
            controller: registerData.email,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmail(context),
          ),
          DropdownTextField<CityModel?>(
            itemAsString: (dynamic u) => u.name,
            dropKey: registerData.cityKey,
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
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            onChange: registerData.selectCity,
            useName: true,
            searchHint: tr(context, 'search'),
            selectedItem: registerData.cityModel,
            finData: (v) async => await CustomerRepository(context).getCities(),
          ),
          BlocConsumer<LocationCubit, LocationState>(
            bloc: registerData.locationCubit,
            listener: (_, state) {
              registerData.address = state.model?.address ?? "";
              registerData.lat = state.model?.lat.toString();
              registerData.lng = state.model?.lng.toString();
              registerData.location.text = state.model?.address ?? "";
            },
            builder: (_, state) {
              return GenericTextField(
                fieldTypes: FieldTypes.clickable,
                hint: tr(context, 'determineAddress'),
                margin: const EdgeInsets.symmetric(vertical: 5),
                type: TextInputType.none,
                controller: registerData.location,
                validate: (value) => value!.validateEmpty(context),
                action: TextInputAction.next,
                suffixIcon: Icon(Icons.location_on, color: MyColors.primary),
                onTab: () => registerData.onLocationClick(context),
              );
            },
          ),
          BlocBuilder<GenericBloc, GenericState>(
            bloc: registerData.passwordBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                hint: tr(context, 'password'),
                controller: registerData.password,
                action: TextInputAction.next,
                type: TextInputType.text,
                validate: (value) => value!.validatePassword(context),
                suffixIcon: IconButton(
                  icon: state.data
                      ? Icon(
                          Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_off,
                          size: 20,
                          color: Colors.grey,
                        ),
                  onPressed: () {
                    registerData.passwordBloc.onUpdateData(!state.data);
                  },
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
              );
            },
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: registerData.confirmPasswordBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                hint: tr(context, 'confirmPassword'),
                controller: registerData.confirmPassword,
                action: TextInputAction.done,
                type: TextInputType.text,
                margin: const EdgeInsets.only(top: 10, bottom: 5),
                validate: (value) => value!.validatePasswordConfirm(context,
                    pass: registerData.password.text),
                suffixIcon: IconButton(
                  icon: state.data
                      ? Icon(
                          Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_off,
                          size: 20,
                          color: Colors.grey,
                        ),
                  onPressed: () {
                    registerData.confirmPasswordBloc.onUpdateData(!state.data);
                  },
                ),
                onSubmit: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
