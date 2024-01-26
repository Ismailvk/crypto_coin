part of 'watchlist_bloc.dart';

@immutable
abstract class WatchlistEvent {}

class WatchlistLoadingSuccessEvent extends WatchlistEvent {}

class WatchlistRemoveEvent extends WatchlistEvent {
  final int index;

  WatchlistRemoveEvent({required this.index});
}
