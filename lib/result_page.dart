import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'input_page.dart';

double BMI = 0;
var resultStrig = ["Underweight", "Normal", "Overweight", "Obeses", "Extremely obeses"];
String result = "Normal";
class ResultPage extends StatefulWidget {
  const ResultPage(
      {Key? key, required this.height, required this.weight, required this.age})
      : super(key: key);

  final int height;
  final int weight;
  final int age;



  @override
  _resultPageState createState() => _resultPageState();
}

class _resultPageState extends State<ResultPage> {


  @override
  Widget build(BuildContext context) {

    BMI = (weight / height / height) * 10000 ;

    if(BMI <= 18 && weight <= 68.2 && height <= 193.0 && height >= 157.4){
      result = resultStrig[0];
    }else if(BMI <= 24 && BMI >= 18 && weight <= 90.9 && weight>= 45.5 && height <= 193.0 && height >= 152.4){
      result = resultStrig[1];
    }else if(BMI <= 29 && BMI >= 25  && weight>= 59.1 && height <= 193.0 && height >= 152.4){
      result = resultStrig[2];
    }else if(BMI <= 39 && BMI >= 30  && weight>= 70.5 && height <= 177.8 && height >= 152.4){
      result = resultStrig[3];
    }else if(BMI >= 40  && weight>= 93.2 && height <= 154.9){
      result = resultStrig[4];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          textAlign: TextAlign.center,
        ),
        leading: Icon(
          IconData(58834, fontFamily: 'MaterialIcons'),
          size: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Text(
                "Your Result",
                style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w900),
                textAlign: TextAlign.left,
              ),),
            Container(
              height: 510,
              width: double.infinity,
              child: ResusableCard(
                  theColor: Color(0xFF1D1F33),
                  cardChild: Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(result.toUpperCase(), style: TextStyle(color: Colors.greenAccent, fontSize: 20.0, fontWeight: FontWeight.w100),),
                        Expanded(child: Text(BMI.toStringAsFixed(2), style: TextStyle(color: Colors.white, fontSize: 80.0, fontWeight: FontWeight.w900),)),
                        Expanded(child: Column(children: [
                          Text("Normal BMI range:", style: TextStyle(color: Color(0xFF8D8E98), fontSize: 24.0),),
                          Text("18.5 - 25 kg/m2", style: TextStyle(color: Colors.white, fontSize: 24.0),)
                        ],)),
                        Expanded(child: Column(children: [
                          Text("You have a $result body", style: TextStyle(color: Colors.white, fontSize: 24.0),),
                          Text("weight. Good job!", style: TextStyle(color: Colors.white, fontSize: 24.0),)
                        ],)),

                      ],
                    ),
                  )),
            ),
            Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InputPage()));
                },
                child: Text(
                  "RE-CALCULATE YOUR BMI",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEA1556),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
