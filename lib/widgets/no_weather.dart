import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
      child: Center(
        child:  SizedBox(
          height: 100,
          width: double.infinity,
          child: Center(
            child: Text("there is no weather 😔 start searching now 🔍",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),
        ),
        ),
    );
  }
}
