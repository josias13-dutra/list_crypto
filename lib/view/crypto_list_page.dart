import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewModel/crypto_controller.dart';
import 'crypto_detail_page.dart'; // Importa a nova página de detalhes

class CryptoListPage extends StatelessWidget {
  CryptoListPage({Key? key}) : super(key: key);

  final cryptoController = Get.find<CryptoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preços de Criptomoedas'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: cryptoController.fetchCryptos,
          ),
        ],
      ),
      body: Obx(() {
        if (cryptoController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (cryptoController.cryptos.isEmpty) {
          return Center(child: Text('Nenhuma criptomoeda encontrada.'));
        } else {
          return ListView.builder(
            itemCount: cryptoController.cryptos.length,
            itemBuilder: (context, index) {
              var crypto = cryptoController.cryptos[index];
              return GestureDetector(
                onTap: () {
                  // Navegação para a tela de detalhes passando a criptomoeda selecionada
                  Get.to(() => CryptoDetailPage(crypto: crypto));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 70,
                    child: ListTile(
                      leading: Image.network(
                        crypto.image,
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        crypto.cryptoName,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        crypto.symbol.toUpperCase(),
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Text(
                        'R\$ ${crypto.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
