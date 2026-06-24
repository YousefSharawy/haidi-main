part of 'ChangePassWidgetsImports.dart';

class BuildChangeForm extends StatelessWidget {
  final ChangePasswordData changePasswordData;

  const BuildChangeForm({required this.changePasswordData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: changePasswordData.formKey,
      child: Column(
        children: [
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: changePasswordData.oldPasswordBloc,
            builder: (context, state) {
              return GenericTextField(
                label: tr(context, 'oldPassword'),
                controller: changePasswordData.oldPassword,
                margin: const EdgeInsets.symmetric(vertical: 5),
                validate: (value) => value!.validatePassword(context),
                type: TextInputType.visiblePassword,
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                action: TextInputAction.next,
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
                    changePasswordData.oldPasswordBloc
                        .onUpdateData(!state.data);
                  },
                ),
              );
            },
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: changePasswordData.newPasswordBloc,
            builder: (context, state) {
              return GenericTextField(
                label: tr(context, 'newPassword'),
                controller: changePasswordData.newPassword,
                margin: const EdgeInsets.symmetric(vertical: 5),
                validate: (value) => value!.validatePassword(context),
                type: TextInputType.visiblePassword,
                fieldTypes:
                state.data ? FieldTypes.password : FieldTypes.normal,
                action: TextInputAction.next,
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
                    changePasswordData.newPasswordBloc
                        .onUpdateData(!state.data);
                  },
                ),
              );
            },
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: changePasswordData.confirmNewPasswordBloc,
            builder: (context, state) {
              return GenericTextField(
                label: tr(context, 'newPasswordConfirm'),
                controller: changePasswordData.confirmNewPassword,
                margin: const EdgeInsets.symmetric(vertical: 5),
                validate: (value) => value!.validatePassword(context),
                type: TextInputType.visiblePassword,
                fieldTypes:
                state.data ? FieldTypes.password : FieldTypes.normal,
                action: TextInputAction.done,
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
                    changePasswordData.confirmNewPasswordBloc
                        .onUpdateData(!state.data);
                  },
                ),
                onSubmit: () => changePasswordData.setChangePassword(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
