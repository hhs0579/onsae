import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/culture_pages/report_page.dart';

class image3EnlargePage extends StatefulWidget {
  const image3EnlargePage({Key? key}) : super(key: key);

  @override
  _image3EnlargePageState createState() => _image3EnlargePageState();
}

enlargeImage(image) {
  return Container(
      width: 314,
      height: 483,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20)));
}

class _image3EnlargePageState extends State<image3EnlargePage> {
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 57,
            ),
            enlargeImage('assets/사람.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImageIcon(
                  AssetImage('assets/신고.png'),
                  color: Colors.red,
                  size: 14,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(reportPage());
                  },
                  child: Text(
                    '신고하기',
                    style: TextStyle(color: Colors.red, fontSize: 11),
                  ),
                ),
                SizedBox(
                  width: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
