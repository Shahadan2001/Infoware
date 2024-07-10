import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoware_task/utils/utils.dart';

class CustomTextFieldBloc<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final TextInputType textInputType;
  final int? maxLines;
  final String hintText;
  final bool Function(S, S) buildWhen;
  final String? Function(S)? onErrorOccur;
  final void Function(String, B) onValueChanged;

  const CustomTextFieldBloc(
      {super.key,
      required this.buildWhen,
      required this.onErrorOccur,
      required this.onValueChanged,
      required this.textInputType,
      this.maxLines,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: buildWhen,
      builder: (context, state) {
        String? errorText = onErrorOccur?.call(state);
        return TextField(
          style: Constants.defaultMiniTextStyle,
          keyboardType: textInputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            errorText: errorText,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Constants.defaultMiniTextStyle
                .copyWith(color: CustomColors.bgColor.withOpacity(0.4)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                borderSide:
                    const BorderSide(color: CustomColors.cardBg, width: 1)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                borderSide:
                    const BorderSide(color: CustomColors.cardBg, width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                borderSide:
                    const BorderSide(color: CustomColors.cardBg, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                borderSide:
                    const BorderSide(color: CustomColors.cardBg, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                borderSide:
                    const BorderSide(color: CustomColors.cardBg, width: 1)),
          ),
          onChanged: (value) => onValueChanged(value, context.read<B>()),
        );
      },
    );
  }
}
