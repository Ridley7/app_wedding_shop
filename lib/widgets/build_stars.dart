import 'package:flutter/material.dart';

class BuildStars extends StatelessWidget {
  const BuildStars({Key? key, required this.rating}) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return index < rating
            ? const Icon(Icons.star, color: Colors.amber, size: 16,)
            : const Icon(Icons.star, color: Colors.grey, size: 16,);
      }),
    );
  }
}
