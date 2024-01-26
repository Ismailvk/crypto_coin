import 'package:api_coins/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:api_coins/features/watchlist/ui/watchlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  void initState() {
    context.read<WatchlistBloc>().add(WatchlistLoadingSuccessEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<WatchlistBloc, WatchlistState>(
      listenWhen: (previous, current) => current is WatchlistActionState,
      buildWhen: (previous, current) => current is! WatchlistActionState,
      listener: (context, state) {
        if (state is WatchlistDataRemoveState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Removed from Watchlist'),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        if (state is WatchlistSuccessState) {
          if (state.cryotodata.isEmpty) {
            return const Center(
              child: Text(
                'No item found',
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.cryotodata.length,
            itemBuilder: (context, index) {
              return WatchlistWidget(
                index: index,
                cryptoCoin: state.cryotodata[index],
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    ));
  }
}
