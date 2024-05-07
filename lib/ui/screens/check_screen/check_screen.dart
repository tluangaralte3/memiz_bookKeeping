// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:memiz_bk/bloc/user_bloc/user_bloc.dart';
// import 'package:memiz_bk/resources/app_colors.dart';
// import 'package:memiz_bk/resources/app_icons.dart';
//
// class CheckScreen extends StatefulWidget {
//   const CheckScreen({Key? key}) : super(key: key);
//   static const routeName = '/ckeck';
//
//   @override
//   State<CheckScreen> createState() => _CheckScreenState();
// }
//
// class _CheckScreenState extends State<CheckScreen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<UserBloc, UserState>(
//       listener: (context, state) {
//       },
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(AppIcons.logo),
//               const SizedBox(height: 16,),
//               const Text(
//                 'Memiz',
//                 style: TextStyle(
//                     color: AppColors.title,
//                     fontSize: 24,
//                     fontWeight: FontWeight.w700),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
