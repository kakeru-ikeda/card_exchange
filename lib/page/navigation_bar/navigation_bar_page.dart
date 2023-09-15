import 'package:card_exchange/constance/color_name.dart';
import 'package:card_exchange/page/exchange/exchange_modal.dart';
import 'package:card_exchange/page/home/home_page.dart';
import 'package:card_exchange/page/personal/personal_page.dart';
import 'package:card_exchange/page/save_cards/save_cards_page.dart';
import 'package:card_exchange/page/setting/setting_page.dart';
import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  Color selectedColor = ColorName.themeColor;
  Color unselectedColor = ColorName.unselectedColor;
  List<Color> buttonsColor = [
    ColorName.themeColor,
    ColorName.unselectedColor,
    ColorName.unselectedColor,
    ColorName.unselectedColor
  ];

  @override
  Widget build(BuildContext context) {
    PageController _screen = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        controller: _screen,
        onPageChanged: (value) {
          print('👑　onPageChanged : $value');
          setState(() {
            buttonsColor = List.filled(4, unselectedColor);
            buttonsColor[value] = selectedColor;
          });
          print(buttonsColor);
        },
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          PersonalPage(),
          SaveCardsPage(),
          SettingPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 90,
        width: 90,
        child: FloatingActionButton(
          backgroundColor: ColorName.themeColor.shade400,
          onPressed: () {
            showModalBottomSheet(
              //モーダルの背景の色、透過
              backgroundColor: Colors.transparent,
              //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return ExchangeModal();
              },
            );
          },
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.compare_arrows,
                color: Colors.white,
                size: 42,
              ),
              Text(
                '交換',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 6.0,
        elevation: 10.0,
        height: 65,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    _screen.jumpToPage(0);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: buttonsColor[0],
                    ),
                    Text(
                      'ホーム',
                      style: TextStyle(
                        color: buttonsColor[0],
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _screen.jumpToPage(1);
                    // buttonsColor[1] = selectedColor;
                    // print(buttonsColor);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: buttonsColor[1],
                    ),
                    Text(
                      '個人情報',
                      style: TextStyle(
                        color: buttonsColor[1],
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
                width: 100,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _screen.jumpToPage(2);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.storage_rounded,
                      color: buttonsColor[2],
                    ),
                    Text(
                      '名刺保管',
                      style: TextStyle(color: buttonsColor[2], fontSize: 12),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _screen.jumpToPage(3);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: buttonsColor[3],
                    ),
                    Text(
                      '一般設定',
                      style: TextStyle(color: buttonsColor[3], fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
