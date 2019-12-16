class VerletPoint
{
 PVector m_Pos;
 PVector m_PrevPos;
 PVector m_RestPos;
 
 float m_Mass;
 float m_Diameter;
 
 boolean m_Fixed;
 
 VerletPoint(PVector pos, float mass, float diameter)
 {
   m_Pos = pos.copy();
   m_PrevPos = m_Pos.copy();
   
   m_Mass = mass;
   m_Diameter = diameter;
   
   m_Fixed = false;
 }
 
 void Display()
 {
    
    ellipse(m_Pos.x, m_Pos.y, m_Diameter, m_Diameter); 
 }
}
