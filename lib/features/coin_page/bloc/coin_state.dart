part of 'coin_bloc.dart';

abstract class CoinState {}

abstract class CoinActionState extends CoinState {}

final class CoinInitial extends CoinState {}

class CoinLoadingState extends CoinState {}

class CoinSuccessState extends CoinState {
  final List<CryptoModel> listofCrypto;

  CoinSuccessState({required this.listofCrypto});
}

class CoinErrorState extends CoinState {}

class CoinAddToWatchlist extends CoinActionState {}
