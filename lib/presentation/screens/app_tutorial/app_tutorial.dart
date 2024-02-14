import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String captions;
  final String url;

  SlideInfo(this.title, this.captions, this.url);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Do laborum consequat do in duis duis qui.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Consectetur minim deserunt ea minim occaecat eiusmod veniam id culpa minim occaecat dolore ut.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Velit quis dolore mollit labore est nisi elit laborum sit aliquip commodo adipisicing.',
      'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static String name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map(
                      (slide) => _Slide(slide.title, slide.captions, slide.url))
                  .toList()),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                onPressed: () => {context.pop()},
                child: const Text('Salir'),
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(microseconds: 100),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () => context.pop(),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String url;
  const _Slide(this.title, this.caption, this.url);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(url)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
