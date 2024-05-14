import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/core/extensions/extensions.dart';
import 'package:trackus/features/explorer/route/explorer_route.dart';
import 'package:trackus/features/settings/route/settings_route.dart';
import 'package:trackus/lib.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  late List<Project> projects;
  late StreamSubscription<List<Project>> streamSubscription;

  List<Project> removeInbox(List<Project> projects) {
    return projects
        .where((element) => element.id != defaultProject.id)
        .toList();
  }

  @override
  void initState() {
    projects = [];
    GetAllProjects(context.read())
        .call()
        .then((value) => setState(() => projects = removeInbox(value)));

    streamSubscription = WatchAllProjects(context.read())
        .call()
        .listen((event) => setState(() => projects = removeInbox(event)));

    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            final pId = await InsertProject(context.read()).call(res);
            debugPrint(pId.toString());
          }
        },
        icon: const Icon(Icons.add),
        label: Text(i18n.explorer.add.cta),
      ),
    );
  }
}
