import 'package:demo/Helper/Notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Notifier notifier = Notifier();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => notifier,
        child: Column(
          children: [
            Text(
              "Today Special",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Container(
              height: 200,
              child: Consumer<Notifier>(
                builder: (context, model, child) {
                  List list = [];
                  List trimmedList = [];
                  List webList = [];
                  Map myMap = model.dataModel.toJson();
                  list.addAll(myMap.values);

                  /// only url goes in list
                  list.forEach((element) {
                    if (element.toString().startsWith("http://"))
                      webList.add(element);
                  });
                  Map<int, String> values = {};

                  ///URL separated perfectly
                  webList.forEach(
                    (element) {
                      element.toString().split(",");
                      final tagName = element.toString();
                      final split = tagName.split(',');
                      values = {
                        for (int i = 0; i < split.length; i++) i: split[i]
                      };
                      values.forEach(
                        (key, value) {
                          if (value.startsWith("http://"))
                            trimmedList.add(value);
                        },
                      );
                    },
                  );
                  return Card(
                    child: Image.network(trimmedList[1], fit: BoxFit.contain),
                  );
                },
              ),
            ),
            Text(
              "Shop by Category",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Container(
              height: 300,
              child: Consumer<Notifier>(
                builder: (context, model, child) {
                  if (model.categoryDataModel.result != null) {
                    return GridView.builder(
                      scrollDirection: Axis.horizontal,
                      addAutomaticKeepAlives: true,
                      shrinkWrap: true,
                      itemCount: model.categoryDataModel.result!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, int index) => Card(
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              child: Image.network(
                                model.categoryDataModel.result![index].num!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                                model.categoryDataModel.result![index].amount!),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
