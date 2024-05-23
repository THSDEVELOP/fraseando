import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

import '../../../components/navigateToPage.dart';
import '../../../servicos/autentication.dart';
import '../../mainPage.dart';
import '../../pageLogin.dart';
import '../Necessidades.dart';
import '../alertas.dart';

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class ComidasPage extends StatefulWidget {
  const ComidasPage({super.key});

  @override
  State<ComidasPage> createState() => _ComidasPageState();
}

class _ComidasPageState extends State<ComidasPage> {
  late AudioPlayer _audioPlayer;

  final _playList = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/tabomKathy.m4a'),
        tag: MediaItem(
          id: '0',
          title: "Sou China",
          artist: 'Th Fodao',
          artUri: Uri.parse(
              'https://aventurasnahistoria.uol.com.br/media/uploads/capadedo0s09.jpg'),
        ),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/boraDeSuzuki.m4a'),
        tag: MediaItem(
          id: '1',
          title: "Bora de Suzuki",
          artist: 'Th Fodao',
          artUri: Uri.parse(
              'https://aventurasnahistoria.uol.com.br/media/uploads/capadedo0s09.jpg'),
        ),
      ),
    ],
  );

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(_playList);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.blue,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                "Sair",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                AutenticacaoServico().deslogar();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageLogin()));
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<SequenceState?>(
                stream: _audioPlayer.sequenceStateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  if (state?.sequence.isEmpty ?? true) {
                    return const SizedBox();
                  }
                  final metadata = state!.currentSource!.tag as MediaItem;
                  return MediaMetadata(
                    imageUrl: metadata.artUri.toString(),
                    title: metadata.title,
                    artist: metadata.artist ?? '',
                  );
                },
              ),
              const SizedBox(height: 20),
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return ProgressBar(
                    barHeight: 8,
                    baseBarColor: Colors.grey[600],
                    bufferedBarColor: Colors.grey,
                    progressBarColor: const Color.fromARGB(255, 232, 210, 208),
                    thumbColor: const Color.fromARGB(255, 221, 191, 188),
                    timeLabelTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    progress: positionData?.position ?? Duration.zero,
                    buffered: positionData?.bufferedPosition ?? Duration.zero,
                    total: positionData?.duration ?? Duration.zero,
                    onSeek: _audioPlayer.seek,
                  );
                },
              ),
              Controls(audioPlayer: _audioPlayer),
              DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 19, 18, 18),
                      offset: Offset(2, 4),
                      blurRadius: 4,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://aventurasnahistoria.uol.com.br/media/uploads/capadedo0s09.jpg',
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.blue,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const AlertasFraseando());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const AlertasFraseando());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.home,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const MyHomePage());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const AlertasFraseando());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const AlertasFraseando());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MediaMetadata extends StatelessWidget {
  const MediaMetadata({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
  });

  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [],
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: audioPlayer.seekToPrevious,
          iconSize: 60,
          color: Colors.white,
          icon: const Icon(Icons.skip_previous_rounded),
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (!(playing ?? false)) {
              return IconButton(
                onPressed: audioPlayer.play,
                iconSize: 80,
                color: Colors.white,
                icon: const Icon(Icons.play_arrow_rounded),
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: audioPlayer.pause,
                iconSize: 80,
                color: Colors.white,
                icon: const Icon(Icons.pause_rounded),
              );
            }
            return IconButton(
              onPressed: () => audioPlayer.seek(Duration.zero,
                  index: audioPlayer.effectiveIndices!.first),
              iconSize: 80,
              color: Colors.white,
              icon: const Icon(Icons.replay_rounded),
            );
          },
        ),
        IconButton(
          onPressed: audioPlayer.seekToNext,
          iconSize: 60,
          color: Colors.white,
          icon: const Icon(Icons.skip_next_rounded),
        ),
      ],
    );
  }
}
