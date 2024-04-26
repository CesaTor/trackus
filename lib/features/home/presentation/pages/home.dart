import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:trackus/core/i18n/strings.g.dart';
import 'package:trackus/core/models/item/item.dart';
import 'package:trackus/features/home/data/repositories/item_repository.dart';
import 'package:trackus/features/home/domain/domain.dart';
import 'package:trackus/features/home/domain/usecases/usecases.dart';
import 'package:trackus/features/home/presentation/cubit/home_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final itemRepo = ItemRepositoryImpl(context.read<Isar>());

        return HomeCubit(
          getAllItems: GetAllItems(itemRepo),
          insertItem: InsertItem(itemRepo),
          clearItems: ClearItems(itemRepo),
        )..init();
      },
      child: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = context.select((HomeCubit cubit) => cubit.state);

    return Scaffold(
      appBar: AppBar(title: Text(i18n.core.appName)),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: CircleAvatar(backgroundColor: Color(item.colorValue)),
            title: Text(item.name),
            subtitle: Text(item.description),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: () {
              context.read<HomeCubit>().addItem(
                    Item(
                      colorValue: Colors
                          .primaries[DateTime.now().millisecond %
                              Colors.primaries.length]
                          .value,
                      name: 'Item ${DateTime.now().millisecondsSinceEpoch}',
                      description:
                          'Description ${DateTime.now().millisecondsSinceEpoch}',
                    ),
                  );
            },
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: const Icon(Icons.add),
          ),
          MaterialButton(
            onPressed: () {
              context.read<HomeCubit>().clearItems();
            },
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: const Icon(Icons.bolt_outlined),
          ),
        ],
      ),
    );
  }
}
