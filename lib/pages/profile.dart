import 'package:flutter/material.dart';
import 'package:ta_tpm/pages/currency.dart';
import 'package:ta_tpm/pages/timezone.dart';
import 'package:ta_tpm/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SharedPreferences userdata;
  late String username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    userdata = await SharedPreferences.getInstance();
    setState(() {
      username = userdata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(15.0),
            ),
            const CircleAvatar(
                backgroundImage: AssetImage('pp.jpg'), radius: 50),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Hi, $username\n",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Waktu(),
                ));
              },
              child: const Text('Time Zone'),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MataUangPage(),
                ));
              },
              child: const Text('Currency Converter'),
            ),
            const SizedBox(
              height: 18,
            ),
            ElevatedButton(
              onPressed: () {
                userdata.setBool('status', true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Log Out'),
            )
          ],
        ),
      ),
    );
  }
}
