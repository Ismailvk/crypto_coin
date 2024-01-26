part of 'coin_bloc.dart';

abstract class CoinEvent {}

class FetchEvent extends CoinEvent {}

class WatchlistButtonClickedEvent extends CoinEvent {
  final CryptoModel cryptoModel;

  WatchlistButtonClickedEvent({required this.cryptoModel});
}
