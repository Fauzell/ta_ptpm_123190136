// ignore_for_file: library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ta_tpm/pages/search.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  late List countryData;

  fetchCountryData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Search(countryData));
            },
          )
        ],
        title: const Text('Country Stats',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      // ignore: unnecessary_null_comparison
      body: countryData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: countryData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return (Column(
                          children: <Widget>[
                            Image.network(
                              countryData[index]['countryInfo']['flag'],
                              height: 110,
                              width: 150,
                            ),
                            Text(
                              '\nCOUNTRY : ' + countryData[index]['country'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Text(
                              '\nCONFIRMED : ${countryData[index]['cases']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.red),
                            ),
                            Text(
                              '\nACTIVE : ${countryData[index]['active']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                            Text(
                              '\nRECOVERED : ${countryData[index]['recovered']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.green),
                            ),
                            Text(
                              '\nDEATHS : ${countryData[index]['deaths']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.yellow),
                            ),
                          ],
                        ));
                      }));
                    },
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  countryData[index]['country'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 50,
                                  width: 60,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Column(
                            children: <Widget>[
                              Text(
                                'POPULATION : ${countryData[index]['population']}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                'BENUA : ${countryData[index]['continent']}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
