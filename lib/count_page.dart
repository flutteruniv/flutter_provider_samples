import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpods_sample/count_model.dart';

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Consumer<CountModel>(builder: (context, model, child) {
            final count = model.count;
            return Text(
              '$count',
              style: TextStyle(
                fontSize: 80,
                color: Colors.red,
              ),
            );
          }),
        ),
        floatingActionButton:
            Consumer<CountModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: model.incrementCounter,
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
