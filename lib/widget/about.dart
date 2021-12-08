import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: const Text(
            'Team I-Code',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'SF Pro Display',
                fontSize: 24,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
        Expanded(
          // height: 500,
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16),
            childAspectRatio: 8.0 / 9.0,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 18 / 11,
                      child: Image.network(
                          "https://scontent.fdad3-1.fna.fbcdn.net/v/t1.6435-9/81740210_2588014608145725_9161005173231845376_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=YznZ9edVUEIAX-xvh50&tn=YevdyLRabSMRO7rI&_nc_ht=scontent.fdad3-1.fna&oh=3d6b796ac70c72cfea2cadf2fdaf2b7d&oe=61D4E5BF"),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                              child: Text(
                            'Nguyễn Chiếm Dự',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          )),
                          Text("Member")
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 18 / 11,
                      child: Image.network(
                          "https://media-exp1.licdn.com/dms/image/D5603AQG4PpdGbklfGw/profile-displayphoto-shrink_200_200/0/1638079949506?e=1644451200&v=beta&t=dU6JkQU-KOLY-sisfZV0gpIPD7tDL9qhOKvS2GJke-g"),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Nguyễn Xuân Cảm',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          Text("Leader")
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 18 / 11,
                      child: Image.network(
                          "https://scontent.fdad3-4.fna.fbcdn.net/v/t1.6435-9/126309784_677121402949919_5054768527732173777_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=89NF9dg4GKUAX-mMPTk&_nc_ht=scontent.fdad3-4.fna&oh=a277ec72ddd49d208fe509b9e598d298&oe=61D4BCC4"),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Hoàng Ngọc Châu Giang',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          Text("Member")
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 18 / 11,
                      child: Image.network(
                          "https://scontent.fdad3-1.fna.fbcdn.net/v/t1.6435-9/184868772_2740862299537674_7930765183968366296_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=MQj_rZZBq2oAX9B3cdQ&_nc_ht=scontent.fdad3-1.fna&oh=1b60b99d690ed3012d8d9920c2726ed7&oe=61D63320"),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Hoàng Ngọc Châu Giang',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          Text("Member")
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
