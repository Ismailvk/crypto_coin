import 'package:api_coins/features/coin_page/bloc/coin_bloc.dart';
import 'package:api_coins/model/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinWidget extends StatelessWidget {
  const CoinWidget({
    super.key,
    required this.cryptoCoin,
  });

  final CryptoModel cryptoCoin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      decoration: BoxDecoration(
          color: cryptoCoin.priceChange24H! < 0
              ? const Color.fromARGB(62, 252, 2, 2)
              : const Color.fromARGB(86, 2, 50, 3),
          borderRadius: BorderRadius.circular(5)),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black,
                      child: Text(
                        cryptoCoin.marketCapRank.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              width: 7,
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(cryptoCoin.image!))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(
                          cryptoCoin.symbol!.toUpperCase(),
                          maxLines: 1,
                          overflow: null,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              width: 7,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: ListTile(
                    title: Text(
                      cryptoCoin.name!,
                      maxLines: 1,
                      overflow: null,
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "\$ ${cryptoCoin.currentPrice}",
                        maxLines: 1,
                        overflow: null,
                        style: const TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        cryptoCoin.priceChange24H!.toStringAsFixed(2),
                        maxLines: 1,
                        overflow: null,
                        style: TextStyle(
                            color: cryptoCoin.priceChange24H! < 0
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : const Color.fromARGB(255, 0, 136, 5),
                            fontWeight: FontWeight.w400,
                            fontSize: 19),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          context.read<CoinBloc>().add(
                              WatchlistButtonClickedEvent(
                                  cryptoModel: cryptoCoin));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              '  Watchlist',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
