import 'dart:ui';
double offset = 100;
// MARK: - Simplest animation 
void beginFrame(Duration timeStamp) {
  final PictureRecorder recorder = PictureRecorder();
  final Canvas canvas = Canvas(recorder);

  offset += 1;

  canvas.drawRect(
    const Rect.fromLTRB(300, 700, 800, 1200),
    Paint()..color = Color.fromARGB(255, 0, 255, 0),
  );

  final Picture picture = recorder.endRecording();
  final SceneBuilder sceneBuilder = SceneBuilder()
    ..addPicture(Offset.zero, picture)
    ..pushOffset(offset, 800)
    ..addPicture(Offset.zero, picture);

  window.render(sceneBuilder.build());
  window.scheduleFrame();
}

void main() {
  window.onBeginFrame = beginFrame;
  window.scheduleFrame();
}
