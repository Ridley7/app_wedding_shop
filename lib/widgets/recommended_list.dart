import 'package:app_wedding_shop/constants.dart';
import 'package:app_wedding_shop/models/dress.dart';
import 'package:app_wedding_shop/screens/dress_screen.dart';
import 'package:app_wedding_shop/widgets/build_stars.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({Key? key}) : super(key: key);

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: recommendList.length,
        itemBuilder: (BuildContext context, int index){
        Dress dress = recommendList[index];
          return Stack(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DressScreen(dress: dress))
                  );
                },
                child: Container(
                  height: 120,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.fromLTRB(7, 7, 20, 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(dress.image),
                          height: 110,
                          width: 100,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),

                      SizedBox(width: 20,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dress.title,
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              BuildStars(rating: dress.rating),
                              SizedBox(width: 100,),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kAccentColor,
                                ),
                                child: IconButton(
                                  icon: dress.isMarked
                                      ? const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 22,
                                  )
                                      : const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  onPressed: (){
                                    setState((){
                                      dress.isMarked = !dress.isMarked;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),

                          Text("\$ ${dress.price}",
                            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),)

                        ],
                      )
                    ],
                  ),
                ),
              )
            ]
          );
        }
    );
  }
}
