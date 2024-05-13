import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/explorer/route/explorer_route.dart';
import 'package:trackus/lib.dart';

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorer'),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: FutureBuilder(
            future: GetAllProjects(context.read()).call(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final projects = snapshot.data ?? <Project>[];

              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Projects:', style: TextStyle(fontSize: 16)),
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
                              leading: Icon(project.icon),
                              title: Text(project.name),
                            ),
                          ),
                        );
                      },
                      childCount: projects.length,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            const ExploreAddRouteData().push<void>(context);
          },
          icon: const Icon(Icons.add),
          label: const Text('Add project'),
        ),
      ),
    );
  }
}
