import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/app/app.dart';
import 'package:trackus/features/features.dart';
import 'package:trackus/features/item_list/item_list.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemListPage(
      title: i18n.core.project.inbox,
      project: defaultProject,
      getItems: GetInboxItems(context.read()).call,
      watchItems: () => WatchItemsByProject(context.read()).call(
        defaultProject.id ?? 0,
      ),
      getProjects: GetAllProjects(context.read()).call,
      insertItem: InsertItem(context.read()).call,
    );
  }
}
