
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

import 'quanity.dart';
import 'foodStuff.dart';
import 'dish.dart';
import 'menu.dart';

class calenderState extends State<calender> {
  static DateTime _currentDate = DateTime.now();
  String formattedDate = DateFormat('MM月dd日').format(_currentDate);//日付をフォーマット



  static Quantity quanity1 = new Quantity(null,100.0);


  static FoodStuff foodStuff1 = new FoodStuff(
      "小麦粉",
      false,
      false,
      quanity1,
      false,
      776.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0,
      10.0
  );

  static List<FoodStuff> dish = [foodStuff1];

  static Dish dish1 = new Dish(dish, "小型コッパパン","主食");
  static Dish dish2 = new Dish(dish, "きつねうどん","副食");
  static Dish dish3 = new Dish(dish, "うの花コロッケ","副食");
  static Dish dish4 = new Dish(dish, "すいか","副食");
  static Dish dish5 = new Dish(dish, "チョコクリーム","副食");
  static Dish dish6 = new Dish(dish, "牛乳","副食");

  static String schoolName = "巴中学校";
  static List<Dish> dishList = [dish1,dish2,dish3,dish4,dish5,dish6];

  static Menu menu = new Menu(_currentDate, schoolName, dishList);



  void onDayPressed(DateTime date, List<Event> events) {//選択した日付を扱う日付にする関数
    String Date = DateFormat('MM月dd日').format(date);
    setState(() {
      formattedDate = Date;
    });
  }

  Widget _calenderScreen() {//カレンダーの画面
    return Container(
      child: CalendarCarousel<Event>(
          locale:'ja_JP',
          showOnlyCurrentMonthDate:true,
          onDayPressed: onDayPressed,
          weekendTextStyle: TextStyle(color: Colors.red),
          weekFormat: false,
          height: 450.0,
          selectedDateTime: _currentDate,
          todayTextStyle: TextStyle(
            color: Colors.white,
          ),
          todayBorderColor: Colors.green,
      ),
    );
  }

  Widget _schoollunchScreen(){//下の献立表を出力する画面
    List<String> listDish = [];//メニューを格納するリスト
    for (var i = 0; i < dishList.length; i++) {//dishListから順番に料理名を取り出しlistDishに格納している
      listDish.add(dishList[i].dishName);
    }
    return Container(
        margin: EdgeInsets.all(16.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(//○月○日の献立と表示させるためのboxの設定
              width: 500.0,
              height: 50.0,
              child:  RaisedButton(//ボタン
                onPressed: () {
                  detailsState(currentDate:formattedDate);
                  Navigator.pushNamed(context, '/details');
                },
                child:  Text(
                  '$formattedDateの献立',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:16.0,
                  ),
                ),
              ),
            ),
            Container(//主食のメニュー
              margin: EdgeInsets.only(left:50.0,top:20.0),
              child: Row(
                  children:<Widget>[
                    Text(
                      '主食 ',//ここら辺を変える必要がある
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:24.0,
                      ),
                    ),
                    Text(
                      listDish[0],//ここら辺をmenuとかに置き換える？
                      style: TextStyle(
                        fontSize:20.0,
                      ),
                    ),
                  ]
              ),
            ),
            Container(//副食のメニュー
              margin: EdgeInsets.only(left:50.0),
              child: Row(
                  children:<Widget>[
                    Text(
                      '副食   ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:24.0,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            listDish[1],//ここら辺をmenuとかに置き換える？
                            style: TextStyle(
                              fontSize:20.0,
                            ),
                          ),
                          Text(
                            listDish[2],//ここら辺をmenuとかに置き換える？
                            style: TextStyle(
                              fontSize:20.0,
                            ),
                          ),
                          Text(
                            listDish[3],//ここら辺をmenuとかに置き換える？
                            style: TextStyle(
                              fontSize:20.0,
                            ),
                          ),
                          Text(
                            listDish[4],//ここら辺をmenuとかに置き換える？
                            style: TextStyle(
                              fontSize:20.0,
                            ),
                          ),
                          Text(
                            listDish[5],//ここら辺をmenuとかに置き換える？
                            style: TextStyle(
                              fontSize:20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {//画面の設定
    return Scaffold(
        appBar: new AppBar(
          title: new Text('カレンダー画面'),
        ),
        body: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _calenderScreen(),
              _schoollunchScreen(),
            ],
          ),
        )
    );
  }
}

class detailsState extends State<details> {//選択した日付の献立画面へ行った先のクラス（仮）
  String currentDate ;
  detailsState({this.currentDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('$currentDateの献立画面')),
        body: Center(
            child: RaisedButton(
                child: Text('カレンダー画面に戻る'),
                onPressed: () {
                    Navigator.pop(context);
                },
            ),
        ),
    );
  }
}


class calender extends StatefulWidget {
  @override
  calenderState createState() => calenderState();
}

class details extends StatefulWidget {
  @override
  detailsState createState() => detailsState();
}