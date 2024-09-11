import 'package:flutter/material.dart';
import 'package:playroom/feature/main/home/presentation/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomePage(),
      ),
    );
  }
}
