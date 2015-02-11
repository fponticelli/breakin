package breakin.phys;

import edge.*;
import breakin.components.*;
import nape.space.Space;
//import nape.phys.*;
import nape.geom.Vec2;

class PhysicsSpace implements ISystem {
  var timeDelta : Float;
  var space : Space;

  var bodies : View<{ body : Body }>;
  var map : Map<Entity, nape.phys.Body>;

  public function new() {
    this.space = new Space(Vec2.weak(0, 200));
    map = new Map();
  }

  public function bodiesAdded(entity : Entity, data : { body : Body }) {
    map.set(entity, data.body.body);
    space.bodies.add(data.body.body);
  }

  public function bodiesRemoved(entity : Entity) {
    var body = map.get(entity);
    map.remove(entity);
    space.bodies.add(body);
  }

  public function update() {
    space.step(timeDelta / 1000);
  }
}