import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_project/Item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLongPressed = false;
  List<Item> list = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Simple App'),
            actions: [
              isLongPressed == true
                  ? IconButton(
                      onPressed: () {
                        if (list.isEmpty) {
                          return;
                        }
                        setState(() {
                          //this loop will run upto list items that we have
                          for (var i = 0; i < list.length; i++) {
                            //this will delete all the selected items from the list
                            allItem.removeWhere(
                                (element) => element.id == list[i].id);
                          }
                          list = [];
                          isLongPressed = false;
                        });
                      },
                      icon: const Icon(Icons.delete))
                  : Container()
            ],
          ),
          body: ListView.builder(
              itemCount: allItem.length,
              itemBuilder: (context, index) {
                return Card(
                  // color: isLongPressed ? Colors.grey : Colors.white,
                  child: ListTile(
                    onLongPress: () {
                      setState(() {
                        isLongPressed = !isLongPressed;
                      });
                    },
                    onTap: () {
                      setState(() {
                        isLongPressed = false;
                      });
                    },
                    title: Text(allItem[index].title),
                    subtitle: Text(allItem[index].price),
                    trailing: isLongPressed == true
                        ? Checkbox(
                            value: allItem[index].isDelete,
                            onChanged: (value) {
                              setState(() {
                                allItem[index].isDelete =
                                    !allItem[index].isDelete;
                              });

                              if (allItem[index].isDelete == true) {
                                // for (var i = 0; i < allItem.length; i++) {
                                //   if (list.isEmpty) {
                                //     if (list[i] == allItem[i].id) {
                                //       return;
                                //     } else {
                                //       list.add(allItem[i].id);
                                //     }
                                //   }
                                // }

                                if (list.isEmpty) {
                                  list.add(Item(
                                      allItem[index].id,
                                      allItem[index].title,
                                      allItem[index].price,
                                      allItem[index].isDelete));
                                  return;
                                }
                                {
                                  //checking the value already exists inthe list or not
                                  //two instances will be added the

                                  list.add(Item(
                                      allItem[index].id,
                                      allItem[index].title,
                                      allItem[index].price,
                                      allItem[index].isDelete));
                                }
                                if (kDebugMode) {
                                  print(list);
                                }
                              }
                            })
                        : Container(
                            width: 1,
                            height: 1,
                          ),
                  ),
                );
              })),
    );
  }
}
