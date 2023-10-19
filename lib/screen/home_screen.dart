import 'package:classifier/model/classification_model.dart';
import 'package:classifier/screen/hate_speech_screen.dart';
import 'package:classifier/screen/input_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<ClassificationModel> listClassification = [
    ClassificationModel(
      img: "assets/man_woman.png",
      title: "Man or Woman Classification",
      screen: const InputScreen(),
      active: true,
    ),
    ClassificationModel(
      img: "assets/man_woman.png",
      title: "Hate Speech Detection",
      screen: const HateSpeechScreen(),
      active: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Classifier"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: listClassification[index].active
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => listClassification[index].screen,
                      ),
                    );
                  }
                : () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: const Text("Coming Soon"),
                        content: const Text("Service is still not available"),
                      ),
                    );
                  },
            child: Material(
              elevation: 8,
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(listClassification[index].img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      listClassification[index].title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 12,
        ),
        itemCount: 2,
      ),
    );
  }
}
