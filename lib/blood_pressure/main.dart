import 'package:flutter/material.dart';

import 'src/blocs/bloc_provider.dart';
import 'src/blocs/bloodpressure_bloc.dart';
import 'src/bloodpressure_page.dart';

void main() => runApp(MyBlood());

class MyBlood extends StatelessWidget {
  final bloc = BloodPressureBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood pressure classification demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(bloc: bloc, child: BloodPressurePage()),
    );
  }
}


