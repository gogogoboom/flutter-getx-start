import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

class BaseSlideAction extends StatelessWidget {
  final SlidableActionCallback onTap;
  final Color? color;
  final IconData? iconData;
  final String label;

  const BaseSlideAction(
      {Key? key,
      required this.onTap,
      this.color,
      this.iconData,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SlidableAction(
        flex: 1,
        onPressed: onTap,
        backgroundColor: color ?? Get.theme.backgroundColor,
        foregroundColor: Colors.white,
        icon: iconData,
        label: label,
      );
}
