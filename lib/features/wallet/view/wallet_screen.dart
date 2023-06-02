import 'package:flutter/material.dart';
import 'package:resourse_app/repositories/crypto_coins/crypto_coins_repositories.dart';

import '../../../repositories/models/crypto_coin/crypto_coin.dart';
import '../widgets/crypto_coin_tile.dart';

class WalletScreen extends StatefulWidget {
  static const String id = 'wallet';

  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepositories().getCoinsList();
    setState(() {});
  }

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(),
      body: _cryptoCoinsList == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        padding: const EdgeInsets.only(top: 16),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return CryptoCoinTile(coin: coin,);
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _cryptoCoinsList!.length,
            ),

    );
  }
}


