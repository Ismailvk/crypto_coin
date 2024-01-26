import 'package:api_coins/features/coin_page/bloc/coin_bloc.dart';
import 'package:api_coins/features/home/home.dart';
import 'package:api_coins/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CoinBloc()),
        BlocProvider(create: (context) => WatchlistBloc())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
