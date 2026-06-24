part of 'wallet_imports.dart';

class Wallet extends StatefulWidget {
  const Wallet();

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final WalletData walletData = WalletData();

  @override
  void initState() {
    walletData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      children: [
        DefaultAppBar(title: tr(context, 'wallet'), actions: []),
        WalletContent(walletData: walletData)
      ],
      bottom: DefaultButton(
          onTap: () {},
          title: tr(context, 'walletCharging'),
          margin: EdgeInsets.zero,
          height: 50,
          fontSize: 14,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    );
  }
}
