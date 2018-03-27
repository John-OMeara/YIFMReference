class Target
{
  PVector position;
  
  Boolean active = false;
  
  color inactiveColor = color(255,150,150);
  color activeColor = color(150,255,150);
  
  Target (float x, float y){
    
    position = new PVector(x,y);
  }
  
  void update(){
    
    if(active){
      fill(activeColor);
    }
    else{
      fill(inactiveColor);
    }
    ellipse(position.x,position.y,5,5);
  }
}
