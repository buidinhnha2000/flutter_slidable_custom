import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: Scaffold(
        key: _scaffoldKey,
        body: ListView(
          children: [
            Slidable(
              controller: controller,
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(1),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.15,
                closeThreshold: 0.2,
                openThreshold: 0.2,
                onDismissible: () {},
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Colors.orangeAccent,
                    icon: Icons.calendar_month,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.only(left: 0),
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.15,
                closeThreshold: 0.2,
                openThreshold: 0.2,
                dragDismissible: false,
                onDismissible: () {},
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Colors.blue,
                    icon: Icons.checklist,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.only(left: 0),
                  ),
                ],
              ),
              dragStartBehavior: DragStartBehavior.start,

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: const ListTile(title: Text('Slide me')),
            ),
          ],
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
