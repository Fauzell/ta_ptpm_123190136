// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MataUangPage extends StatefulWidget {
  const MataUangPage({Key? key}) : super(key: key);

  @override
  _MataUangPageState createState() => _MataUangPageState();
}

class _MataUangPageState extends State<MataUangPage> {
  final TextEditingController _controller = TextEditingController();
  double _idrValue = 0;
  double _usdValue = 0;
  double _rubValue = 0;

  void _convertCurrency(String value) {
    double input = double.tryParse(value) ?? 0;
    setState(() {
      _idrValue = input;
      _usdValue = input * 0.000069;
      _rubValue = input * 0.0052;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Currency Converter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                onChanged: _convertCurrency,
                decoration: const InputDecoration(
                  labelText: 'Enter amount in IDR',
                ),
              ),
              Text('\nIDR: ${_idrValue.toStringAsFixed(2)}'),
              Text('\nUSD: ${_usdValue.toStringAsFixed(2)}'),
              Text('\nRUB: ${_rubValue.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: const Icon(Icons.arrow_back),
      // ),
    );
  }
}
