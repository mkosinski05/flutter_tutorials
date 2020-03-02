import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Calculator",
      home: Calculate(),
    );
  }
}


class Calculate extends StatefulWidget {
  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  int number = 0;
  List calc = [];
  int answer = 0;
  bool cc = false;

  void parseFunc(String mode) {
    print(mode);
    if ( cc ) {
      cc = false;
      number = 0;
    }
    setState(() {
      switch (mode) {
        case "1":
        case "2":
        case "3":
        case "4":
        case "5":
        case "6":
        case "7":
        case "8":
        case "9":
          {
            number *= 10;
            number += int.parse(mode);
            break;
          }
        case "0":
          {
            number *= 10;
            break;
          }
        case "AC":
          {
            number = 0;
            answer = 0;
            break;
          }
        case "+":
          {
            calc.add(number);
            calc.add('+');
            cc = true;
            break;
          }
        case "-":
          {
            calc.add(number);
            calc.add('-');
            cc = true;
            break;
          }
        case "X":
          {
            calc.add(number);
            calc.add('X');
            cc = true;
            break;
          }
        case "/":
          {
            calc.add(number);
            calc.add('/');
            cc = true;
            break;
          }
        case "=":
          {
            calc.add(number);
            answer = calc[0];
            for (int i = 1; i < calc.length/2; i+=2 ){
              switch(calc[i]) {
                case '+':
                  {
                    answer += calc[i + 1];
                    break;
                  }
                case '-':
                  {
                    answer -= calc[i + 1];
                    break;
                  }
                case 'X':
                  {
                    answer *= calc[i + 1];
                    break;
                  }
                case '/':
                  {
                    //answer /= calc[i + 1];
                    break;
                  }
                case '%':
                  {
                    answer += calc[i + 1];
                    break;
                  }
              }
              calc.clear();
              number = answer;
              answer = 0;
              cc = true;
            }
            break;
          }
      }
    });
    print(calc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
               color: Colors.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 390,
                alignment: Alignment(1.0, 0),
                color: Colors.black,
                padding: EdgeInsets.all(0),
                child: Text("$number",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        parseFunc("AC");
                      },
                      color: Colors.grey,
                      child: Text('AC'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                  ),
                  FlatButton(
                      onPressed: () {
                        parseFunc("NEG");
                      },
                      color: Colors.grey,
                      child: Text('-'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),

                  ),
                  FlatButton(
                      onPressed: () {
                        parseFunc("%");
                      },
                      color: Colors.grey,
                      child: Text('%'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                  ),
                  FlatButton(
                      onPressed: () {
                        parseFunc("/");
                      },
                      color: Colors.grey,
                      child: Text('/'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      parseFunc("7");
                    },
                    color: Colors.grey,
                    child: Text('7'),
                    shape: StadiumBorder(),
                  ),
                  FlatButton(
                    onPressed: () {
                      parseFunc("8");
                    },
                    color: Colors.grey,
                    child: Text('8'),
                    shape: StadiumBorder(),
                  ),
                  FlatButton(
                    onPressed: () {
                      parseFunc("9");
                    },
                    color: Colors.grey,
                    child: Text('9'),
                    shape: StadiumBorder(),
                  ),
                  FlatButton(
                    onPressed: () {
                      parseFunc("X");
                    },
                    color: Colors.grey,
                    child: Text('x'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      parseFunc("4");
                    },
                    color: Colors.grey,
                    child: Text('4'),
                    shape: StadiumBorder(),
                  ),
                  FlatButton(
                    onPressed: () {
                      parseFunc("5");
                    },
                    color: Colors.grey,
                    child: Text('5'),
                    shape: StadiumBorder(),
                  ),
                  FlatButton(
                    onPressed: () {
                      parseFunc("6");
                    },
                    color: Colors.grey,
                    child: Text('6'),
                    shape: StadiumBorder(),
                  ),
                  FlatButton(
                    onPressed: () {
                      parseFunc("-");
                    },
                    color: Colors.grey,
                    child: Text('-'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      parseFunc("1");
                    },
                    color: Colors.grey,
                    child: Text('1'),
                    shape: StadiumBorder(),
                  ),
                  FlatButton(
                    onPressed: () {
                      parseFunc("2");
                    },
                    color: Colors.grey,
                    child: Text('2'),
                    shape: StadiumBorder(),
                  ),
                  FlatButton(
                    onPressed: () {
                      parseFunc("3");
                    },
                    color: Colors.grey,
                    child: Text('3'),
                    shape: StadiumBorder(),
                  ),
                  FlatButton(
                    onPressed: () {
                      parseFunc("+");
                    },
                    color: Colors.grey,
                    child: Text('+'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 0, horizontal: 8),
                        child: FlatButton(
                          onPressed: () {
                            parseFunc("0");
                          },
                          color: Colors.grey,
                          child: Text('0'),
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 0, horizontal: 8),
                        child: FlatButton(
                          onPressed: () {
                            parseFunc(".");
                          },
                          color: Colors.grey,
                          child: Text('.'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 0, horizontal: 8),
                        child: FlatButton(
                          onPressed: () {
                            parseFunc("=");
                          },
                          color: Colors.grey,
                          child: Text('='),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

