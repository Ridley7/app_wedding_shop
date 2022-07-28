import 'package:app_wedding_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late PreloadPageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              "Hi, Angela",
              style: TextStyle(color: kSecondaryColor, fontSize: 16.0),
            ),
          ),

          Padding(
              padding: EdgeInsets.only(left: 20, top: 4, bottom: 40),
            child: Text("Let's Shopping Now",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search Here...",
                        prefixIcon: Icon(Icons.search, size: 30,),
                        fillColor: Colors.grey[200],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent)
                        )
                      ),
                    ),
                  )
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kAccentColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              )
            ],
          ),



        ],
      ),
    );
  }
}
