package funciones with SPARK_Mode is

   function sumar (n1 : Integer; n2 : Integer) return Integer
     with
       Pre  => (if N1 >= 0 and N2 >= 0 then
                     N1 = Integer'Last - N2)
              and (if N1 <= 0 and N2 <= 0 then
                     N1 = Integer'First - N2),
        Post => sumar'Result = N1 + N2;
     
     
   function restar (n1 : Integer; n2 : Integer) return Integer
     with
       Pre  => (if N1 > 0 and N2 < 0 then
                     N1 = Integer'Last + N2)
              and (if N1 < 0 and N2 > 0 then
                     N1 = Integer'First + N2)
              and (N1 = 0 and N2 /= Integer'First),
     
        Post => restar'Result = N1 - N2;
   
   function multiplicar (n1 : Integer ; n2 : Integer)
                         return Integer with
     Pre =>
     n2 > 0 and n1 > 0 and
     (if n1 > 0 and n2 > 0 then n1 = Integer'Last / n2) and
     (if n1 < 0 and n2 < 0 then n1 = Integer'Last / n2) and
     (if n1 < 0 and n2 > 0 then Integer'First / n2 = n1) and
     (if n1 > 0 and n2 < 0 then Integer'First / n1 = n2);
   
      --Post => multiplicar'Result = n1 * n2;
   
   function dividirCociente (n1 : Integer; n2 : Integer) return Integer
     with
       Pre =>
         (n1 > Integer'First and n1 < Integer'Last) and 
         (n2 > Integer'First and n2 < Integer'Last and n2 /= 0);
     
       --Post => dividirCociente'Result = n1 / n2;
   
   
   function dividirResto (n1 : Integer; n2 : Integer) return Integer
     with
       Pre =>
         (n1 > Integer'First and n1 < Integer'Last) and 
         (n2 > Integer'First and n2 < Integer'Last and n2 /= 0);
     
       --Post => dividirCociente'Result = n1 / n2;

end funciones;
