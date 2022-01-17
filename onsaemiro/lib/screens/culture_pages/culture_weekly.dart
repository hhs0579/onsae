import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/culture_pages/image2_enlarge.dart';

import 'image1_enlarge.dart';
import 'image3_enlarge.dart';

class weeklyBestPage extends StatefulWidget {
  const weeklyBestPage({Key? key}) : super(key: key);

  @override
  _weeklyBestPageState createState() => _weeklyBestPageState();
}

image_widget(image, onPressed) {
  return Stack(
    children: [
      Ink(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: () {},
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 484,
            width: 354,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 10,
          right: 10,
          child: IconButton(
              onPressed: onPressed,
              icon: Image(
                image: AssetImage('assets/확대.png'),
              )))
    ],
  );
}

class _weeklyBestPageState extends State<weeklyBestPage> {
  List<Widget> imageList = [
    image_widget('assets/도서관.png', () {
      Get.to(image1EnlargePage());
    }),
    image_widget('assets/헌혈.png', () {
      Get.to(image2EnlargePage());
    }),
    image_widget('assets/사람.png', () {
      Get.to(image3EnlargePage());
    })
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 138,
        leading: Image.asset('assets/Vector(진한녹색).png'),
        backgroundColor: Colors.white,
        title: Text(
          '주간 베스트',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(67, 123, 86, 1),
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              SizedBox(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 484,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  ),
                  items: [imageList[0], imageList[1], imageList[2]],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                width: 110,
                height: 41,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.5)),
                    side: BorderSide(width: 2.0, color: Colors.green),
                  ),
                  child: Text(
                    '인증하러 가기',
                    style: TextStyle(color: Color(0xff595959), fontSize: 13),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
