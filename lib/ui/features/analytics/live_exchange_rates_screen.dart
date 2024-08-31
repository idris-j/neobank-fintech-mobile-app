import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExchangeRatesScreen extends StatefulWidget {
  @override
  _ExchangeRatesScreenState createState() => _ExchangeRatesScreenState();
}

class _ExchangeRatesScreenState extends State<ExchangeRatesScreen> {
  Map<String, double>? exchangeRates;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchExchangeRates();
  }

  Future<void> fetchExchangeRates() async {
    const url =
        'https://api.exchangerate-api.com/v4/latest/USD'; // Replace with your preferred API

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          exchangeRates = Map<String, double>.from(data['rates']);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load exchange rates');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching exchange rates: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Exchange Rates'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : exchangeRates != null
              ? ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: exchangeRates!.length,
                  itemBuilder: (context, index) {
                    String currency = exchangeRates!.keys.elementAt(index);
                    double rate = exchangeRates![currency]!;
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          '$currency: $rate',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text('Failed to load exchange rates')),
    );
  }
}
