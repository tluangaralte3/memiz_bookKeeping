import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memiz_bk/domain/resources/app_colors.dart';
import 'package:memiz_bk/domain/resources/app_icons.dart';
import 'package:memiz_bk/domain/resources/app_text_styles.dart';
import 'package:memiz_bk/services/local_auth_service.dart';
import 'package:memiz_bk/ui/bloc/user_bloc/user_bloc.dart';
import 'package:memiz_bk/ui/screens/main_screen.dart';

import 'widgets/avatar_pick.dart';
import 'widgets/biometrics_dialog.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const routeName = 'registration_page';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController shopnameController = TextEditingController();
  final TextEditingController shopaddressController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) async {
        if (state.status == AuthStatus.done) {
          Navigator.of(context, rootNavigator: true)
              .pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
        }
        if (state.status == AuthStatus.valid) {
          await buildScreenLockCreate(context);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (mounted) {
              context.read<UserBloc>().add(InitialUserEvent());
            }
            return true;
          },
          child: Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 36,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            AppIcons.logo,
                            width: 150,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Memiz BookKeeping',
                            style: AppStyles.menuPageTitle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const AvatarPick(),
                    const SizedBox(
                      height: 16,
                    ),
                    // const Wrap(
                    //   children: [
                    //     Icon(Icons.app_registration_outlined,
                    //         color: AppColors.title),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     Text(
                    //       "Signup",
                    //       style: TextStyle(
                    //           color: AppColors.title,
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.w700),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: "Regisration Name",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: surnameController,
                            decoration: InputDecoration(
                              labelText: "Surename",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: shopnameController,
                      decoration: InputDecoration(
                        labelText: "Dawr hming",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: shopaddressController,
                      decoration: InputDecoration(
                        labelText: "Dawr awmna",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: gstController,
                      decoration: InputDecoration(
                        labelText: "GST No.",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: "Phone No.",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (state.status == AuthStatus.error) ...[
                      Text(state.errorMessage, style: AppStyles.appRed),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                    if (state.status == AuthStatus.loading) ...[
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.activeBlue,
                        ),
                      )
                    ] else ...[
                      ElevatedButton(
                        style: AppStyles.buttonStyle,
                        onPressed: () {
                          context.read<UserBloc>().add(ValidateUserEvent(
                              name: '${nameController.text} '
                                  '${surnameController.text}',
                              email: emailController.text));
                        },
                        child: const Center(
                          child: Text(
                            "Signup",
                            style: AppStyles.button,
                          ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  buildScreenLockCreate(BuildContext context) async {
    screenLockCreate(
      title: Text("Create PIN"),
      confirmTitle: Text("Confirm PIN"),
      context: context,
      onConfirmed: (value) async {
        if (await LocalAuth.canAuthenticate()) {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) {
                return BiometricsDialog(
                  name: '${nameController.text} ${surnameController.text}',
                  email: emailController.text,
                  pin: value,
                  shopname: shopnameController.text,
                  shopaddress: shopaddressController.text,
                  phonenumber: phoneController.text,
                  gst: gstController.text,
                );
              });
        } else {
          Navigator.of(context).pop();
          context.read<UserBloc>().add(CreateUserEvent(
                name: '${nameController.text} ${surnameController.text}',
                pin: value,
                email: emailController.text,
                biometrics: false,
                shopname: shopnameController.text,
                shopaddress: shopaddressController.text,
                gstnumber: gstController.text,
                phonenumber: int.parse(phoneController.text),
              ));
        }
      },
    );
  }
}
