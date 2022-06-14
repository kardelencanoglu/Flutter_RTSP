import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({Key? key}) : super(key: key);

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  final VlcPlayerController _videoPlayerController =
      VlcPlayerController.network(
    'rtsp://192.168.1.10:554/user=admin&password=EXLXEXKX&channel=1&stream=0.sdp?',
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(
      advanced: VlcAdvancedOptions([VlcAdvancedOptions.liveCaching(1000)]),
      rtp: VlcRtpOptions([
        VlcRtpOptions.rtpOverRtsp(true),
      ]),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VlcPlayer(
            controller: _videoPlayerController,
            aspectRatio: 16 / 9,
            placeholder: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
