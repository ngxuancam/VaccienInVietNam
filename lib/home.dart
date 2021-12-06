import 'dart:async';

import 'package:flutter/material.dart';
import 'widget/line_chart_widget.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Widget bodyWidget = TotalInfoState();
  late String title = "Infomation of Vaccine";
  @override
  Widget build(BuildContext context) {
    void _gotoChartPage() {
      setState(() {
        bodyWidget = VaccineByDay();
        title = "Vaccine Chart";
      });
    }

    void _gotoHomePage() {
      setState(() {
        bodyWidget = TotalInfoState();
        title = "Infomation of Vaccine";
      });
    }

    void _closeDrawer(int millisecond) {
      Timer(
        Duration(milliseconds: millisecond),
        () => Navigator.of(context).pop(),
      );
    }

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(39, 51, 147, 1),
            child: Icon(Icons.refresh),
            onPressed: () {
              _gotoHomePage();
            },
          ),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(120, 40, 103, 1),
            automaticallyImplyLeading: true,
            title: Text(title),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                // ignore: prefer_const_constructors
                DrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0, 1),
                        end: Alignment(-1, 0),
                        colors: [
                          Color.fromRGBO(46, 48, 145, 1),
                          Color.fromRGBO(39, 80, 147, 1)
                        ]),
                  ),
                  // ignore: prefer_const_constructors
                  child: Text(
                    '''Infomation of caccine in 
              Viet Nam''',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Só lượng người được tiêm theo ngày'),
                  onTap: () {
                    _gotoChartPage();
                    _closeDrawer(300);
                  },
                ),
                ListTile(
                  title: const Text('Danh sách các nơi được tiêm'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: bodyWidget),
    );
  }
}

class VaccineByDay extends StatelessWidget {
  const VaccineByDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child:
                const Center(child: Text('Số lượng người được tiêm theo ngày')),
          ),
          const SizedBox(height: 10),
          Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.only(right: 23),
            height: MediaQuery.of(context).size.height - 220,
            child: LineChartWidget(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class TotalInfoState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                      child: Text(
                    'Số mũi tiêm hôm qua',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                      child: Text(
                    '475561',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(39, 51, 147, 1),
                        fontFamily: 'SF Pro Display',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  )),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                      child: Text(
                    'Số mũi đã tiêm toàn quốc',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                      child: Text(
                    '127926746',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(120, 40, 103, 1),
                        fontFamily: 'SF Pro Display',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  )),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
