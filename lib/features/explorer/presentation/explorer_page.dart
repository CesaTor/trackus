import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/features/explorer/presentation/explore_viewmodel.dart';
import 'package:trackus/features/explorer/route/explorer_route.dart';
import 'package:trackus/features/settings/route/settings_route.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({required this.viewmodel, super.key});

  final ExploreViewModel viewmodel;

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  @override
  void initState() {
    widget.viewmodel.init();

    super.initState();
  }

  @override
  void dispose() {
    widget.viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projects = widget.viewmodel.projects.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.explorer.main.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => const SettingsRouteData().push<void>(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  projects.isEmpty
                      ? i18n.explorer.main.noProjects
                      : '${i18n.explorer.main.projects}:',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final project = projects[index];
                  return InkWell(
                    onTap: () {
                      ExploreProjectIdRouteData(project.id ?? 0)
                          .push<void>(context);
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          project.icon,
                          color: project.colorValue.color,
                        ),
                        title: Text(project.name),
                      ),
                    ),
                  );
                },
                childCount: projects.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final res = await const ExploreAddRouteData().push<Project>(context);

          if (res != null && context.mounted) {
            final p = await widget.viewmodel.addProject(res);
            debugPrint('added project: $p');
          }
        },
        icon: const Icon(Icons.add),
        label: Text(i18n.explorer.add.cta),
      ),
    );
  }
}
