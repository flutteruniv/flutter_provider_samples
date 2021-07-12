import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpods_sample/count_model.dart';
import 'package:riverpods_sample/count_page.dart';

final countPageProvider = ChangeNotifierProvider<CountModel>(
  create: (_) => CountModel(),
  child: CountPage(),
);

class CountPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CountModel>(context);
    final count = model.count;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '$count',
          style: TextStyle(
            fontSize: 80,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: model.incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
