import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/today/presentation/widgets/item_adder.dart';
import 'package:trackus/lib.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Today')),
      body: const Center(child: Text('Today Page')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final projects = await GetAllProjects(context.read()).call();

          if (context.mounted) {
            await showModalBottomSheet<void>(
              context: context,
              builder: (context) {
                return ItemAdder(
                  projects: projects,
                );
              },
              shape: const BeveledRectangleBorder(),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
