import 'package:flutter/material.dart';

class StateContainer extends StatefulWidget {
  final Widget child;
  bool buttonVis = true;
  StateContainer({@required this.child, @required this.buttonVis});

  static StateContainerState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedContainer>())
        .data;
  }

  @override
  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  bool buttonVis;
  void updateVis(buttonVis) {
    if (buttonVis != null) {
      setState(() {
        buttonVis = true;
      });
    } else {
      setState(() {
        buttonVis = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedContainer(data: this, child: widget.child);
  }
}

class InheritedContainer extends InheritedWidget {
  final StateContainerState data;

  InheritedContainer({Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedContainer oldWidget) {
    return true;
  }
}
