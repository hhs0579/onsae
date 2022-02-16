import 'package:flutter/material.dart';
import 'package:onsaemiro/product/product_list.dart';

class productReviewPage extends StatefulWidget {
  Product product;
  productReviewPage(this.product);

  @override
  _productReviewPageState createState() =>
      _productReviewPageState(this.product);
}

reviewBox() {
  return Container(
    height: 88,
    decoration: BoxDecoration(
        border: Border(
      bottom: BorderSide(color: Color.fromRGBO(108, 205, 108, 1)),
    )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(9, 10, 0, 0),
          child: Row(
            children: [
              ImageIcon(
                AssetImage('assets/프로필.png'),
                size: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '작성자',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(9, 4, 0, 0),
          child: Text(
            '',
            // '브라우니는 둘리우니라고 부르더라고요.\n대부분 3천원정도 선이에요.\n가격도 나쁘지 않은 거 같아요!',
            style: TextStyle(fontSize: 11),
            textAlign: TextAlign.start,
          ),
        )
      ],
    ),
  );
}

class _productReviewPageState extends State<productReviewPage> {
  Product _product;
  _productReviewPageState(this._product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Stack(children: [
              Container(
                width: double.infinity,
                height: 275,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(_product.image), fit: BoxFit.fill)),
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
              Padding(
                padding: EdgeInsets.only(top: 185),
                child: Center(
                  child: Container(
                    width: 311,
                    height: 654,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(108, 205, 108, 1)),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          height: 64,
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(108, 205, 108, 1)),
                          )),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 130,
                                  ),
                                  Text(
                                    '후기',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 28,
                              )
                            ],
                          ),
                        ),
                        // reviewBox(),
                        // reviewBox(),
                        // reviewBox(),
                        // reviewBox(),
                        // reviewBox(),
                        // reviewBox(),
                        // reviewBox(),
                        // reviewBox()
                      ],
                    ),
                  ),
                ),
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
