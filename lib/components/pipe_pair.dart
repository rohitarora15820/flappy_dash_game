import 'package:flame/components.dart';
import 'package:flappy_dash/components/hidden_coin.dart';
import 'package:flappy_dash/components/pipe.dart';

class PipePair extends PositionComponent {
  PipePair({required super.position, this.gap = 200,this.speed=200.0});

  final double gap;
  final double speed;

  @override
  void onLoad() {
    // TODO: implement onLoad
    super.onLoad();

    addAll([
      Pipe(isFlipped: false, position: Vector2(0, gap/2)),
      Pipe(isFlipped: true, position: Vector2(0, -(gap/2))),
      HiddenCoin(
        position: Vector2(30,0), 
      )
    ]);
  }


  @override
  void update(double dt) {
       position.x -= speed * dt;
    // TODO: implement update
    super.update(dt);
 

  }
}
