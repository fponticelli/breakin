import thx.color.HSL;

import nape.phys.Material;

class Config {
  public static var backgroundColor = HSL.create(0, 0.0, 0.98);
  public static var wallSize = 2;
  public static var width = 800;
  public static var height = 600;
  public static var paddle = {
    width : 100.0,
    height : 20.0,
    fromBottom : 20.0,
    delta : 30,
    maxVelocity: 1200, // px/sec
    accelleration : 4000,
    decelleration : 1000,
    material : new Material(0.8, 1.0, 1.4, 1.5, 0.01)
  };
  public static var ball = {
    radius : 8,
    spriteRadius : 10,
    material : new Material(0.7, 1.0, 1.4, 1.5, 0.01)
  };
  public static var wall = {
    size : 2,
    material : new Material(0.2, 1.0, 1.4, 1.5, 0.01)
  }
}