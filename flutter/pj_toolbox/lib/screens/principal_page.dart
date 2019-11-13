import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pj_toolbox/components/alternate_animations.dart';
import 'package:pj_toolbox/components/round_animatedicon_button.dart';
import 'package:pj_toolbox/components/round_icon_button.dart';
import 'package:pj_toolbox/components/showdown_animation_widget.dart';
import 'package:pj_toolbox/components/showup_animation_widget.dart';
import 'package:pj_toolbox/contants.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage>
    with TickerProviderStateMixin {
  AnimationController _controllerIconPlayPause;
  AnimationController _controllerDecorationTransition;
  AnimationController _controllerPositionStopButton;

  Animation stopButtonAnimation;

  @override
  void initState() {
    super.initState();
    _controllerIconPlayPause = _controllerDecorationTransition =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _controllerDecorationTransition = _controllerDecorationTransition =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _controllerPositionStopButton = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    stopButtonAnimation =
        Tween(begin: 250.0, end: 210.0).animate(_controllerPositionStopButton)
          ..addListener(() {
            setState(() {});
          });

    _controllerDecorationTransition.forward();
  }

  @override
  void dispose() {
    _controllerIconPlayPause.dispose();
    _controllerDecorationTransition.dispose();
    _controllerPositionStopButton.dispose();
    super.dispose();
  }

  bool _btnPlayWasClicked = true;
  bool _btnStopWasClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: DecoratedBoxTransition(
                  position: DecorationPosition.background,
                  decoration:
                      kDecorationTween.animate(_controllerDecorationTransition),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 40.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(25.0),
                            child: AnimatedOpacity(
                              opacity: _btnPlayWasClicked ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: 5.0, bottom: 100.0),
                                child: _btnPlayWasClicked
                                    ? ShowDownAnimation(child: kGreetings)
                                    : ShowUpAnimation(child: kGreetings),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(25.0),
                            child: AnimatedOpacity(
                              opacity: _btnPlayWasClicked ? 0.0 : 1.0,
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                margin: EdgeInsets.all(60.0),
                                child: _btnPlayWasClicked
                                    ? ShowUpAnimation(child: kClock)
                                    : ShowDownAnimation(child: kClock),
                              ),
                            ),
                          ),
//                          Container(
//                            margin: EdgeInsets.all(25.0),
//                            child: AnimatedOpacity(
//                              opacity: _btnStopWasClicked ? 0.0 : 1.0,
//                              duration: Duration(milliseconds: 500),
//                              child: Container(
//                                margin: EdgeInsets.all(60.0),
//                                child: _btnPlayWasClicked
//                                    ? ShowUpAnimation(child: kSuccess)
//                                    : ShowDownAnimation(child: kSuccess),
//                              ),
//                            ),
//                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    '',
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontSize: 25.0,
                    ),
                  ),
//                  color: Colors.blueGrey[100],
                ),
              ),
            ],
          ),
          Positioned(
            top: 230.0,
            left: 290.0,
            child: RoundAnimatedIconButton(
              icon: AnimatedIcons.play_pause,
              onPressed: () => setState(() {
                _controllerIconPlayPause.forward();

                alternateAnimations(_controllerIconPlayPause);
                alternateAnimations(_controllerPositionStopButton);

                _btnPlayWasClicked = !_btnPlayWasClicked;
              }),
              controller: _controllerIconPlayPause,
            ),
          ),
          Positioned(
            top: 230.0,
            left: stopButtonAnimation.value,
            child: AnimatedOpacity(
              opacity: _btnPlayWasClicked ? 0.0 : 1.0,
              duration: Duration(milliseconds: 500),
              child: RoundIconButton(
                icon: FontAwesomeIcons.stop,
                onPressed: () => setState(() {
                  _btnStopWasClicked = !_btnStopWasClicked;

                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
