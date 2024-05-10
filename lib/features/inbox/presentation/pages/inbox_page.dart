import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/lib.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Inbox')),
        body: Center(child: Text('Inbox Page')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ClearItems(context.read()).call();
          },
          child: Icon(Icons.add),
        ));
  }
}
