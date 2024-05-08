import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memiz_bk/domain/resources/app_colors.dart';
import 'package:memiz_bk/domain/resources/app_icons.dart';
import 'package:memiz_bk/domain/resources/app_text_styles.dart';
import 'package:memiz_bk/services/local_auth_service.dart';
import 'package:memiz_bk/ui/bloc/user_bloc/user_bloc.dart';

class BiometricsDialog extends StatefulWidget {
  const BiometricsDialog({
    Key? key,
    required this.name,
    required this.email,
    required this.pin,
    required this.shopname,
    required this.shopaddress,
    required this.phonenumber,
    required this.gst,
  }) : super(key: key);

  final String name;
  final String email;
  final String pin;
  final String shopname;
  final String shopaddress;
  final String phonenumber;
  final String gst;

  @override
  State<BiometricsDialog> createState() => _BiometricsDialogState();
}

class _BiometricsDialogState extends State<BiometricsDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Center(
        child: Text(
          'Use Biometrics',
          style: AppStyles.menuPageTitle,
        ),
      ),
      contentPadding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Choose Biometrics',
          style: AppStyles.body2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.fingerprint_outlined,
              color: AppColors.subTitle,
              size: 48,
            ),
            SvgPicture.asset(
              AppIcons.faceId,
              color: AppColors.subTitle,
              height: 48,
              width: 48,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        TextButton(
            onPressed: () async {
              final ifAuth = await LocalAuth.authenticate();
              if (ifAuth && mounted) {
                Navigator.of(context).pop();
                context.read<UserBloc>().add(CreateUserEvent(
                      name: widget.name,
                      pin: widget.pin,
                      email: widget.email,
                      biometrics: true,
                      shopname: widget.shopname,
                      shopaddress: widget.shopaddress,
                      gstnumber: widget.gst,
                      phonenumber: int.parse(widget.phonenumber),
                    ));
              }
            },
            child: Text(
              'Yes',
              style: AppStyles.button,
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<UserBloc>().add(CreateUserEvent(
                    name: widget.name,
                    pin: widget.pin,
                    email: widget.email,
                    biometrics: false,
                    shopname: widget.shopname,
                    shopaddress: widget.shopaddress,
                    gstnumber: widget.gst,
                    phonenumber: int.parse(widget.phonenumber),
                  ));
            },
            child: Text(
              'No',
              style: AppStyles.buttonBlack,
            ))
      ],
    );
  }
}
