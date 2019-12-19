VerletRope g_Rope;
DebugDisplay g_DebugDisplay = new DebugDisplay();
boolean g_FollowMouse = false;
boolean g_SimulatePendulum = false;
int m_CycleStart = 0;
int m_CycleRange = 200;
float g_MaxPendulumAngle = PI/4;
float g_MinPendulumAngle = -PI/4;

void setup()
{
  size(1200, 1200);
  
  g_Rope = new VerletRope(500, 8.0f);
  g_Rope.m_CPWithPendulum = 4;
}

void draw()
{
  background(0);
  
  if (g_SimulatePendulum)
  {
     
  }
  
  g_Rope.Update();
  g_Rope.Display();
}

void mousePressed()
{
   if (mouseButton == LEFT)
   {
     g_FollowMouse = !g_FollowMouse;
     if (g_Rope.m_CPWithPendulum == 0)
     {
      g_Rope.m_CPWithPendulum = g_Rope.m_Points.size()-1; 
     }
   }
   else if (mouseButton == RIGHT)
   {
     g_SimulatePendulum = !g_SimulatePendulum;
   }
}
