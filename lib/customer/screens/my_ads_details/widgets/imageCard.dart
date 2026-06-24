part of 'my_ads_widgets_imports.dart';

class ImageCard extends StatelessWidget {
  final GenericBloc<File?> fileCubit;
  const ImageCard({
    Key? key,
   required this.fileCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: MyColors.greyWhite,
                  blurRadius: 1,
                  spreadRadius: .1,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image:
                    FileImage(fileCubit.state.data??File('')),
                fit: BoxFit.cover,

              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: InkWell(
              onTap: () {
                
                fileCubit.onUpdateData(null);
              },
              child: CircleAvatar(
                radius: 17,
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: MyColors.white,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
