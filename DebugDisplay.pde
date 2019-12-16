enum DebugColors
{
  RED, 
  GREEN,
  BLUE,
  YELLOW,
  WHITE,
  PINK,
  BLACK,
}

class DebugDisplay
{ 
  void DrawLine(float startPosX, float startPosY, float endPosX, float endPosY, DebugColors colorVal)
  {
   pushMatrix();
   SetStrokeColor(colorVal);
   line (startPosX, startPosY, endPosX, endPosY);
   popMatrix();
  }
  
  void DrawLine(PVector pos, PVector dir, float length, DebugColors colorVal)
  {
     dir.normalize();
     dir.mult(length);
     
     PVector endPos = PVector.add(dir, pos);
     
     DrawLine(pos.x, pos.y, endPos.x, endPos.y, colorVal);
  }
  
  void DrawLine(PVector startPos, PVector endPos, DebugColors colorVal)
  {
     DrawLine(startPos.x, startPos.y, endPos.x, endPos.y, colorVal);
  }
  
  void DrawArrow(float posX, float posY, float dirX, float dirY, float length, DebugColors colorVal)
  {
     DrawArrow(new PVector(posX, posY), new PVector(dirX, dirY), length, colorVal); 
  }
  
  void DrawArrow(PVector pos, PVector dir, float length, DebugColors colorVal)
  {
     dir.normalize();
     PVector endPos = PVector.add(pos, PVector.mult(dir, length)); 
     DrawLine(pos, endPos, colorVal);
     
     PVector revDir = PVector.mult(dir, -1);
     float rotAngle = 45;
     float rotAngleRadians = (float)Math.toRadians(rotAngle);
     float cosAngle = (float)Math.cos(rotAngleRadians);
     float sinAngle = (float)Math.sin(rotAngleRadians);
     float cosNegAngle = (float)Math.cos(-rotAngleRadians);
     float sinNegAngle = (float)Math.sin(-rotAngleRadians);
     
     float dirX = revDir.x;
     float dirY = revDir.y;
     
     PVector arrowHead1 = new PVector(((dirX*cosAngle) - (dirY*sinAngle)), ((dirX*sinAngle) + (dirY*cosAngle)));
     PVector arrowHead2 = new PVector(((dirX*cosNegAngle) - (dirY*sinNegAngle)), ((dirX*sinNegAngle) + (dirY*cosNegAngle)));
     
     DrawLine(endPos, arrowHead1, length/3, colorVal); //<>//
     DrawLine(endPos, arrowHead2, length/3, colorVal);
  }
  
  void PrintString(PVector pos, String text, int textScale, DebugColors colorVal)
  {
     PrintString(pos.x, pos.y, text, textScale, colorVal);
  }
  
  void PrintString(float posX, float posY, String text, int textScale, DebugColors colorVal)
  {
     pushMatrix();
     SetFillColor(colorVal);
     textSize(textScale*15);
     text(text, posX, posY); 
     popMatrix();
  }
  
  void SetStrokeColor(DebugColors colorVal)
  {
      float[] rgbColors = GetRGBValues(colorVal);
      stroke(rgbColors[0], rgbColors[1], rgbColors[2]);
  }
  
  void SetFillColor(DebugColors colorVal)
  {
      float[] rgbColors = GetRGBValues(colorVal);
      fill(rgbColors[0], rgbColors[1], rgbColors[2]);
  }
  
  float[] GetRGBValues(DebugColors colorVal)
  {
    float[] rgbColors = new float[3];
    
    switch(colorVal)
    {
       case RED:
       rgbColors[0] = 255;
       rgbColors[1] = 0;
       rgbColors[2] = 0;
       break;
       
       case GREEN:
       rgbColors[0] = 0;
       rgbColors[1] = 255;
       rgbColors[2] = 0;
       break;
       
       case BLUE:
       rgbColors[0] = 0;
       rgbColors[1] = 0;
       rgbColors[2] = 255;
       break;
       
       case YELLOW:
       rgbColors[0] = 255;
       rgbColors[1] = 255;
       rgbColors[2] = 0;
       break;
       
       case PINK:
       rgbColors[0] = 255;
       rgbColors[1] = 51;
       rgbColors[2] = 255;
       break;
       
       case BLACK:
       rgbColors[0] = 0;
       rgbColors[1] = 0;
       rgbColors[2] = 0;
       break;
       
       case WHITE:
       default:
       rgbColors[0] = 255;
       rgbColors[1] = 255;
       rgbColors[2] = 255;
       break;
    }
    
    return rgbColors;
  }
}
