// Flutter imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
// Package imports:
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferencePage extends StatelessWidget {
  String Email,Name;
  final String conferenceID;

   VideoConferencePage({
     Key? key,
     required this.Email, required this.Name,
    required this.conferenceID,
  }) : super(key:key);
  final String localUserID = math.Random().nextInt(10000).toString();
  final String callID = 'group_call_id';



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 863446859,
        appSign: '07a3950c55a479048d140f53b6343adc3b43a7b49630626ea6cbada64df1f155', /*input your AppSign*/
        userID: Email,
        userName: Name,
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}