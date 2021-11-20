import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'result_page.dart';

const kBottomContainerHeight = 80.0;
const kBottomContainerColor = Color(0xFFEB1555);
Color activeCardColor = Colors.white;
Color inactiveCardColor = Color(0xFF888B98);
Color cardColor = Color(0xFF1D1F33);
int height = 186;
int weight = 74;
int age = 19;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  var selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ResusableCard(
                      cardChild: genderIcon(
                          Icons.male,
                          80,
                          (selectedGender == Gender.male
                              ? activeCardColor
                              : inactiveCardColor),
                          "MALE",
                          20),
                      theColor: cardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ResusableCard(
                      cardChild: genderIcon(
                          Icons.female,
                          80,
                          (selectedGender == Gender.female
                              ? activeCardColor
                              : inactiveCardColor),
                          "FEMALE",
                          20),
                      theColor: cardColor,
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ResusableCard(
                cardChild: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                              color: Color(0xFF888B98), fontSize: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w900),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12.0),
                              child: Text(
                                "cm",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFF888B98),
                                ),
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 0.0,
                              max: 250.0,
                              activeColor: Color(0xFFEA1556),
                              inactiveColor: Color(0xFF8D8E98),
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                theColor: cardColor,
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ResusableCard(
                    cardChild: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: TextStyle(
                                  color: Color(0xFF888B98), fontSize: 20.0),
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 40.0),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  backgroundColor: Color(0xFF515261),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                )),
                                Expanded(
                                    child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  backgroundColor: Color(0xFF515261),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    theColor: cardColor,
                  ),
                ),
                Expanded(
                  child: ResusableCard(
                    cardChild: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: TextStyle(
                                  color: Color(0xFF888B98), fontSize: 20.0),
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 40.0),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      backgroundColor: Color(0xFF515261),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    )),
                                Expanded(
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      backgroundColor: Color(0xFF515261),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    theColor: cardColor,
                  ),
                ),
              ],
            )),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              height: height, weight: weight, age: age)));
                },
                child: Text(
                  "CALCULATE YOUR BMI",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEA1556),
                ),
              ),
            )
          ],
        ));
  }
}

class genderIcon extends StatelessWidget {
  const genderIcon(
      this.icon, this.iconSize, this.color, this.title, this.textSize);

  final IconData icon;
  final double iconSize;
  final Color color;
  final double textSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: color,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize, color: color),
        )
      ],
    );
  }
}
