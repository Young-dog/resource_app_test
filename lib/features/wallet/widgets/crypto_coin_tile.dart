import 'package:flutter/material.dart';

import '../../../repositories/models/crypto_coin/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: theme.textTheme.titleMedium,
      ),
      subtitle: Text(
        '${coin.priceInUSD} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      // onTap: () {
      //   AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));
      //   // Navigator.of(context).pushNamed(
      //   //   '/coin',
      //   //   arguments: coin,
      //   // );
      // },
    );
  }
}