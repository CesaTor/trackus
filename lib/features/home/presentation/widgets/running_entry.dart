import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/lib.dart';

class RunningEntry extends StatelessWidget {
  const RunningEntry({
    required this.entry,
    super.key,
  });

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    final item = entry.item.value;

    if (item == null) return const SizedBox();

    return Container(
      height: 130,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: roundedBorder,
        gradient: LinearGradient(
          colors: [
            item.colorValue.color,
            item.colorValue.color.withAlpha(30),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _EntryTimer(start: entry.start),
            ],
          ),
          PrimaryButton(
            onPressed: () => context.read<AppCubit>().stop(),
            title: const Text('STOP'),
          ),
        ],
      ),
    );
  }
}

class _EntryTimer extends StatefulWidget {
  const _EntryTimer({required this.start});

  final DateTime start;

  @override
  State<_EntryTimer> createState() => _EntryTimerState();
}

class _EntryTimerState extends State<_EntryTimer> {
  late Timer t;

  @override
  void initState() {
    t = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      t.isActive
          ? DateTime.now().difference(widget.start).toString().split('.').first
          : '00:00:00',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
