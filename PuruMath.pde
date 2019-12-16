int Combination(int n, int i) //nCi
{
  return Factorial(n)/(Factorial(i) * Factorial(n-i));
}

int Factorial(int n)
{
   int answer = 1;
   for (int i = 1; i <= n; ++i)
   {
      answer *= i; 
   }
   
   return answer; 
}
