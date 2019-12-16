boolean IsNullWithEpsilon(float value)
{
  return IsNullWithEpsilonEx(value, EPSILON);
}

boolean IsNullWithEpsilonEx(float value, float epsilon)
{
  return abs(value - 0.0) <= epsilon;
}

boolean IsGreaterWithEpsilon(float a, float b)
{
  return (a - b) > EPSILON;
}

boolean IsLesserWithEpsilon(float a, float b)
{
  return (a - b) < EPSILON;
}

boolean IsEqualWithEpsilon(float a, float b)
{
  return IsNullWithEpsilon(a-b); 
}

boolean IsEqualWithEpsilonEx(float a, float b, float epsilon)
{
  return IsNullWithEpsilonEx(a-b, epsilon); 
}

boolean IsGreaterOrEqualWithEpsilon(float a, float b)
{
   return IsGreaterWithEpsilon(a, b) || IsEqualWithEpsilon(a, b); 
}

boolean IsLesserOrEqualWithEpsilon(float a, float b)
{
   return IsLesserWithEpsilon(a, b) || IsEqualWithEpsilon(a, b); 
}
