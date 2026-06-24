import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  final List<Widget>? children;
  final Widget? child;
  final Widget? bottom;

  const HomeScaffold({
    this.children,
    this.bottom, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom,
      backgroundColor: MyColors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Res.scaffold), fit: BoxFit.fill),
        ),
        child: child??Column(
          children: children??[],
        ),
      ),
    );
  }
}
