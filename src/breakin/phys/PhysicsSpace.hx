package breakin.phys;

import edge.*;
import breakin.components.*;
import nape.space.Space;
import nape.phys.*;
import nape.geom.Vec2;

class PhysicsSpace implements ISystem {
  var timeDelta : Float;
  var space : Space;

  var bodies : View<{ structure : Structure }>;
  var map : Map<Entity, Body>;

  public function new() {
    this.space = new Space(Vec2.weak(0, 200));
    map = new Map();
  }

  public function bodiesAdded(entity : Entity, data : { structure : Structure }) {
    map.set(entity, data.structure.body);
    space.bodies.add(data.structure.body);
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