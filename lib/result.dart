import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final String gender;

  const Result({Key? key, required this.result, required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 24, 68, 1.0),
      appBar: AppBar(
        title: const Text("Result"),
        backgroundColor: const Color.fromRGBO(11, 24, 68, 1.0),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your BMI: ${result.round()}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(
              result < 18
                  ? "Unfortunately You're underweight"
                  : result < 25
                      ? "Congratulations, Your weight is healthy"
                      : result < 30
                          ? "unfortunately , you're overweight "
                          : "Unfortunately, you have terrible obesity",
              style: TextStyle(
                color: result < 18
                    ? Colors.red
                    : result < 25
                        ? Colors.green
                        : Colors.red,
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}
