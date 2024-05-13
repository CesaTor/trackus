import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/item_list/item_list.dart';
import 'package:trackus/lib.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemListPage(
      title: 'Today',
      defaultDueDate: today,
      getItems: GetTodayItems(context.read()).call,
      getProjects: GetAllProjects(context.read()).call,
      insertItem: InsertItem(context.read()).call,
    );
  }
}
