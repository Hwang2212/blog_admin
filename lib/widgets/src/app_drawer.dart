// Unused

// import 'package:Blog_web/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:Blog_web/theme/theme.dart';

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme = Theme.of(context).textTheme;
//     return Drawer(
//       child: ListView(
//         children: [
//           DrawerHeader(
//               decoration: BoxDecoration(
//                   color: AppColors.primary,
//                   borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(12),
//                       bottomRight: Radius.circular(12))),
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const CircleAvatar(
//                       child: Icon(Icons.people),
//                     ),
//                     Text(
//                       'Admin',
//                       style: textTheme.bodyMedium
//                           ?.copyWith(color: AppColors.white),
//                     )
//                   ],
//                 ),
//               )),
//           ListTile(
//             // shape: RoundedRectangleBorder(),
//             hoverColor: AppColors.primary,
//             title: Text('Hello'),
//           )
//         ],
//       ),
//     );
//   }
// }
