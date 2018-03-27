Shia shia = new Shia(200,200,2.5);

Target[] targets = {
  new Target(200,50),
  new Target(50,200),
  new Target(250,350),
  new Target(350,150)
};
int currentTarget;

void setup()
{
  size(400,400);
  frameRate(30);
  ellipseMode(RADIUS);
  
  currentTarget = 0;
  targets[currentTarget].active = true;
  shia.target = targets[currentTarget].position;
}

void draw()
{
  background(255);
  
  for(int i = 0; i < targets.length; i++)
  {
    targets[i].update();
  }
  shia.update();
}

PVector nextTarget()
{
  targets[currentTarget].active = false;
  currentTarget++;
  if(currentTarget >= targets.length)
  {
    currentTarget = 0;
  }
  targets[currentTarget].active = true;
  
  return targets[currentTarget].position;
}

PVector nearestTarget(PVector shiaPos)
{
  targets[currentTarget].active = false;
  
  for(int i = 0; i < targets.length; i++)
  {
    float distanceToShia = targets[i].position.dist(shiaPos);
    float currentDistance = targets[currentTarget].position.dist(shiaPos);
    
    if(distanceToShia < currentDistance)
    {
      currentTarget = i;
    }
  }
  
  targets[currentTarget].active = true;
  return targets[currentTarget].position;
}
