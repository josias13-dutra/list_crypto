class CryptoModel {
  String cryptoName;
  double price;
  String symbol;
  String image;
  int totalvolume;
  double high24h;
  double low24h;
  double priceChange24h;
  double priceChangePercentage24h;

  CryptoModel({required this.cryptoName, required this.price, required this.symbol, required this.image, required this.totalvolume,  required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        cryptoName: json['name'],
        price: json['current_price'].toDouble(),
        symbol: json['symbol'],
        image: json['image'],
        totalvolume: json['total_volume'],
        high24h: json['high_24h'].toDouble(),
        low24h: json['low_24h'].toDouble(),
        priceChange24h: json['price_change_24h'].toDouble(),
        priceChangePercentage24h: json['price_change_percentage_24h'].toDouble(),

    );
  }
}
