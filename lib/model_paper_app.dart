import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutters_app_of_asad/text_style.dart';
import 'api_services.dart';
import 'colors.dart';
import 'images.dart';

void main() {
  runApp(ModelPaperApp());
}

class ModelPaperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Model Paper App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Class'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ClassCard(className: 'Class 9\nMath', context: context),
          ClassCard(className: 'Class 9\nPhysics', context: context),
          ClassCard(className: 'Class 9\nChemistry', context: context),
          ClassCard(className: 'Class 9 \nEnglish', context: context),
          ClassCard(className: 'Class 10\nMath', context: context),
          ClassCard(className: 'Class 10\nPhysics', context: context),
          ClassCard(className: 'Class 10\nChemistry', context: context),
          ClassCard(className: 'Class 10\nEnglish', context: context),
          ClassCard(className: 'Class 11\nMath', context: context),
          ClassCard(className: 'Class 11\nPhysics', context: context),
          ClassCard(className: 'Class 11\nChemistry', context: context),
          ClassCard(className: 'Class  11\nEnglish', context: context),
          ClassCard(className: 'Class 12\nMath', context: context),
          ClassCard(className: 'Class 12\nPhysics', context: context),
          ClassCard(className: 'Class 12\nChemistry', context: context),
          ClassCard(className: 'Class 12\nEnglish', context: context),
        ],
      ),
    );
  }
}

class ModelPaperScreen extends StatefulWidget {
  final String className;

  const ModelPaperScreen({Key? key, required this.className}) : super(key: key);

  @override
  State<ModelPaperScreen> createState() => _ModelPaperScreenState();
}

class _ModelPaperScreenState extends State<ModelPaperScreen> {
  var currentQuestionIndex = 0;
  int seconds = 60;
  Timer? timer;
  late Future quiz;

  int points = 0;

  var isLoaded = false;

  var optionsList = [];

  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  @override
  void initState() {
    super.initState();
    quiz = getQuiz();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          gotoNextQuestion();
        }
      });
    });
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 60;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [blue, darkBlue],
            ),
          ),
          child: FutureBuilder(
            future: quiz,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data["results"];

                if (isLoaded == false) {
                  optionsList = data[currentQuestionIndex]["incorrect_answers"];
                  optionsList.add(data[currentQuestionIndex]["correct_answer"]);
                  optionsList.shuffle();
                  isLoaded = true;
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: lightgrey, width: 2),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                CupertinoIcons.xmark,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              normalText(color: Colors.white, size: 24, text: "$seconds"),
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CircularProgressIndicator(

                                  value: seconds / 60,
                                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: lightgrey, width: 2),
                            ),
                            child: TextButton.icon(
                              onPressed: null,
                              icon: const Icon(CupertinoIcons.heart_fill, color: Colors.white, size: 18),
                              label: normalText(color: Colors.white, size: 14, text: "Like"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Image.asset(ideas, width: 200),
                      const SizedBox(height: 20),
                      LinearProgressIndicator(
                        value: (currentQuestionIndex + 1) / data.length,
                        backgroundColor: Colors.white24,

                        valueColor: const AlwaysStoppedAnimation(Colors.green),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: normalText(
                          color: lightgrey,
                          size: 18,
                          text: "Question ${currentQuestionIndex + 1} of ${data.length}",
                        ),
                      ),
                     SizedBox(height: 20),
                      normalText(color: Colors.white, size: 20, text: data[currentQuestionIndex]["question"]),
                        SizedBox(height: 20),
                       ListView.builder(
                        shrinkWrap: true,
                        itemCount: optionsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var answer = data[currentQuestionIndex]["correct_answer"];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (answer.toString() == optionsList[index].toString()) {
                                  optionsColor[index] = Colors.green;
                                  points = points + 10;
                                } else {
                                  optionsColor[index] = Colors.red;
                                }

                                if (currentQuestionIndex < data.length - 1) {
                                  Future.delayed(const Duration(seconds: 1), () {
                                    gotoNextQuestion();
                                  });
                                } else {
                                  timer!.cancel();
                                  // here you can handle the end of the quiz
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              alignment: Alignment.center,
                              width: size.width - 100,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: optionsColor[index],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: headingText(
                                color: blue,
                                size: 18,
                                text: optionsList[index].toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(

                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String className;
  final BuildContext context;

  ClassCard({required this.className, required this.context});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ModelPaperScreen(className: className),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            className,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
