import 'package:device_shop_app/screen/tab_box/card/card_page.dart';
import 'package:device_shop_app/screen/tab_box/home_page/home_page.dart';
import 'package:device_shop_app/screen/tab_box/profile/profile.dart';
import 'package:device_shop_app/view_models/tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {

  List<Widget> screen = [];

  @override
  void initState() {
    screen.add(HomePage());
    screen.add(CardPage());
    screen.add(Profile());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var index = context.watch<TabViewModel>().activPageIndex;
    print(DateTime.now().toString());
    return Scaffold(
      body: screen[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        
        onTap: (value)=> Provider.of<TabViewModel>(context, listen: false).ChangePageIndex(value),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
        ],
      ),
    );
  }
}