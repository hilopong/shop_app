import 'package:flutter/material.dart';
import '../components/splash_content.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
      "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: PageView.builder(
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"]!,
                    text: splashData[index]["text"]!,
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Row(
                    children: List.generate(splashData.length, (index) => buildDot())
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class buildDot extends StatelessWidget {
  const buildDot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(3)
      ),
    );
  }
}
