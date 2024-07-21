import 'package:flutter/material.dart';
import 'package:flutter_application_api/screens/comentarios.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen Principal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Consumiendo una API en Flutter',
                  style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const Image(image: AssetImage('assets/logoapp.png'), width: 600,),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Comentarios()
                              ),
                          );
                        }, 
                        icon: const Icon(Icons.account_balance_wallet_rounded),
                        label: const Text('Comentarios JSON')
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}