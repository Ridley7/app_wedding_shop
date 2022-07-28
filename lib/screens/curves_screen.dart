import 'package:flutter/material.dart';

class CurvesScreen extends StatelessWidget {
  const CurvesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            height: double.infinity,
            color: Colors.deepOrangeAccent,
          ),

          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2020/08/07/11/57/raindrops-5470467_960_720.jpg"
                  )
                )
              ),
            ),
          ),



        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path =  Path();
    
    path.moveTo(0, 0);
    path.lineTo(0,size.height*0.7545000);

    path.quadraticBezierTo(size.width*0.0631750,size.height*0.4964500,size.width*0.0993250,size.height*0.4846000);
    path.cubicTo(size.width*0.1798625,size.height*0.4234500,size.width*0.2497375,size.height*0.5492500,size.width*0.3121500,size.height*0.5504000);
    path.cubicTo(size.width*0.3758875,size.height*0.5479500,size.width*0.5307375,size.height*0.3909000,size.width*0.6024500,size.height*0.4140500);
    path.cubicTo(size.width*0.6738875,size.height*0.4425500,size.width*0.8131250,size.height*0.7009000,size.width*0.8751250,size.height*0.6996500);
    path.quadraticBezierTo(size.width*0.9375875,size.height*0.7020000,size.width,size.height*0.5012500);

    path.lineTo(size.width, 0);
    //path.lineTo(0, 0);
    
    /*
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
     */
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}


/*
* class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



  Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height*0.7545000);
    path0.quadraticBezierTo(size.width*0.0595000,size.height*0.4313500,size.width*0.0956500,size.height*0.4195000);
    path0.cubicTo(size.width*0.1761875,size.height*0.3583500,size.width*0.2405625,size.height*0.5514500,size.width*0.3110250,size.height*0.5691500);
    path0.cubicTo(size.width*0.3773875,size.height*0.5320500,size.width*0.5307375,size.height*0.3909000,size.width*0.6024500,size.height*0.4140500);
    path0.cubicTo(size.width*0.6738875,size.height*0.4425500,size.width*0.8266500,size.height*0.7717000,size.width*0.9198750,size.height*0.8367500);
    path0.quadraticBezierTo(size.width*0.9593500,size.height*0.7465000,size.width,size.height*0.5012500);
    path0.lineTo(size.width,0);
    path0.lineTo(0,0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

*
* */