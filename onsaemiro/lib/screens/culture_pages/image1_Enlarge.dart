import 'package:flutter/material.dart';

class image1EnlargePage extends StatefulWidget {
  const image1EnlargePage({Key? key}) : super(key: key);

  @override
  _image1EnlargePageState createState() => _image1EnlargePageState();
}

enlargeImage(image) {
  return Container(
      width: 314,
      height: 483,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ));
}

class _image1EnlargePageState extends State<image1EnlargePage> {
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
          children: [enlargeImage('assets/도서관.png')],
        ),
      ),
    );
  }
}
