class VerletRope
{
 ArrayList<VerletPoint> m_Points;
 float m_SegLength;
 
 VerletRope(int size, float radius)
 {
  int numPoints = (int)size/50;
  float segLength = (float)size/numPoints;
  m_SegLength = segLength;
  
  m_Points = new ArrayList<VerletPoint>();
  
  PVector startPos = new PVector(width/2, height/4);
  PVector ropeDir = new PVector(1, 0);
  PVector idealRopeDir = new PVector(0, 1);
  float pointMass = 1.0f;
  float pointDiameter = radius * 2;
  
  for (int iter = 0; iter < numPoints; ++iter)
  {
    PVector pointPos = PVector.add(startPos, PVector.mult(ropeDir, iter*segLength));
    m_Points.add(new VerletPoint(pointPos, pointMass, pointDiameter)); 
  }
  
  m_Points.get(0).m_Fixed = true;
 }
 
 void Update()
 {
   PVector grav = new PVector(0, 10.0f);
   float dragFactor = 1.0f;
   
   for (VerletPoint point : m_Points)
   {
     
     if (point.m_Fixed == false)
     {
       PVector curVel = PVector.mult(PVector.sub(point.m_Pos, point.m_PrevPos), dragFactor);

       point.m_PrevPos = point.m_Pos;
       point.m_Pos.add(curVel);
       point.m_Pos.add(grav);
     }
   }
   
   //Constrain points
   int stiffness = 30;
   
   for (int iter = 0; iter < stiffness; ++iter)
   {
      for (int pointIter = 0; pointIter < m_Points.size() - 1; ++pointIter)
      {
        VerletPoint point1 = m_Points.get(pointIter);
        VerletPoint point2 = m_Points.get(pointIter + 1);
        
        PVector dispPoints = PVector.sub(point2.m_Pos, point1.m_Pos);
        float distPoints = dispPoints.mag();
        
        PVector distConstraintForce = PVector.mult(dispPoints, (m_SegLength - distPoints)/(2*distPoints));
        
        if (!point2.m_Fixed)
        {
          point2.m_Pos.add(distConstraintForce);
        }
        
        if (!point1.m_Fixed)
        {
          point1.m_Pos.sub(distConstraintForce);
        }        
      }
   }
 }
 
 void Display()
 {
   //DisplayPoints();
   DrawBezierRope();
 }
 
 void DisplayPoints()
 {
    fill(255, 0, 0);
    stroke(255, 0, 0);
    
    for(int iter = 0; iter < m_Points.size()-1; ++iter)
    {
       VerletPoint point1 = m_Points.get(iter);
       VerletPoint point2 = m_Points.get(iter+1);
       
       line(point1.m_Pos.x, point1.m_Pos.y, point2.m_Pos.x, point2.m_Pos.y);
       point1.Display(); 
       point2.Display();
       
       g_DebugDisplay.PrintString(PVector.add(point2.m_Pos, new PVector(10, 0)), Float.toString((PVector.sub(point2.m_Pos, point1.m_Pos).mag())), 1, DebugColors.RED);
    }
 }
 
 void DrawBezierRope()
 {
    DrawBezierCurve(0, m_Points.size()-1);
 }
 
 void DrawBezierCurve(int startingCPIndex, int endingCPIndex)
 {
   int curveOrder = endingCPIndex - startingCPIndex;
   
   for (float t = 0; IsLesserOrEqualWithEpsilon(t, 1.0f); t += 0.001f)
    {
       float pX = 0;
       float pY = 0;
       
       float tInverse = 1-t;
       
       for (int cpIter = startingCPIndex; cpIter <= endingCPIndex; ++cpIter)
       {
          PVector cpPixelPos = m_Points.get(cpIter).m_Pos.copy();

          int relIter = cpIter - startingCPIndex;
          float pointCoeff = (float)(Combination(curveOrder, relIter) * (Math.pow(tInverse, curveOrder - relIter)) * (Math.pow(t, relIter)));
          pX += pointCoeff * cpPixelPos.x;
          pY += pointCoeff * cpPixelPos.y;
       }
       
       stroke(0, 255, 0, 255);
       point(pX, pY);
    }
 }
}
