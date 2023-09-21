// import 'package:addisbiz/constants.dart';
// import 'package:addisbiz/entites/companydata.dart';
// import 'package:flutter/material.dart';

// import '../pages/companylist.dart';

// class Sort extends StatefulWidget {
//   @override
//   State<Sort> createState() => _SortState();
// }

// bool? _isAscending;

// bool? get isAscending {
//   return _isAscending;
// }

// class _SortState extends State<Sort> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(child: Container()),
//         Container(
//           width: 70,
//           height: 30,
//           decoration: BoxDecoration(
//               color: Colors.grey, borderRadius: BorderRadius.circular(15)),
//           child: Center(
//             child: Text(
//               style: TextStyle(color: Color.fromARGB(255, 248, 248, 248)),
//               "Default",
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _isAscending = true;
//               print("Aecending");
//             });
//           },
//           child: Image(
//             width: 50,
//             height: 30,
//             image: AssetImage('assets/icons/a-z.png'),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _isAscending = false;
//               print("Decending");
//             });
//           },
//           child: Image(
//             width: 50,
//             height: 30,
//             image: AssetImage('assets/icons/z-a.png'),
//           ),
//         )
//       ],
//     );
//   }

//   void accsending() {
//     companyDetail.sort((a, b) =>
//         a.businessName?.compareTo(b.businessName ?? 'addisbiz') ?? 2222);
//   }

//   void decending() {
//     companyDetail.sort(
//         (a, b) => b.businessName?.compareTo(a.businessName ?? 'a') ?? 00000);
//   }
// }
