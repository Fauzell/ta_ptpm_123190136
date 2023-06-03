import 'package:flutter/material.dart';
import 'package:ta_tpm/datasource.dart';
import 'package:ta_tpm/pages/faqs.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FAQPage()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: primaryBlack,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'FAQS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void launch(String s) {}

  canLaunch(String s) {}
}
