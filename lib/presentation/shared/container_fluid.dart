import 'package:flutter/cupertino.dart';

class ContainerFluid extends StatelessWidget {
  final Color? color;
  final Widget child;

  const ContainerFluid({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
      ),
      child: child,
    );
  }
}
