import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/item_list/item_list.dart';
import 'package:trackus/lib.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemListPage(
      title: 'Inbox',
      defaultProject: defaultProject,
      getItems: GetInboxItems(context.read()).call,
      getProjects: GetAllProjects(context.read()).call,
      insertItem: InsertItem(context.read()).call,
    );
  }
}
