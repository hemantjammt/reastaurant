import 'package:demo/Helper/ModelNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ModelNotifier modelNotifier = ModelNotifier();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    modelNotifier.getRestApi();
    return Scaffold(
      appBar: AppBar(
        title: Text("Banner List"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => modelNotifier,
        child: Consumer<ModelNotifier>(
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
                values = {for (int i = 0; i < split.length; i++) i: split[i]};
                values.forEach(
                  (key, value) {
                    if (value.startsWith("http://")) trimmedList.add(value);
                  },
                );
              },
            );
            return ListView.builder(
              addAutomaticKeepAlives: true,
              physics: BouncingScrollPhysics(),
              itemCount: trimmedList.length,
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(child: Image.network(trimmedList[index])),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
