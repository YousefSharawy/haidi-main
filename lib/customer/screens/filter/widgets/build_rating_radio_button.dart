part of 'filter_widgets_imports.dart';

class BuildRatingRadioButton extends StatefulWidget {
  final WorkshopsData workshopsData;

  BuildRatingRadioButton({required this.workshopsData});

  @override
  State<BuildRatingRadioButton> createState() => _BuildRatingRadioButtonState();
}

enum RatingEnum { topRated, lowestRated, unSelected }

class _BuildRatingRadioButtonState extends State<BuildRatingRadioButton> {
  RatingEnum? _ratting = RatingEnum.unSelected;

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
                      title: tr(context, 'topRated'),
                      size: 11,
                      color: MyColors.primary,
                      alien: TextAlign.start,
                    ),
                    value: RatingEnum.topRated,
                    groupValue: _ratting,
                    toggleable: true,
                    onChanged: (RatingEnum? value) {
                      setState(() {
                        _ratting = value;
                        widget.workshopsData.topRatedTypeBool
                            .onUpdateData(true);
                        widget.workshopsData.lowestRatedTypeBool
                            .onUpdateData(false);
                      });
                    },
                    contentPadding: EdgeInsets.zero)),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.42,
                child: RadioListTile(
                    activeColor: MyColors.primary,
                    title: MyText(
                      title: tr(context, 'lowestRated'),
                      size: 11,
                      color: MyColors.primary,
                      alien: TextAlign.start,
                    ),
                    value: RatingEnum.lowestRated,
                    groupValue: _ratting,
                    toggleable: true,
                    onChanged: (RatingEnum? value) {
                      setState(() {
                        _ratting = value;
                        widget.workshopsData.lowestRatedTypeBool
                            .onUpdateData(true);
                        widget.workshopsData.topRatedTypeBool
                            .onUpdateData(false);
                      });
                    },
                    contentPadding: EdgeInsets.zero)),
          ],
        ),
      ),
    );
  }
}
