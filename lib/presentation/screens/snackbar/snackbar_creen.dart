import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static String name = 'snackbar';
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBarContent = SnackBar(
      content: const Text('hola pa'),
      action: SnackBarAction(
        label: 'ok!',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBarContent);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro de coso?'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('cancelar')),
          FilledButton(onPressed: () {}, child: const Text('aceptar')),
        ],
        content: const Text(
            'Do cupidatat amet enim quis sint voluptate cupidatat enim aliqua. Lorem esse velit velit sint pariatur excepteur ipsum anim sunt aliqua incididunt. Ullamco non magna duis aute officia ex dolore adipisicing aute.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dilogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Fugiat pariatur eiusmod eiusmod voluptate veniam. Pariatur sit elit exercitation incididunt laboris exercitation ea enim in ut eu elit. Reprehenderit anim elit velit labore mollit nostrud aliquip non amet deserunt ullamco adipisicing dolor aliquip. Laborum dolor id cupidatat do nostrud anim exercitation anim est. Et enim esse magna aliquip pariatur magna velit magna occaecat sit. Deserunt consectetur ullamco ex non reprehenderit ut.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar dialogos')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
