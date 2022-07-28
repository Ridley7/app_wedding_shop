import 'package:app_wedding_shop/constants.dart';
import 'package:app_wedding_shop/models/dress.dart';
import 'package:app_wedding_shop/screens/home_screen.dart';
import 'package:app_wedding_shop/widgets/build_stars.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DressScreen extends StatefulWidget {
  const DressScreen({Key? key, required this.dress}) : super(key: key);

  final Dress dress;

  @override
  State<DressScreen> createState() => _DressScreenState();
}

class _DressScreenState extends State<DressScreen> {

  int _currentSelect = -1;
  bool isSelected = false;

  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.dress.description.length > 150){
      firstHalf = widget.dress.description.substring(0, 150);
      secondHalf = widget.dress.description.substring(0, widget.dress.description.length);
    }else{
      firstHalf = widget.dress.description;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 600,
            width: double.infinity,
            child: ClipRRect(
              child: Image(
                image: AssetImage(widget.dress.image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [0.1, 0.4, 0.6, 0.9]
              )
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen())
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.white,
                  onPressed: (){},
                ),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Text(
                  widget.dress.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildStars(rating: widget.dress.rating),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kAccentColor,
                      ),
                      child: IconButton(
                        icon: widget.dress.isMarked
                            ? const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 24,
                        )
                            : const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: (){
                          setState((){
                            widget.dress.isMarked = !widget.dress.isMarked;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Text(
                  "\$ ${widget.dress.price}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Detail Products",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: secondHalf.isEmpty
                      ? Text(widget.dress.description)
                      : RichText(
                    textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: flag ? firstHalf : (firstHalf + secondHalf),
                        style: TextStyle(color: kSecondaryColor, fontSize: 15),
                        children: [
                          TextSpan(
                            text: flag ? "Read More" : "Read Less",
                            style: const TextStyle(
                                color: kAccentColor,
                                fontWeight: FontWeight.bold
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                setState((){
                                  flag = !flag;
                                });
                              }
                          )
                        ]
                      )
                  )
                ),

                SizedBox(height: 20,),
                Text(
                  "Sizing",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _sizeChoice("S", 0),
                      _container(),
                      _sizeChoice("M", 1),
                      _container(),
                      _sizeChoice("L", 2),
                      _container(),
                      _sizeChoice("Xl", 3)
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kSecondaryColor),
                      ),
                      child: Icon(
                        Icons.phone,
                        color: kSecondaryColor,
                      ),
                    ),

                    Container(
                      width: 50,
                        height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kSecondaryColor)
                      ),
                      child: Icon(
                        Icons.comment,
                        color: kSecondaryColor,
                      ),
                    ),

                    Container(
                      width: 240,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kAccentColor,
                      ),
                      child: Center(
                        child: Text(
                          "Make an Appointment",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    )

                  ],
                )

              ],
            ),
          )

        ],
      ),
    );
  }

  _container(){
    return Container(
      width: 40,
      height: 6,
      color: kSizingButtonColor,
    );
  }

  _sizeChoice(String title, int index) {
    return GestureDetector(
      onTap: (){
        setState((){
          if(isSelected && _currentSelect == index){
            _currentSelect = -1;
            isSelected = false;
          }else{
            _currentSelect = index;
            isSelected = true;
          }
        });
      },
      child: Container(
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentSelect == index ? kAccentColor : kSizingButtonColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: _currentSelect == index ? Colors.white : kSecondaryColor
            ),
          ),
        ),
      ),
    );
  }
}
