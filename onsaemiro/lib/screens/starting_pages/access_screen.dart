import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/login_page.dart';

class AccessScreen extends StatelessWidget {
  const AccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(loginpage());
                },
                icon: Image.asset('assets/Vector.png'),
              ),
              SizedBox(
                width: 95,
              ),
              Text('앱 접근 권한 안내', style: TextStyle(fontSize: 18))
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 260,
            height: 280,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Column(
              children: [
                Text('필수 접근 권한'),
                SizedBox(height: 90),
                Text("사진, 카메라 권한"),
                Text("프로필 설정 시 촬영 및 이미지 업로드"),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Text("""서비스를 원할하게 이용하기 위해\n위 항목에 대해 권한이 필요합니다""",
                style: TextStyle(
                  fontSize: 14,
                )),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            width: 100,
            height: 40,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.green, width: 1.5),
                        borderRadius: BorderRadius.circular(20))),
                child: Text("동의")),
          )
        ],
      ),
    ));
  }
}
