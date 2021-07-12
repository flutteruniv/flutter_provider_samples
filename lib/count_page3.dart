import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpods_sample/count_model.dart';

class CountPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(),
        body: CountPageBody(),
        floatingActionButton: CountButton(),
      ),
    );
  }
}

class CountPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<CountModel>();
    final count = model.counter;
    return Center(
      child: Text(
        '$count',
        style: TextStyle(
          fontSize: 80,
          color: Colors.red,
        ),
      ),
    );
  }
}

class CountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<CountModel>();
    return FloatingActionButton(
      onPressed: model.incrementCounter,
      child: Icon(Icons.add),
    );
  }
}
