import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:recptrack/screens/navbar.dart';
import 'package:recptrack/widgets/rt_text.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker().onStatusChange;
        },
        child:  MaterialApp(
          title: 'RecTrack',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          debugShowCheckedModeBanner: false,
          home: Splash(),
        )),
  );
}


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyAppBar())));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Column(children: <Widget>[
              Container(
                height: 150,
                width: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill),
                ),
              ),
              RTText(text: "RecTrack", size: 20),
            ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 500.0),
          child: Center(
            child: Column(
              children: <Widget>[
                RTText(text: "Get Cooking", size: 55),
                RTText(text: "Simply way to find tasty recipes"),
                SizedBox(height: 15),
                ElevatedButton(
                  child: const RTText(text: "Start Cooking"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyAppBar()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
