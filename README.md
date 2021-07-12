# providerについての解説

## providerの基本の書き方

- ChangeNotifierProvider<Model>で囲んでmodelをイニシャライズする
- modelの値変更に応じてリビルドしたい箇所をConsumer<Model>で囲む

```dart
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
```
  
## provider配下のWidgetはproviderで囲まれたmodelを呼び出せる
  
以下のようにCountPageBodyを定義した場合

```dart
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
```

CountPageBodyでは、後述する４通りの書き方によりmodelを呼び出せる。
  
```dart
class CountPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<CountModel>();
    final count = model.count;
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
```

## providerのmodelの呼び出し方

### Provider.of

notifiListeners()で変更されたら呼ばれる。

```dart
final model = Provider.of<CountModel>(context);
```

### context.watch

notifiListeners()で変更されたら呼ばれる。

```dart
final model = context.watch<CountModel>();
```

### context.read

１回しか呼ばれない。notifiListeners()で変更されても呼ばれない。

```dart
final model = context.read<CountModel>();
```

### context.select

特定のpropertyが更新された時だけ呼ばれる

```dart
final count = context.select<CountModel, int>(
      (CountModel model) => model.count,
    );
```
  
 # 参考文献
https://pub.dev/packages/provider 
