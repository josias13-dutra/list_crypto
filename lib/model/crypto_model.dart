class CryptoModel {
  String cryptoName;
  double price;
  String symbol;
  String image;

  CryptoModel({required this.cryptoName, required this.price, required this.symbol, required this.image});

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        cryptoName: json['name'],
        price: json['current_price'].toDouble(),
        symbol: json['symbol'],
        image: json['image']);
  }
}
