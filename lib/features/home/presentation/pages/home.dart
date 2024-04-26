import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:trackus/core/i18n/strings.g.dart';
import 'package:trackus/core/models/item/item.dart';
import 'package:trackus/core/ui/ui.dart';
import 'package:trackus/features/home/data/repositories/item_repository.dart';
import 'package:trackus/features/home/domain/domain.dart';
import 'package:trackus/features/home/domain/usecases/usecases.dart';
import 'package:trackus/features/home/presentation/cubit/home_cubit.dart';
import 'package:trackus/features/home/presentation/widgets/items_list.dart';

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
      body: ItemsList(items: items),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        PrimaryButton(
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
          text: 'Add',
          // child: const Icon(Icons.add),
        ),
        PrimaryButton(
          onPressed: () {
            context.read<HomeCubit>().clearItems();
          },
          text: 'Clear',
          // child: const Icon(Icons.bolt_outlined),
        ),
      ],
    );
  }
}
