VerletRope g_Rope;
DebugDisplay g_DebugDisplay = new DebugDisplay();

void setup()
{
  size(800, 800);
  
  g_Rope = new VerletRope(500, 8.0f);
}

void draw()
{
  background(0);
  
  g_Rope.Update();
  g_Rope.Display();
}
