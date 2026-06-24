part of 'workshop_widgets_imports.dart';

class BuildAddressRadioButton extends StatefulWidget {
  final WorkshopData workshopData;

  BuildAddressRadioButton({required this.workshopData});

  @override
  State<BuildAddressRadioButton> createState() =>
      _BuildAddressRadioButtonState();
}

enum AddressEnum { inSalon, inHome }

class _BuildAddressRadioButtonState extends State<BuildAddressRadioButton> {
  AddressEnum? _address = AddressEnum.inSalon;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          radioTheme: RadioThemeData(
              fillColor: MaterialStateColor.resolveWith(
                  (states) => MyColors.primary))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.42,
                child: RadioListTile(
                    title: MyText(
                      title: tr(context, 'inSalon'),
                      size: 11,
                      color: MyColors.primary,
                      alien: TextAlign.start,
                    ),
                    value: AddressEnum.inSalon,
                    groupValue: _address,
                    onChanged: (AddressEnum? value) {
                      setState(() {
                        _address = value;
                        widget.workshopData.inHome.onUpdateData(false);
                      });
                    },
                    contentPadding: EdgeInsets.zero)),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.42,
                child: RadioListTile(
                    activeColor: MyColors.primary,
                    title: MyText(
                      title: tr(context, 'inHome'),
                      size: 11,
                      color: MyColors.primary,
                      alien: TextAlign.start,
                    ),
                    value: AddressEnum.inHome,
                    groupValue: _address,
                    onChanged: (AddressEnum? value) {
                      setState(() {
                        _address = value;
                        widget.workshopData.inHome.onUpdateData(true);
                      });
                    },
                    contentPadding: EdgeInsets.zero)),
          ],
        ),
      ),
    );
  }
}
