import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CurrencyConverterMaterialPage(),
    );
  }
}

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  _CurrencyConverterMaterialPageState createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0.0;
  final TextEditingController textEditingController =
      TextEditingController();

  void convertCurrency() {
    setState(() {
      double input = double.tryParse(textEditingController.text) ?? 0.0;
      result = input * 127.81; // Assuming this is the conversion rate
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ksh ${result.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(
                    Icons.monetization_on,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: convertCurrency,
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.white),
                  minimumSize: const MaterialStatePropertyAll(
                      Size(double.infinity, 50)),
                  foregroundColor:
                      const MaterialStatePropertyAll(Colors.grey),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                          color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
                child: const Text('Convert To Kenyan Shilling'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
