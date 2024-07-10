import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infoware_task/cubits/login/login_cubit.dart';
import 'package:infoware_task/custom_widgets/custom_button.dart';
import 'package:infoware_task/custom_widgets/custom_text_field.dart';
import 'package:infoware_task/utils/colors.dart';
import 'package:infoware_task/utils/constants.dart';
import 'package:infoware_task/utils/utils.dart';
import 'package:infoware_task/utils/widget__extrensions/widget_extension.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
        var loginCubit = context.read<LoginCubit>();
        return Scaffold(
          backgroundColor: CustomColors.pureWhite,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Name',
                  style: Constants.defaultTextStyle,
                ).paddingOnly(bottom: 5.h),
                CustomTextFieldBloc<LoginCubit, LoginState>(
                  buildWhen: (p, c) => p.name != c.name,
                  onValueChanged: (value, cubit) => cubit.onNameChanged(value),
                  onErrorOccur: (state) =>
                      state.name.isNotValid ? 'Enter valid name *' : null,
                  textInputType: TextInputType.text,
                  hintText: 'Name',
                ).paddingOnly(bottom: 10.h),
                Text(
                  'Phone',
                  style: Constants.defaultTextStyle,
                ).paddingOnly(bottom: 5.h),
                CustomTextFieldBloc<LoginCubit, LoginState>(
                  buildWhen: (p, c) => p.phone != c.phone,
                  onValueChanged: (value, cubit) => cubit.onPhoneChanged(value),
                  onErrorOccur: (state) =>
                      state.phone.isNotValid ? 'Enter valid phone *' : null,
                  textInputType: TextInputType.number,
                  hintText: 'Phone number',
                ).paddingOnly(bottom: 10.h),
                Text(
                  'Email',
                  style: Constants.defaultTextStyle,
                ).paddingOnly(bottom: 5.h),
                CustomTextFieldBloc<LoginCubit, LoginState>(
                  buildWhen: (p, c) => p.email != c.email,
                  onValueChanged: (value, cubit) => cubit.onEmailChanged(value),
                  onErrorOccur: (state) =>
                      state.email.isNotValid ? 'Enter valid email *' : null,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email',
                ).paddingOnly(bottom: 10.h),
                Text(
                  'Gender',
                  style: Constants.defaultTextStyle,
                ).paddingOnly(bottom: 5.h),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: state.gender,
                          onChanged: (value) =>
                              loginCubit.onGenderChanged(value),
                        ),
                        Text(
                          'Male',
                          style: Constants.defaultMiniTextStyle,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Female',
                          groupValue: state.gender,
                          onChanged: (value) =>
                              loginCubit.onGenderChanged(value),
                        ),
                        Text(
                          'Female',
                          style: Constants.defaultMiniTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Other',
                          groupValue: state.gender,
                          onChanged: (value) =>
                              loginCubit.onGenderChanged(value),
                        ),
                        Text(
                          'Other',
                          style: Constants.defaultMiniTextStyle,
                        ),
                      ],
                    ),
                  ],
                ).paddingOnly(bottom: 10.h),
                Text(
                  'Country',
                  style: Constants.defaultTextStyle,
                ).paddingOnly(bottom: 5.h),
                CustomTextFieldBloc<LoginCubit, LoginState>(
                  buildWhen: (p, c) => p.country != c.country,
                  onValueChanged: (value, cubit) =>
                      cubit.onCountryChanged(value),
                  onErrorOccur: (state) =>
                      state.country.isEmpty ? 'Enter valid country *' : null,
                  textInputType: TextInputType.text,
                  hintText: 'Country',
                ).paddingOnly(bottom: 10.h),
                Text(
                  'State',
                  style: Constants.defaultTextStyle,
                ).paddingOnly(bottom: 5.h),
                CustomTextFieldBloc<LoginCubit, LoginState>(
                  buildWhen: (p, c) => p.state != c.state,
                  onValueChanged: (value, cubit) => cubit.onStateChanged(value),
                  onErrorOccur: (state) =>
                      state.state.isEmpty ? 'Enter valid state *' : null,
                  textInputType: TextInputType.text,
                  hintText: 'State',
                ).paddingOnly(bottom: 10.h),
                Text(
                  'City',
                  style: Constants.defaultTextStyle,
                ).paddingOnly(bottom: 5.h),
                CustomTextFieldBloc<LoginCubit, LoginState>(
                  buildWhen: (p, c) => p.city != c.city,
                  onValueChanged: (value, cubit) => cubit.onCityChanged(value),
                  onErrorOccur: (state) =>
                      state.city.isEmpty ? 'Enter valid city *' : null,
                  textInputType: TextInputType.text,
                  hintText: 'City',
                ).paddingOnly(bottom: 10.h),
                CustomButton(
                    isEnable: state.name.isValid &&
                        state.phone.isValid &&
                        state.gender != null &&
                        state.email.isValid &&
                        state.country.isNotEmpty &&
                        state.state.isNotEmpty &&
                        state.city.isNotEmpty,
                    onTap: () => context.go('/books'),
                    text: 'Sign in')
              ],
            ).paddingSymmetric(horizontal: 16.w, vertical: 12.h),
          ),
        );
      }),
    );
  }
}
