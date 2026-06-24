part of 'wallet_imports.dart';

class WalletData {
  final GenericBloc<num> wallet = new GenericBloc(0);

  void fetchData(BuildContext context) async {
    var data = await CustomerRepository(context).getWallet();
    wallet.onUpdateData(data!);
  }
}
