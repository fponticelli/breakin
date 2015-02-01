package breakin;

import nape.space.Space;
import edge.World;
import openfl.display.Sprite;

import nape.phys.*;
import nape.geom.Vec2;

import breakin.components.*;
import breakin.phys.*;
import breakin.render.*;

class Game {
  var space : Space;
  var world : World;
  var container : Sprite;
  public function new(container : Sprite) {
    this.container = container;
    //container.graphics.beginFill(0x00FF00);
    //container.graphics.drawRect(0, 0, 100, 100);
    //container.graphics.endFill();

    space = new Space(new Vec2(0, 0));
    world = new World(50);

    var wallsize = 10;

    var walls = [
        Body.rect(
          0,
          container.stage.stageHeight - wallsize,
          container.stage.stageWidth,
          wallsize,
          BodyType.STATIC
        ),
        Body.rect(
          0,
          0,
          container.stage.stageWidth,
          wallsize,
          BodyType.STATIC
        ),
        Body.rect(
          0,
          0,
          wallsize,
          container.stage.stageHeight,
          BodyType.STATIC
        ),
        Body.rect(
          container.stage.stageWidth - wallsize,
          0,
          wallsize,
          container.stage.stageHeight,
          BodyType.STATIC
        ),
      ];
    // new Floor(container.stage.stageWidth, container.stage.stageHeight);
    var ball = Body.ball(10);

    ball.shape.body.velocity.setxy(10, 10);

    for(wall in walls)
      space.bodies.add(wall.shape.body);

    space.bodies.add(ball.shape.body);

    world.physics.add(new Physics(space));

    world.render.add(new DebugPhysicsRender(container, space));
  }

  public function start()
    world.start();
}