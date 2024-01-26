import 'dart:async';
import 'package:api_coins/features/watchlist/data/watched_listedata.dart';
import 'package:api_coins/model/crypto_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistInitial()) {
    on<WatchlistLoadingSuccessEvent>(watchlistLoadingSuccessEvent);
    on<WatchlistRemoveEvent>(watchlistRemoveEvent);
  }

  FutureOr<void> watchlistLoadingSuccessEvent(
      WatchlistLoadingSuccessEvent event, Emitter<WatchlistState> emit) {
    emit(WatchlistSuccessState(cryotodata: cryptodataList));
  }

  FutureOr<void> watchlistRemoveEvent(
      WatchlistRemoveEvent event, Emitter<WatchlistState> emit) {
    cryptodataList.removeAt(event.index);
    emit(WatchlistSuccessState(cryotodata: cryptodataList));
    emit(WatchlistDataRemoveState());
  }
}
