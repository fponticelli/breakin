package breakin.interaction;

import edge.cosystem.KeyboardInput;
import edge.ISystem;

class KeyboardSystem extends KeyboardInput implements ISystem {
  function update() {
    for(k in keys) switch k.toString() {
      case "LEFT":
        trace("GO LEFT");
      case c:
        trace('not mapped: $c');
    }
  }
}