import 'dart:async';
import 'package:hcmcontest/widget/about.dart';
import 'package:intl/intl.dart';

import 'model/total_info.dart';
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
  int selectIndex = 1;
  List<Widget> listScreen = [const VaccineByDay(),TotalInfoState(),AboutUs()];
  List<String> listTitle = ['Biểu đồ tiêm vắc xin theo ngày','Thông tin về số mũi tiêm','Về chúng tôi'];
    void _selectPage(int index) {
      setState(() {
        selectIndex = index;
      });
  }
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
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Color.fromRGBO(39, 51, 147, 1),
          //   child: Icon(Icons.refresh),
          //   onPressed: () {
          //     setState(() {
          //       bodyWidget = bodyWidget;
          //       title = title;
          //     });
          //     ;
          //   },
          // ),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(120, 40, 103, 1),
            automaticallyImplyLeading: true,
            title: Text(listTitle[selectIndex]),
          ),
          // drawer: Drawer(
          //   child: ListView(
          //     children: <Widget>[
          //       // ignore: prefer_const_constructors
          //       DrawerHeader(
          //         decoration: const BoxDecoration(
          //           gradient: LinearGradient(
          //               begin: Alignment(0, 1),
          //               end: Alignment(-1, 0),
          //               colors: [
          //                 Color.fromRGBO(46, 48, 145, 1),
          //                 Color.fromRGBO(39, 80, 147, 1)
          //               ]),
          //         ),
          //         // ignore: prefer_const_constructors
          //         child: Center(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Container(
          //                 height: 70,
          //                 width: 200,
          //                 decoration: const BoxDecoration(
          //                   image: DecorationImage(
          //                       image: AssetImage('assets/images/logo.png'),
          //                       fit: BoxFit.fitWidth),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       ListTile(
          //         title: const Text('Thông tin chính về số mũi tim'),
          //         onTap: () {
          //           _gotoHomePage();
          //           _closeDrawer(300);
          //         },
          //       ),
          //       ListTile(
          //         title: const Text('Só lượng người được tiêm theo ngày'),
          //         onTap: () {
          //           _gotoChartPage();
          //           _closeDrawer(300);
          //         },
          //       ),
          //       ListTile(
          //         title: const Text('Danh sách các nơi được tiêm'),
          //         onTap: () {},
          //       ),
          //     ],
          //   ),
          // ),
          body: listScreen[selectIndex],
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.white.withAlpha(255),
            elevation: 0,
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.white.withAlpha(0),
              type: BottomNavigationBarType.fixed,
              onTap: _selectPage,
              currentIndex: selectIndex,
              items: const [
                
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.stacked_bar_chart_outlined,
                    ),
                    label: "Biểu đồ"),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: "Trang chủ",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.group_outlined,
                      // color: Colors.transparent,
                    ),
                    label: "About"),
              ],
              selectedLabelStyle: TextStyle(color: Color.fromRGBO(46, 48, 145, 1)),
              selectedItemColor: Color.fromRGBO(46, 48, 145, 1),
              unselectedItemColor: Color(0xff999999),
            ),
          )),
    );
  }
}

class VaccineByDay extends StatefulWidget {
  const VaccineByDay({
    Key? key,
  }) : super(key: key);

  @override
  State<VaccineByDay> createState() => _VaccineByDayState();
}

class _VaccineByDayState extends State<VaccineByDay> {
  late List listStatistic = [];
  late List<DateTime> listDate = [];
  @override
  void initState(){
    super.initState();
    fetchData();
  }
  fetchData () async{
    List list = await TotalInfo.getListInjectionByDay();
    List list10Final = [];
    for (int i=1;i<=10;i++) {
      list10Final.add(list[list.length-i]);
    }
    list10Final = list10Final.reversed.toList();
    setState(() {
      listStatistic = list10Final.map((dayData) => dayData['totalInjected']).toList();
      listDate = list10Final.map((dayData) => DateTime.parse(dayData['reportedDate']).add(const Duration(days: 1))).toList();
    });
  }
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
            child: listDate.isEmpty ? const Text('Loading') : LineChartWidget(listStatistic,listDate),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class TotalInfoState extends StatefulWidget {
  @override
  State<TotalInfoState> createState() => _TotalInfoStateState();
}

class _TotalInfoStateState extends State<TotalInfoState> {
  //late Future<TotalInfo> futureTotalInfo;

  // @override
  // void initState() {
  //   super.initState();
  //   futureTotalInfo = TotalInfo.getTotalInfofromXML();
  // }
  late Map totalData = {
    "allocatedDate": 0, 
    "vaccineTotal": 0, 
    "vaccineAllocation": 0, 
    "objectInjection": 0, 
    "totalPopulation": 0, 
    "totalOneInjected": 0, 
    "totalTwiceInjected": 0
    };

  @override
    void initState (){
      super.initState();
      fetchData();
    }
  fetchData () async{
    Map data = await TotalInfo.getTotalInfofromXML();
    setState(() {
      totalData = data;
    });
  }
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
                // FutureBuilder<TotalInfo>(
                //   future: futureTotalInfo,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Padding(
                //         padding: EdgeInsets.only(top: 30),
                //         child: Center(
                //             child: Text(
                //           '127926746',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //               color: Color.fromRGBO(120, 40, 103, 1),
                //               fontFamily: 'SF Pro Display',
                //               fontSize: 40,
                //               fontWeight: FontWeight.bold,
                //               height: 1),
                //         )),
                //       );
                //     } else if (snapshot.hasError) {
                //       return Text('${snapshot.error}');
                //     }

                //     // By default, show a loading spinner.
                //     return const CircularProgressIndicator();
                //   },
                // ),

                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                      child: Text(
                    totalData['totalPopulation'].toString(),
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
                // FutureBuilder<TotalInfo>(
                //   future: futureTotalInfo,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Padding(
                //         padding: EdgeInsets.only(top: 30),
                //         child: Center(
                //             child: Text(
                //           '127926746',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //               color: Color.fromRGBO(120, 40, 103, 1),
                //               fontFamily: 'SF Pro Display',
                //               fontSize: 40,
                //               fontWeight: FontWeight.bold,
                //               height: 1),
                //         )),
                //       );
                //     } else if (snapshot.hasError) {
                //       return Text('${snapshot.error}');
                //     }

                //     // By default, show a loading spinner.
                //     return const CircularProgressIndicator();
                //   },
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                      child: Text(
                    totalData['totalOneInjected'].toString(),
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
        ],
      ),
    );
  }
}
