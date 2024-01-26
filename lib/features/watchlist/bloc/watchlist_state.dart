part of 'watchlist_bloc.dart';

@immutable
abstract class WatchlistState {}

abstract class WatchlistActionState extends WatchlistState {}

final class WatchlistInitial extends WatchlistState {}

class WatchlistSuccessState extends WatchlistState {
  final List<CryptoModel> cryotodata;

  WatchlistSuccessState({required this.cryotodata});
}

class WatchlistDataRemoveState extends WatchlistActionState {}
