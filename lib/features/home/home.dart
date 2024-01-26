import 'package:api_coins/features/coin_page/ui/coin_page.dart';
import 'package:api_coins/features/watchlist/ui/watchlist.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Crypto Coin',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: const SafeArea(
            child: Column(
          children: [
            TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Coins',
                  ),
                  Tab(
                    text: 'Watchlist',
                  )
                ]),
            Expanded(child: TabBarView(children: [CoinPage(), WatchlistPage()]))
          ],
        )),
      ),
    );
  }
}
