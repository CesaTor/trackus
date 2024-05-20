import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/app/global.dart';
import 'package:trackus/app/i18n/i18n.dart';
import 'package:trackus/app/usecases/usecases.dart';
import 'package:trackus/features/item_list/item_list.dart';
import 'package:trackus/features/today/usecases/usecases.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemListPage(
      title: i18n.core.today,
      dueDate: today,
      getItems: GetTodayItems(context.read()).call,
      getProjects: GetAllProjects(context.read()).call,
      insertItem: InsertItem(context.read()).call,
    );
  }
}
