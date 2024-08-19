import 'package:flutter/material.dart';
import 'rt_text.dart';

///Loader while retrieving the data.
class RTLoading extends StatelessWidget {
  const RTLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Center(
          child: Column(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/loadingImage.gif"),
                maxRadius: 40,
                minRadius: 40,
              ),
              Expanded(
                  child: RTText(
                      text: "loading",
                      color: Colors.black,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ));
  }
}

