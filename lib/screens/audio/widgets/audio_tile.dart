import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoware_task/cubits/audio/audio_cubit.dart';
import 'package:infoware_task/utils/colors.dart';
import 'package:infoware_task/utils/constants.dart';
import 'package:infoware_task/utils/widget__extrensions/widget_extension.dart';

class AudioTile extends StatelessWidget {
  final String audioName;

  AudioTile({super.key, required this.audioName});

  AudioPlayer _audioPlayer = AudioPlayer();

  void _play() async {
    await _audioPlayer
        .play(AssetSource('Ve_Haniya.mp3')); // Play the audio file
  }

  void _pause() async {
    await _audioPlayer.stop(); // Pause the audio
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit(),
      child: BlocConsumer<AudioCubit, bool>(
        listener: (context, state) {
          if (state) {
            _play();
          } else {
            _pause();
          }
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: CustomColors.pureBlack.withOpacity(0.3))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  audioName,
                  style: Constants.defaultTextStyle,
                ),
                Icon(
                  state ? Icons.pause : Icons.play_arrow,
                  size: 28.sp,
                ).asButton(
                  onTap: () => context.read<AudioCubit>().onButtonClicked(),
                )
              ],
            ).paddingSymmetric(vertical: 8.h, horizontal: 12.w),
          );
        },
      ),
    );
  }
}
