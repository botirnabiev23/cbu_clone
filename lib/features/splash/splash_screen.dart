import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => Spinkit();
}

class Spinkit extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
    ).then(
      (value) {
        if (!mounted) {
          return;
        }
        context.go('/currency');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(250, 210, 60, 1),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          image: AssetImage('assets/images/spalsh_image.PNG'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
