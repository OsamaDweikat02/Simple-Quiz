import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz/answer-button.dart';
import 'package:simple_quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget{

  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function (String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{

  var currentQustionIndex = 0;

  void answerQuestion(String selectAnswer){
    widget.onSelectAnswer(selectAnswer);
    setState(() {
      currentQustionIndex++;
    });
  }

  @override
  Widget build(context){
    final currentQustions = questions[currentQustionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Text(
            currentQustions.text ,
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 201, 153, 251),
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30,),
          ...currentQustions.getShuffeldAnswers().map((answer){
            return AnswerButton(
              answerText: answer,
              onTap: (){
                answerQuestion(answer);
              },
            );
          })
           
        ],),
      ),
    );
  }
}