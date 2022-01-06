import 'package:flutter/material.dart';

class productInformationPage extends StatefulWidget {
  const productInformationPage({Key? key}) : super(key: key);

  @override
  _productInformationPageState createState() => _productInformationPageState();
}

class _productInformationPageState extends State<productInformationPage> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 275,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/둘리우니 1.png'),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                left: 39,
                top: 106,
                child: Row(
                  children: [
                    IconButton(
                      icon: ImageIcon(
                        AssetImage('assets/Vector(흰색).png'),
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 77.59,
                    ),
                    Text(
                      'access',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 190, 0, 0),
                  child: Container(
                    width: 311,
                    height: 384,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(108, 205, 108, 1)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Text(
                          '둘리우니',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 54,
                        ),
                        Text(
                          '보리와 귀리가 만난 비건 브라우니!\n쫀득하고 진한 다크 오리지널은 속세의 맛',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 133,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 21,
                            ),
                            Text(
                              '가격',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 132,
                            ),
                            Text(
                              '2,800 ~ 3,200원',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                            height: 1.0,
                            width: 311,
                            color: Color.fromRGBO(108, 205, 108, 1)),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 21,
                            ),
                            Text(
                              '수량',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Container(
                              width: 103,
                              height: 25,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(10, 255, 255, 1)),
                                  borderRadius: BorderRadius.circular(18.5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          num--;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        size: 7,
                                      )),
                                  Text(
                                    '$num',
                                    style: TextStyle(fontSize: 9),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          num++;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 7,
                                      )),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
