import 'dart:convert';
import 'package:api_coins/model/crypto_model.dart';
import 'package:http/http.dart' as http;

class CoinApi {
  static Future<List<CryptoModel>> fetchdata() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    List listCrypto = jsonDecode(response.body) as List;
    List<CryptoModel> cryptos =
        listCrypto.map((e) => CryptoModel.fromJson(e)).toList();

    return cryptos;
  }
}
