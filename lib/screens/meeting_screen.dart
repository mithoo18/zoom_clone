import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetingMethods _jitsiMeetingMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();

    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushName(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
                onPressed: createNewMeeting,
                icon: Icons.videocam,
                text: 'New Meeting'),
            HomeMeetingButton(
                onPressed: joinMeeting(context),
                icon: Icons.add_box_rounded,
                text: 'Join Meeting'),
            HomeMeetingButton(
                onPressed: () {}, icon: Icons.calendar_today, text: 'Schedule'),
            HomeMeetingButton(
                onPressed: () {},
                icon: Icons.arrow_upward_rounded,
                text: 'Share Screen'),
          ],
        )
      ],
    );
  }
}
