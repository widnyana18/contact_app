// import 'package:flutter/material.dart';

// class NumberButton extends StatelessWidget {
//   const NumberButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 3,
//       childAspectRatio: 1.3,
//       children: labelPad.map((pad) {
//         return TextButton(
//           onPressed: () {
//             context.read<DialPadNotifier>().appendNumber(
//                   number: pad,
//                   index: _cursorPosition.value,
//                 );
//             _controller.selection = TextSelection.fromPosition(
//               TextPosition(offset: _cursorPosition.value),
//             );
//             _cursorPosition.value++;
//           },
//           child: Text(pad),
//         );
//       }).toList(),
//     );
//   }

//   final labelPad = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];
// }
