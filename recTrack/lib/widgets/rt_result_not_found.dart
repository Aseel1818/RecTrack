import 'package:flutter/material.dart';
import 'rt_text.dart';

///Loader shows when there is no results.
class RTResultNotFound extends StatelessWidget {
  const RTResultNotFound({Key? key}) : super(key: key);

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
                      text: "Not found recipe",
                      color: Colors.black,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ));
  }
}
