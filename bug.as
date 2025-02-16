function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  var rect1:Rectangle = obj1.getBounds(obj1.parent);
  var rect2:Rectangle = obj2.getBounds(obj2.parent);

  return rect1.intersects(rect2);
}

// ... later in the code ...

if (checkCollision(mc1, mc2)) {
  trace("Collision detected!");
}

//Problem: This code might not work correctly if either mc1 or mc2 is not added to the display list, or if their parents have different coordinate systems.