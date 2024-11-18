import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class practice extends StatefulWidget {
  const practice({super.key});

  @override
  State<practice> createState() => _practiceState();
}

class _practiceState extends State<practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Slidable(
            key: const ValueKey(1),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: const [
                SlidableAction(
                  flex: 1,
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Archive',
                ),
              ],
            ),
            child: const ListTile(title: Text('Slide me')),
          ),
        ],
      ),
    );
  }
}

void doNothing(BuildContext context) {}
