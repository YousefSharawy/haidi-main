part of 'RegisterWidgetsImports.dart';

class BuildAccept extends StatelessWidget {
  final RegisterData registerData;

  const BuildAccept({required this.registerData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: registerData.checkCubit,
          builder: (_, state) {
            return Checkbox(
              value: state.data,
              onChanged: (value) {
                registerData.checkCubit.onUpdateData(value!);
              },
            );
          },
        ),
        InkWell(
          onTap: () => Nav.navigateTo( Terms(),
              navigatorType: NavigatorType.push),
          child: MyText(
            title: tr(context, "conditions"),
            color: MyColors.primary,
            size: 10,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
