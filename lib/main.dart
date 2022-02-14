import 'package:bmi_calc/result.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var height = 180.0;
  var weight = 60;
  var age = 21;
  bool isMale = false;
  bool isFemale = false;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(11, 24, 68, 1.0),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(11, 24, 68, 1.0),
          title: const Text(
            "BMI CALCULATOR",
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Gender Section
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = !isMale;
                            isFemale = false;
                            gender = isMale ? "Male" : null;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),

                          decoration: BoxDecoration(
                              color: isMale
                                  ? Colors.indigo[400]
                                  : const Color.fromRGBO(
                                  52, 65, 151, 0.5),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.male,
                                size: 90,
                                color: Colors.white,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isFemale = !isFemale;
                            isMale = false;
                            gender = isFemale ? "Female" : null;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: isFemale
                                  ? Colors.indigo[400]
                                  : const Color.fromRGBO(
                                  52, 65, 151, 0.5),
                              borderRadius: BorderRadius.circular(15)
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.female,
                                size: 90,
                                color: Colors.white,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // slider and height
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(52, 65, 151, 0.5),
                    borderRadius: BorderRadius.circular(15)
                ),
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(

                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            height.toStringAsFixed(0),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              "cm",
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                        value: height,
                        activeColor: Colors.white,
                        inactiveColor: Colors.white30,
                        min: 70,
                        max: 230,
                        thumbColor: Colors.pink,
                        onChanged: (value) {
                          setState(() {
                            height = (value.toInt()).toDouble();
                          });
                        })
                  ],
                ),
              ),
            ),
            // Weight and age
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(52, 65, 151, 0.5),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(color: Colors.white30),
                          ),
                          Text(
                            "$weight",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "w-",
                                onPressed: () {
                                  setState(() {
                                    weight > 5 ? weight-- : weight;
                                  });
                                },
                                backgroundColor: Colors.grey[600],
                                child: const Text(
                                  "-",
                                  style: TextStyle(fontSize: 35),
                                ),
                                mini: true,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              FloatingActionButton(
                                heroTag: "w+",
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                enableFeedback: true,
                                backgroundColor: Colors.grey[600],
                                child: const Text(
                                  "+",
                                  style: TextStyle(fontSize: 35),
                                ),
                                mini: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(52, 65, 151, 0.5),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(color: Colors.white30),
                          ),
                          Text(
                            "$age",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "a-",
                                onPressed: () {
                                  setState(() {
                                    age > 0 ? age-- : age;
                                  });
                                },
                                backgroundColor: Colors.grey[600],
                                child: const Text(
                                  "-",
                                  style: TextStyle(fontSize: 35),
                                ),
                                mini: true,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              FloatingActionButton(
                                heroTag: "a+",
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                enableFeedback: true,
                                backgroundColor: Colors.grey[600],
                                child: const Text(
                                  "+",
                                  style: TextStyle(fontSize: 35),
                                ),
                                mini: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              color: Colors.pink[800],
              child: Builder(
                builder:(context)=> MaterialButton(
                  onPressed: () {
                    if (gender == null) {
                      Fluttertoast.showToast(
                          msg: "Please select a gender",
                          fontSize: 15,
                          backgroundColor: Colors.white,
                          textColor: Colors.black
                      );
                    }
                    else {
                      var result = (weight / height / height * 10000).roundToDouble();
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder:(context)=> Result(result: result,  gender: gender!),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "CALCULATE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
