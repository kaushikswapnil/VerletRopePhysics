VerletRope g_Rope;
DebugDisplay g_DebugDisplay = new DebugDisplay();
boolean g_FollowMouse = false;

void setup()
{
  size(1200, 1200);
  
  g_Rope = new VerletRope(400, 8.0f);
  g_Rope.m_CPWithPendulum = 0;
}

void draw()
{
  background(0);
  
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
}
