import 'dart:ui';
import 'package:extinct_app/domain/animal/animal.dart';
import 'package:extinct_app/presentacion/animal/animal_view.dart';
import 'package:extinct_app/presentacion/chat/chat_page.dart';
import 'package:extinct_app/presentacion/home/home_menu_drawer.dart';
import 'package:extinct_app/presentacion/home/page_view_indication.dart';
import 'package:extinct_app/presentacion/home/talk_to_me_button.dart';
import 'package:extinct_app/presentacion/widgets/app_bar_leading_button/app_bar_leading_button.dart';
import 'package:flutter/material.dart';

final animals = <Animal>[
  Animal(name: 'Dodo', assetName: 'dodo.png', extinctYear: 1567),
  Animal(name: 'Pigeo', assetName: 'pigeo.png', extinctYear: 1567),
  Animal(name: 'Quagga', assetName: 'quagga.png', extinctYear: 1567),
  Animal(name: 'Bucardo', assetName: 'bucardo.png', extinctYear: 1567),
  Animal(name: 'Thylacine', assetName: 'thyla.png', extinctYear: 1567),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageViewController = PageController();
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    final blurValue = _isDrawerOpen ? 10.0 : 0.0;
    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeadingButton(
          icon: Icons.menu,
          onTap: () {
            setState(() {
              _isDrawerOpen = !_isDrawerOpen;
            });
          },
        ),
      ),
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
            child: PageView(
              controller: pageViewController,
              children: animals.map((e) => AnimalView(animal: e)).toList(),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PageView_indication(
                  controller: pageViewController,
                  pageViewLength: animals.length,
                ),
                const SizedBox(height: 64),
                TalkToMeButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                            animal: animals[pageViewController.page!.round()]),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if (_isDrawerOpen)
            Positioned.fill(
              child: HomeMenuDrawer(
                onClose: () {
                  setState(() {
                    _isDrawerOpen = false;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}
