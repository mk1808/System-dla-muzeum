import 'package:flutter/material.dart';
import 'package:mguidevisitor/myLogo.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          MyLogo(),
          const Text('mGuide'),
        ],
      ),
      backgroundColor: Colors.cyan[600],
      foregroundColor: Colors.white
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  }