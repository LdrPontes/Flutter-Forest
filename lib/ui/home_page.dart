import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _minutes = 25;
  int _arvore = 2;

  Color _sliderColor = Color(0xFF85C639);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: null,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16, right: 8),
            width: 67,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 4, right: 4),
                  child: SvgPicture.asset(
                    "res/icons/coin.svg",
                    height: 15,
                  ),
                ),
                Text(
                  "124",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4, right: 4),
                  child: SvgPicture.asset(
                    "res/icons/add.svg",
                    height: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: _body(),
      drawer: _drawer(),
      backgroundColor: Color(0xFF50A387),
    );
  }

  _body() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Text(
              "Comece a plantar hoje!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          _image(),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Text(
              "$_minutes:00",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w100),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: MaterialButton(
              child: Text(
                "Plantar",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
              elevation: 10,
              minWidth: 120,
              height: 40,
              color: Color(0xFF66C7A6),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  _image() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 8),
          alignment: Alignment.center,
          child: Image.asset(
            'res/images/clock.png',
            height: 200,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 64),
          alignment: Alignment.center,
          child: Image.asset(
            'res/images/arvore$_arvore.png',
            height: 80,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: SingleCircularSlider(
            22,
            3,
            height: 220,
            baseColor: Color(0xFFC0CE77),
            sliderStrokeWidth: 10,
            handlerOutterRadius: 8,
            handlerColor: _sliderColor,
            selectionColor: _sliderColor,
            onSelectionChange: _onSelectionChange,
          ),
        )
      ],
    );
  }

  _onSelectionChange(int init, int end, int laps) {
    setState(() {
      _minutes = 10 + (end * 5);

      if (_minutes >= 25) {
        _sliderColor = Color(0xFF85C639);
      } else {
        _sliderColor = Color(0xFFF3AF04);
      }

      if (_minutes >= 25 && _minutes < 60) {
        _arvore = 2;
      } else if (_minutes >= 60 && _minutes < 90) {
        _arvore = 3;
      } else if (_minutes >= 90) {
        _arvore = 4;
      } else {
        _arvore = 1;
      }
    });
  }

  _drawer() {
    return Container(
      width: MediaQuery.of(context).size.height * 0.25,
      color: Color(0xFF50A387),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          _drawerItem("Floresta", "res/icons/trees.svg"),
          _drawerItem("Linha do tempo", "res/icons/timeline.svg"),
          _drawerItem("Marcadores", "res/icons/tag.svg"),
          _drawerItem("Amigos", "res/icons/two-users.svg"),
          _drawerItem("Conquistas", "res/icons/medal.svg"),
          _drawerItem("Loja", "res/icons/shop.svg"),
          _drawerItem("Floresta Real", "res/icons/growth.svg"),
          _drawerItem("Notícias", "res/icons/newspaper.svg"),
          _drawerItem("Configurações", "res/icons/settings.svg")
        ],
      ),
    );
  }

  _drawerItem(title, icon) {
    return InkWell(
      onTap: () {
        print("Clicou");
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 16,
            ),
            Container(
                child: SvgPicture.asset(
              icon,
              color: Colors.white,
              height: 20,
            )),
            SizedBox(
              width: 16,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
