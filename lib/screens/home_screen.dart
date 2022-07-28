import 'package:app_wedding_shop/constants.dart';
import 'package:app_wedding_shop/widgets/dress_carousel.dart';
import 'package:app_wedding_shop/widgets/recommended_list.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late PreloadPageController _pageController;
  int _currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PreloadPageController(initialPage: 0, viewportFraction: 0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        unselectedItemColor: Colors.grey[350],
        selectedItemColor: kAccentColor,
        currentIndex: _currentTab,
        onTap: (int value){
          setState((){
            _currentTab = value;
          });
        },
        items: [

          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(Icons.home),
                  _currentTab == 0
                      ? Container(width: 10, height: 2.5, color:  kAccentColor,)
                      : const SizedBox(width: 100, height: 2.5, )
                ],
              ),
              label: ""
          ),

          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(Icons.favorite),
                  _currentTab == 1
                      ? Container(width: 10, height: 2.5, color:  kAccentColor,)
                      : const SizedBox(width: 100, height: 2.5,)
                ],
              ),
              label: ""
          ),

          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(Icons.shopping_cart),
                  _currentTab == 2
                      ? Container(width: 10, height: 2.5, color:  kAccentColor,)
                      : const SizedBox(width: 100, height: 2.5,)
                ],
              ),
              label: ""
          ),

          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(Icons.person),
                  _currentTab == 3
                      ? Container(width: 10, height: 2.5, color:  kAccentColor,)
                      : const SizedBox(width: 100, height: 2.5,)
                ],
              ),
              label: ""
          ),

        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
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
          Padding(
              padding: EdgeInsets.only(left: 20, top: 40, bottom: 30),
            child: Text(
              "Popular",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          DressCarousel(pageController: _pageController),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 25, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.grey[200],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
                RecommendedList(),
              ],
            ),
          )


        ],
      ),
    );
  }
}
