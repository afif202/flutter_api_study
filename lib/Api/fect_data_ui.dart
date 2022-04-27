import 'package:flutter/material.dart';
import 'package:flutter_api_study/Api/fetch_data_api.dart';
import 'package:provider/provider.dart';


class FetchDataView extends StatelessWidget {
  const FetchDataView({Key? key}) : super(key: key);

  Widget _buildResult(FetchDataViewModel model) {
    if (model.tesModel == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: [
          Text(
            '${model.tesModel!.title ?? ''}',
          ),
          Text(
            '${model.tesModel!.userId ?? ''}',
          ),
          Text(
            '${model.tesModel!.id ?? ''}',
          ),
          Text(
            '${model.tesModel!.completed ?? ''}',
          ),
        ],
      );
    }
  }

  Widget _buildBody(BuildContext context, FetchDataViewModel model) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            model.fectData();
          },
          child: const Text (
            'fetch',
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          _buildResult(model),
      ],
    );
  }

  @override

  Widget build(BuildContext context) {
    return Consumer<FetchDataViewModel>(
      builder: (
        context,
        FetchDataViewModel viewModel,
        child, 
      ) {
        return Scaffold(
          body: _buildBody(context, viewModel),
        );
      }
    );
  }
}