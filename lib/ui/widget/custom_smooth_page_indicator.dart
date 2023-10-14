// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class CustomSmoothPageIndicator extends StatelessWidget {
//   PageController pageViewController;
//   final int pageCount;
//   CustomSmoothPageIndicator({super.key, required this.pageViewController, required this.pageCount});

//   @override
//   Widget build(BuildContext context) {
//     return SmoothPageIndicator(
//       controller: pageViewController ,
//       count: pageCount,
//       axisDirection: Axis.horizontal,
//       onDotClicked: (i) {
//         pageViewController.animateToPage(
//           i,
//           duration: const Duration(milliseconds: 1000),
//           curve: Curves.ease,
//         );
//       },
//       effect: ExpandingDotsEffect(
//         expansionFactor: 3,
//         spacing: 8,
//         radius: 10,
//         dotWidth: 10,
//         dotHeight: 8,
//         dotColor: Color(0xFFD9D9D9),
//         activeDotColor: appPrimaryColor,
//         paintStyle: PaintingStyle.fill,
//       ),
//     );
//   }
// }
