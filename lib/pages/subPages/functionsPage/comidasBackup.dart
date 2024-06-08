import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:fraseando/components/customAppBar.dart';
import 'package:fraseando/components/customDrawer.dart';
import '../../../components/custom_bottom_appbar.dart';

class ComidasPage1 extends StatefulWidget {
  const ComidasPage1({super.key});

  @override
  State<ComidasPage1> createState() => _ComidasPage1State();
}

class _ComidasPage1State extends State<ComidasPage1> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final YoutubeExplode _youtubeExplode = YoutubeExplode();

  final List<String> _videoIds = [
    'QhgO6z0_y3Q',
    'aBcDeFgHiJk',
    'XyZ12345678',
    'lMnOpQrStUv',
  ];

  @override
  void dispose() {
    _audioPlayer.dispose();
    _youtubeExplode.close();
    super.dispose();
  }

  Future<void> _playAudio(int index) async {
    final video = await _youtubeExplode.videos.get(_videoIds[index]);
    final manifest =
        await _youtubeExplode.videos.streamsClient.getManifest(video.id);
    final audioStreamInfo = manifest.audioOnly.withHighestBitrate();
    final audioStreamUrl = audioStreamInfo.url;

    await _audioPlayer.setUrl(audioStreamUrl.toString());
    _audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    CustomClipRRect(
                      icon: Icons.fastfood,
                      onPressed: () => _playAudio(0),
                      text: "Hamburguer",
                    ),
                    CustomClipRRect(
                      icon: Icons.local_drink,
                      onPressed: () => _playAudio(1),
                      text: "Água",
                    ),
                    CustomClipRRect(
                      icon: Icons.cake,
                      onPressed: () => _playAudio(2),
                      text: "Bolo",
                    ),
                    CustomClipRRect(
                      icon: Icons.local_pizza,
                      onPressed: () => _playAudio(3),
                      text: "Pizza",
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        bottomNavigationBar: const CustomBottomAppBar());
  }
}

class CustomClipRRect extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String text;

  const CustomClipRRect({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 250,
        width: 250,
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                icon,
                size: 150,
                color: Colors.black,
              ),
              onPressed: onPressed,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
