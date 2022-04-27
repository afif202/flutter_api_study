import 'package:flutter_api_study/BaseWidget/base_widget.dart';
import 'package:flutter_api_study/view_models/base_view_model.dart';
import 'package:flutter_api_study/view_models/score_view_model.dart';
import 'package:flutter/material.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({Key? key}) : super(key: key);

  Widget _buildBody(ScoreViewModel scoreViewModel) {
    if (scoreViewModel.busy) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(child: Text(scoreViewModel.album?.title ?? 'belum ada data'));
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ScoreViewModel>(
      model: ScoreViewModel(),
      onModelReady: (ScoreViewModel scoreViewModel) {
        scoreViewModel.initModel();
      },
      builder: (
        BuildContext context,
        ScoreViewModel scoreViewModel,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: _buildBody(scoreViewModel),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              scoreViewModel.testPost();
            },
            tooltip: 'test post',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
