import 'dart:async';
import 'package:api_coins/features/watchlist/data/watched_listedata.dart';
import 'package:api_coins/model/crypto_model.dart';
import 'package:api_coins/repository/api_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinInitial()) {
    on<FetchEvent>(fetchEvent);
    on<WatchlistButtonClickedEvent>(watchlistButtonClickedEvent);
  }

  FutureOr<void> fetchEvent(FetchEvent event, Emitter<CoinState> emit) async {
    emit(CoinLoadingState());
    final cryptos = await CoinApi.fetchdata();
    if (cryptos.isNotEmpty) {
      emit(CoinSuccessState(listofCrypto: cryptos));
    } else {
      emit(CoinErrorState());
    }
  }

  FutureOr<void> watchlistButtonClickedEvent(
      WatchlistButtonClickedEvent event, Emitter<CoinState> emit) {
    cryptodataList.add(event.cryptoModel);
    emit(CoinAddToWatchlist());
  }
}
