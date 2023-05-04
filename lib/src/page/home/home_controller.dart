import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentPage = 0.obs;
  var isPlaying = false.obs;
  RxDouble playProgress = 0.0.obs;
  final audioPlayer = AudioPlayer();
  List<Map<String, dynamic>> pages = [
    {
      'image': 'assets/images/780.jpg',
      'audio': 'audio/birds.mp3',
    },
    {
      'image': 'assets/images/OIP-C.jpeg',
      'audio': 'audio/sample-15s.mp3',
    },
    {
      'image': 'assets/images/233309.jpg',
      'audio': 'audio/mixkit-tech-house-vibes-130.mp3',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _updateProgress(audioPlayer);
    handlePlayCompletion();
    handlePlayChanged();
  }

  void handlePlayChanged(){
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        if(currentPage.value==pages.length -1){
          audioPlayer.stop();
          isPlaying.value = false;
        }else{
          currentPage.value = currentPage.value + 1;
          _playSong(pages[currentPage.value]["audio"]);
        }
      }
    });
  }

  void _playSong(String url) async {
    await audioPlayer.play(AssetSource(url));
  }

  void handlePlayCompletion(){
    audioPlayer.onPlayerComplete.listen((event) {

    });
  }

  void _updateProgress(AudioPlayer _audioPlayer) async {
    while (true) {
      Duration? currentPosition = await _audioPlayer.getCurrentPosition();
      Duration? totalPosition = await _audioPlayer.getDuration();
      if (currentPosition != null && totalPosition != null) {
        double progress = currentPosition.inSeconds / totalPosition.inSeconds;
        playProgress.value = progress;
        await Future.delayed(Duration(seconds: 1));
      }
    }
  }
}
