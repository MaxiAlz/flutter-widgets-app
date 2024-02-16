import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//se usa un ConsumerWidget en ves de stateles para usar el estado de riverpod
class CounterScreen extends ConsumerWidget {
  static String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvier);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
              icon: Icon(isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined))
        ],
      ),
      body: Center(
          child: Text('Valor: $clickCounter',
              style: Theme.of(context).textTheme.titleLarge)),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //incrementar el contador
            // ref.read(counterProvier.notifier).state++;
            ref.read(counterProvier.notifier).update((state) => state + 1);
          },
          child: const Icon(Icons.add)),
    );
  }
}
