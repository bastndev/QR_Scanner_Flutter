import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_qr/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.shape_line),
          label: '@bastndev'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.link),
          label: 'Links'
        )
      ],
    );
  }
}