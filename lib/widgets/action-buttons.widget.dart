import 'package:egg/blocs/app.bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'button.widget.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context);
    switch (bloc.state) {
      case "stopped":
        return startButton(bloc);
      case "cooking":
        return stopButton(bloc);
      case "done":
        return doneButton(bloc);
      default:
        return startButton(bloc);
    }
  }

  Widget startButton(bloc) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Button(
        label: "START",
        selected: true,
        callback: bloc.start,
      ),
    );
  }

  Widget stopButton(bloc) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Button(
        label: "STOP",
        selected: true,
        callback: bloc.stop,
      ),
    );
  }

  Widget doneButton(bloc) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Button(
        label: "ALL DONE",
        selected: true,
        callback: bloc.reset,
      ),
    );
  }
}
