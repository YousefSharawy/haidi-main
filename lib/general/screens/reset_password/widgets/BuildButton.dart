part of 'ResetPasswordWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final ResetPasswordData resetPasswordData;
  final String userId;

  const BuildButton({required this.resetPasswordData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      borderRadius: BorderRadius.circular(40),
      title: tr(context, "confirm"),
      onTap: () => resetPasswordData.onResetPassword(context, userId),
      color: MyColors.primary,
      margin: const EdgeInsets.symmetric(vertical: 18),
    );
  }
}
