import 'package:api_coins/features/coin_page/bloc/coin_bloc.dart';
import 'package:api_coins/features/coin_page/ui/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({super.key});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  @override
  void initState() {
    context.read<CoinBloc>().add(FetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: BlocConsumer<CoinBloc, CoinState>(
        listenWhen: (previous, current) => current is CoinActionState,
        buildWhen: (previous, current) => current is! CoinActionState,
        listener: (context, state) {
          if (state is CoinAddToWatchlist) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Add to Watchlist'),
              backgroundColor: Colors.green,
            ));
          }
        },
        builder: (context, state) {
          if (state is CoinLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CoinSuccessState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.listofCrypto.length,
              itemBuilder: (context, index) {
                return CoinWidget(cryptoCoin: state.listofCrypto[index]);
              },
            );
          } else if (state is CoinErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    ));
  }
}
