import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'widget/line_chart_widget.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(39, 51, 147, 1),
            child: Icon(Icons.refresh),
            onPressed: () {},
          ),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(120, 40, 103, 1),
            automaticallyImplyLeading: true,
            // leading: IconButton(
            //   icon: const Icon(
            //     Icons.menu,
            //     semanticLabel: 'menu',
            //   ),
            //   onPressed: () {
            //     print('Menu button');
            //   },
            // ),

            title: Text('Vaccine in Viet Nam'),
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
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Danh sách các nơi được tiêm'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: const Center(child: Text('Dữ liệu tiêm theo ngày'))),
                const SizedBox(height: 10),
                Container(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.only(right: 23),
                  height: MediaQuery.of(context).size.height - 220,
                  child: LineChartWidget(),
                ),
                const SizedBox(height: 10),
                Center(child: Text('Số lượng người được tiêm theo ngày')),
              ],
            ),
          )),
    );
  }
}
