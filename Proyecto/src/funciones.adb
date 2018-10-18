package body funciones with SPARK_Mode is

   function sumar (n1 : Integer; n2 : Integer) return Integer is
      
      -- Variables
      result : Integer;
      
   begin
      result := n1 + n2;
      
      return result;
   end sumar;
   
   function restar (n1 : Integer; n2 : Integer) return Integer is
      
      -- Variables
      result : Integer;
      
   begin
      result := n1 - n2;
      
      return result;
   end restar;
   
   function multiplicar (n1 : Integer ; n2 : Integer) return Integer is
      
      -- Variables
      r : Integer := 0;
      c1 : Integer := abs(n1);
      c2 : Integer := abs(n2);
      
   begin
      
      -- Bucle para multiplicar
      while c2 > 0 loop
         
         if r <= integer'Last and c1 <= Integer'Last-r then
            r := r + c1;
         else
            exit;
         end if;
         
         c2 := c2 - 1;
         
         pragma Loop_Variant (Decreases => c2);
         pragma Loop_Invariant (c2 in 0 .. abs(n2));
         pragma Loop_Invariant (c1 in 0 .. abs(n1));
         pragma Loop_Invariant (r in Natural);
         
      end loop;
      
      -- Devolucion de datos
      if (n1 < 0 and then n2 < 0) or (n1 > 0 and then n2 > 0) then
         return r;
      else
         return -r;
      end if;
      
   end multiplicar;
   
   function dividirCociente (n1 : Integer; n2 : Integer) return Integer is
      
      -- Variables
      result : Integer := 0;
      c1 : Integer := abs(n1);
      c2 : Integer := abs(n2);
      
   begin
      
      if c1 = 0 then return 0; end if;
      
      while c1 >= c2 loop
         if result < Integer'Last then
            result := result + 1;
         end if;
         c1 := c1 - c2;
         
         pragma Loop_Variant (Decreases => c1);
         pragma Loop_Invariant (c1 in 0 .. abs(n1));
         pragma Loop_Invariant (c2 in 1 .. abs(n2));
         pragma Loop_Invariant (result in Natural);
      end loop;
      
      if (n1 < 0 and then n2 < 0) or (n1 > 0 and then n2 > 0) then
         return result;
      else
         return -result;
      end if;
      
      
      
   end dividirCociente;
   
   function dividirResto (n1 : Integer; n2 : Integer) return Integer is
      
      -- Variables
      c1 : Integer := abs(n1);
      c2 : Integer := abs(n2);
      
   begin
      
      if c1 = 0 then return 0; end if;
      
      while c1 >= c2 loop
         
         c1 := c1 - c2;
         
         pragma Loop_Variant (Decreases => c1);
         pragma Loop_Invariant (c1 in 0 .. abs(n1));
         pragma Loop_Invariant (c2 in 1 .. abs(n2));
         
      end loop;
      
      return c1;
   end dividirResto;
   
end funciones;
