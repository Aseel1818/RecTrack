import 'package:flutter/material.dart';
import 'package:recptrack/widgets/rt_text.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

///Widget that check internet connection and show message about it.
class RTInternetConnection extends StatelessWidget {
  const RTInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
          visible: Provider.of<InternetConnectionStatus>(context) ==
              InternetConnectionStatus.disconnected,
          child: Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Column(
              children: const [
                Center(
                  child: RTText(text: 'No Internet Connection!!!', size: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
