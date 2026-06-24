part of 'RegisterWidgetsImports.dart';

class BuildRegisterPic extends StatelessWidget {
  final RegisterData registerData;

  const BuildRegisterPic({Key? key, required this.registerData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
      bloc: registerData.imageCubit,
      builder: (_, state) {
        if (state.data == null) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: ()=>registerData.setImage(),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: MyColors.primary),
                    child: Icon(Icons.add_a_photo,color: Colors.white),
                  ),
                ),
                MyText(
                  title: 'اضف صورة',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.screen),
                        image: FileImage(state.data!),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        width: 5,
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: -5,
                  right: -60,
                  child: GestureDetector(
                    onTap: () => registerData.setImage(),
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(.5),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: MyColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
