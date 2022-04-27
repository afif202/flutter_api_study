import 'package:flutter_api_study/view_models/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel?> extends StatefulWidget {
  const BaseWidget({
    Key? key,
    this.builder,
    required this.model,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  final Widget Function(
    BuildContext context,
    T model,
    Widget? child,
  )? builder;
  final T model;
  final Widget? child;
  final void Function(T)? onModelReady;

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewModel?> extends State<BaseWidget<T>> {
  late T model;

  @override
  void initState() {
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady!(model!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: Consumer<T>(
        builder: widget.builder!,
        child: widget.child,
      ),
    );
  }
}
