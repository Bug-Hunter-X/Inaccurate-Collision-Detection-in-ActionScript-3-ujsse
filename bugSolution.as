function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  var rect1:Rectangle = obj1.getBounds(obj1.parent);
  var rect2:Rectangle = obj2.getBounds(obj2.parent);

  // Convert rectangles to the same coordinate space
  var globalRect1:Rectangle = new Rectangle(rect1.x + obj1.x, rect1.y + obj1.y, rect1.width, rect1.height);
  var globalRect2:Rectangle = new Rectangle(rect2.x + obj2.x, rect2.y + obj2.y, rect2.width, rect2.height);

  // Check for collision
  return globalRect1.intersects(globalRect2);
}

//Alternative solution using localToGlobal():

function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  var point1:Point = new Point(obj1.x, obj1.y);
  var point2:Point = new Point(obj2.x, obj2.y);

  var globalPoint1:Point = obj1.localToGlobal(point1);
  var globalPoint2:Point = obj2.localToGlobal(point2);

  //Check for collision
  return globalPoint1.x < globalPoint2.x + obj2.width && globalPoint1.x + obj1.width > globalPoint2.x &&
         globalPoint1.y < globalPoint2.y + obj2.height && globalPoint1.y + obj1.height > globalPoint2.y;
}

// ... later in the code ...

if (checkCollision(mc1, mc2)) {
  trace("Collision detected!");
}
