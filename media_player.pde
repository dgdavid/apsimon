import ddf.minim.Minim;
import ddf.minim.AudioPlayer;
import apwidgets.APMediaPlayer;

class  MediaPlayer {

  APMediaPlayer ap_mediaplayer;
  Minim minim;
  AudioPlayer track;

  MediaPlayer(PApplet p_parent) {
    if(IN_ANDROID) {
      ap_mediaplayer = new APMediaPlayer(p_parent);
    } else {
      minim = new Minim(p_parent);
    }
  }

  void load_track(String track_filename) {
    if(IN_ANDROID) {
      ap_mediaplayer.setMediaFile(track_filename);
    } else {
      track = minim.loadFile(track_filename);
    }
  }

  void play() {
    if(IN_ANDROID) {
      ap_mediaplayer.start();
    } else {
      track.play();
      //track.close();
      //minim.stop()
    }
  }

}
