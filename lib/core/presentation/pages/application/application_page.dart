import 'package:flutter/material.dart';
import 'package:uleraning_app/core/presentation/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: buildPage(0),
      ),
    );
  }
}
