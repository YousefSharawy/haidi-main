part of 'settings_widgets_imports.dart';

class SettingsFormItem extends StatelessWidget {
  final String title;
  final String value;
  final bool withDivider;

  const SettingsFormItem(
      {required this.title, required this.value, required this.withDivider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 7),
        MyText(title: title, size: 12, color: MyColors.primary),
        SizedBox(height: 5),
        MyText(title: value, size: 12, color: Color(0xffB9A5A4)),
        SizedBox(height: 7),
        if (withDivider) Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: Divider(thickness: 1.5, color: Color(0xff5D34367F)),
        )
      ],
    );
  }
}
