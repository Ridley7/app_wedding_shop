import 'package:app_wedding_shop/constants.dart';
import 'package:app_wedding_shop/models/dress.dart';
import 'package:app_wedding_shop/screens/dress_screen.dart';
import 'package:app_wedding_shop/widgets/build_stars.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

class DressCarousel extends StatefulWidget {
  const DressCarousel({Key? key, required this.pageController}) : super(key: key);

  final PreloadPageController pageController;

  @override
  State<DressCarousel> createState() => _DressCarouselState();
}

class _DressCarouselState extends State<DressCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: PreloadPageView.builder(
        physics: BouncingScrollPhysics(),
          preloadPagesCount: 3,
          controller: widget.pageController,
          itemCount: popularList.length,
          itemBuilder: (BuildContext context, int index){
            return _buildPost(context, index);
          }
      ),
    );
  }

   _buildPost(BuildContext context, int index) {
      Dress dress = popularList[index];
      return AnimatedBuilder(
        animation: widget.pageController,

        builder: (BuildContext context, Widget? w) {
          double value = 1;
          if(widget.pageController.position.haveDimensions){
            value = (widget.pageController.page! - index)!;
            value = (1 - (value.abs() * 0.35)).clamp(0, 1);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value) * 400,
              child: w,
            ),
          );
        },
        child: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DressScreen(dress: dress))
            );
          },
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    height: 400,
                    width: 300,
                    image: AssetImage(dress.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3)
                    ],
                    stops: [0.1, 0.4, 0.6, 0.9]
                  )
                ),
              ),

              Positioned(
                bottom: 30,
                  left: 30,
                  right: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dress.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildStars(rating: dress.rating),
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
                      Text(
                        "\$ ${dress.price}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
              )

            ],
          ),
        ),
      );
   }
}
