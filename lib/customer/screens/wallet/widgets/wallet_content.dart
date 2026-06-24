part of 'wallet_widgets_imports.dart';

class WalletContent extends StatelessWidget {
  final WalletData walletData;

  const WalletContent({Key? key, required this.walletData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(Res.wallet)),
        MyText(
            title: tr(context, 'currentCharge'),
            size: 17,
            color: Color(0xff989898)),
        SizedBox(height: 10),
        BlocBuilder<GenericBloc<num>, GenericState<num>>(
          bloc: walletData.wallet,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              return MyText(
                  title: state.data.toString(),
                  size: 39,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold);
            } else {
              return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(color: MyColors.primary),
                  ));
            }
          },
        ),
        MyText(title: tr(context, 'sR'), size: 16, color: MyColors.black),
      ],
    ));
  }
}
