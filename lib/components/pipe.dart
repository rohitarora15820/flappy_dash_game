import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';

class Pipe extends PositionComponent{

  late Sprite _sprite;

  final bool isFlipped;

  Pipe({required this.isFlipped, 
  required super.position
  });

  @override
  Future<void> onLoad() async{
    // TODO: implement onLoad
    await super.onLoad();
    

    _sprite= await Sprite.load('pipe.png');

    anchor=Anchor.topCenter;
    final ratio=_sprite.srcSize.y / _sprite.srcSize.x;
    final width=82.0;
   
    size=Vector2(width,width * ratio);

   if(isFlipped){
    flipVertically();
   }

  }


@override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    _sprite.render(canvas,
    position: Vector2.zero(),
    size:size);
  }

}