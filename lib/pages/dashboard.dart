import 'package:desktop_side_bar_demo/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) => const MainLayout(
        child: SizedBox.shrink(),
      );
}
