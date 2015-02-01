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

    space = new Space(new Vec2(0, 0));
    world = new World(50);

    var wallsize = 20;

    var ball = Body.ball(10);
    var perimeter = Body.perimeter(0, 0, container.stage.stageWidth, container.stage.stageHeight, wallsize);

    ball.body.position.setxy(wallsize * 4, wallsize * 4);
    ball.body.velocity.setxy(50, 250);

    space.bodies.add(perimeter.body);
    space.bodies.add(ball.body);

    world.physics.add(new Physics(space));

    world.render.add(new DebugPhysicsRender(container, space));
  }

  public function start()
    world.start();
}