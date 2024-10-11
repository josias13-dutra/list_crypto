import 'package:flutter/material.dart';
import '../model/crypto_model.dart';

class CryptoDetailPage extends StatelessWidget {
  final CryptoModel crypto;

  CryptoDetailPage({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${crypto.cryptoName} Detalhes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem da criptomoeda
            Center(
              child: Image.network(
                crypto.image,
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 20),

            // Nome da criptomoeda
            Text(
              'Nome: ${crypto.cryptoName}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Símbolo da criptomoeda
            Text(
              'Símbolo: ${crypto.symbol.toUpperCase()}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),

            // Preço da criptomoeda
            Text(
              'Preço: R\$ ${crypto.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),

            // Exemplo de campo extra: Volume de mercado
            Text(
              'Volume de Mercado (24h): R\$ ${crypto.totalvolume}',
              style: TextStyle(fontSize: 20),
            ),
        // Preço mais alto em 24h
            Text(
              'Máximo (24h): R\$ ${crypto.high24h.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),

              // Preço mais baixo em 24h
             Text(
              'Mínimo (24h): R\$ ${crypto.low24h.toStringAsFixed(2)}',
               style: TextStyle(fontSize: 20),
             ),
             SizedBox(height: 10),

            // Mudança de preço em 24h
             Text(
              'Mudança de Preço (24h): R\$ ${crypto.priceChange24h.toStringAsFixed(2)} (${crypto.priceChangePercentage24h.toStringAsFixed(2)}%)',
               style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
