import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _textEditingControllerUSD =
      TextEditingController();
  final TextEditingController _textEditingControllerPKR =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 45, bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Currency',
                      style: TextStyle(
                        color: Color(0xff02389e),
                        fontSize: 70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Converter',
                      style: TextStyle(
                        color: Color(0xff02389e),
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'USD',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextFormField(
                  controller: _textEditingControllerUSD,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Amount in USD',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      // Convert USD to PKR
                      double usd =
                          double.tryParse(_textEditingControllerUSD.text) ?? 0;
                      double pkr = usd * 279.5;
                      _textEditingControllerPKR.text = pkr.toString();
                    },
                    child: const Text(
                      'USD to PKR',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'PKR',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextFormField(
                  controller: _textEditingControllerPKR,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Amount in PKR',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      // Convert PKR to USD
                      double pkr =
                          double.tryParse(_textEditingControllerPKR.text) ?? 0;
                      double usd = pkr / 279.5;
                      _textEditingControllerUSD.text = usd.toString();
                    },
                    child: const Text(
                      'PKR to USD',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
