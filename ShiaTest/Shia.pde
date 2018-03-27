class Shia
{
  PVector position;
  PVector pointing;
  PVector direction;
  float speed;
  
  Boolean chasing = false;
  PVector target;
  
  color patrol = color(0,0,255);
  color chase = color(255,0,0);
  
  Shia(float x, float y, float sp){
    
    position = new PVector(x,y);
    pointing = position.copy();
    speed = sp;
  }
  
  void update(){
    
    PVector mouse = new PVector(mouseX,mouseY);
    
    if(position.dist(mouse) < 100){
      chasing = true;
    }
    else{
      if(chasing)
      {
        target = nearestTarget(position);
      }
      chasing = false;
    }
    
    if(chasing){
      direction = PVector.sub(mouse,position);
      direction.normalize();
      
      position.add(direction.mult(speed));
      
      fill(chase);
    }
    else{
      direction = PVector.sub(target,position);
      direction.normalize();
      
      position.add(direction.mult(speed));
      
      if(position.dist(target) < 2){
        target = nextTarget();
      }
      
      fill(patrol);
    }
    
    ellipse(position.x,position.y,7,7);
    
    pointing = position.copy();
    pointing.x = position.x + cos(direction.heading())*10;
    pointing.y = position.y + sin(direction.heading())*10;
    
    ellipse(pointing.x,pointing.y,4,4);
    
    fill(240);
  }
}
