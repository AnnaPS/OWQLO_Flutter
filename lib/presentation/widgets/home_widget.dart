import 'package:flutter/material.dart';
import 'button_widget.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _blueNumber = 0;
  int _redNumber = 0;
  bool _isVisible = true;
  double _blueButtonPosition = .5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OWQLO",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: AspectRatio(
        aspectRatio: 10 / 8,
        child: Container(
          margin: EdgeInsets.all(30),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(color: Colors.blue[100], width: 15),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, -.7),
                child: ButtonWidget(
                    title: 'Delete blue',
                    textSize: 16.0,
                    onClick: () {
                      setState(() {
                        _isVisible = false;
                        _blueButtonPosition = -.1;
                      });
                    }),
              ),
              Align(
                alignment: Alignment(0, -.1),
                child: AnimatedOpacity(
                  opacity: _isVisible ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: ButtonWidget(
                    title: '$_blueNumber',
                    textSize: 25.0,
                    textColor: Colors.white,
                    buttonColor: Colors.blue,
                    onClick: _sum,
                  ),
                ),
              ),
              AnimatedAlign(
                duration: Duration(milliseconds: 500),
                alignment: Alignment(0, _blueButtonPosition),
                child: ButtonWidget(
                  title: '$_redNumber',
                  textSize: 25.0,
                  textColor: Colors.white,
                  buttonColor: Colors.red,
                  onClick: _multiply,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sum() {
    setState(() => _blueNumber += 1);
  }

  void _multiply() {
    setState(() => _redNumber = _blueNumber * 5);
  }
}
