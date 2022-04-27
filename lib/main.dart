
import 'package:flutter/material.dart';
import 'package:flutter_api_study/Api/fetch_data_api.dart';
import 'package:flutter_api_study/Api/fect_data_ui.dart';
import 'package:flutter_api_study/ui/score_view.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (context)=> FetchDataViewModel(),
        ),
      ],
      child: const App(),
       )
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScoreView()
    );
  }
}