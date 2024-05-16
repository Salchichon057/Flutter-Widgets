import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl
  });
}

final slides = <SlideInfo> [
  const SlideInfo(
    title: 'Busca la comida',
    caption: 'Encuentra los mejores restaurantes cerca de ti',
    imageUrl: 'assets/images/1.png'
  ),
  const SlideInfo(
    title: 'Entrega rápida',
    caption: 'Recibe tu comida en minutos',
    imageUrl: 'assets/images/2.png'
  ),
  const SlideInfo(
    title: 'Disfruta tu comida',
    caption: 'Disfruta de tu comida favorita en casa',
    imageUrl: 'assets/images/3.png'
  ),
];

class AppTutorialScreen extends StatefulWidget {
  
  static const String routeName = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      } else if (endReached && page < (slides.length - 1.5)) {
        setState(() {
          endReached = false;
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(
              title: slideData.title,
              caption: slideData.caption,
              imageUrl: slideData.imageUrl,
            )).toList(),
          ),

          Positioned(
            right: 20.0,
            top: 50.0,
            child: TextButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Salir', style: TextStyle( fontSize: 20.0),),
            ),
          ),

          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 500),
              child: FilledButton(
                child: const Text('Comenzar'),
                onPressed: () {
                  context.go('/');                  
                },
              ),
            )
          ): const SizedBox.shrink()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20.0),
            Text(title, style: titleStyle),
            const SizedBox(height: 10.0),
            Text(caption, style: captionStyle),
          ],
        )
      ),
    );
  }
}