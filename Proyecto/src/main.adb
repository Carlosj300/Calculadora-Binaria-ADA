with assertions;  use assertions;
with funciones;   use funciones;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   procedure Test_Sumar is

      -- Variables
      n1 : Integer := 5;
      n2 : Integer := -3;
      n3 : Integer := 0;

   begin

      Assert_True(sumar(n1,n1) = 10, "Positivo_Positivo");
      Assert_True(sumar(n2,n2) = -6, "Negativo_Negativo");
      Assert_True(sumar(n3,n3) = 0, "Cero_Cero");
      Assert_True(sumar(n1,n2) = 2, "Positivo_Negativo");
      Assert_True(sumar(n1,n3) = 5, "Positivo_Cero");
      Assert_True(sumar(n2,n3) = -3, "Negativo_Cero");


   end Test_Sumar;

   procedure Test_Restar is

      -- Variables
      n1 : Integer := 5;
      n2 : Integer := -3;
      n3 : Integer := 0;

   begin

      Assert_True(restar(n1,n1) = 0, "Positivo_Positivo");
      Assert_True(restar(n2,n2) = 0, "Negativo_Negativo");
      Assert_True(restar(n3,n3) = 0, "Cero_Cero");
      Assert_True(restar(n1,n2) = 8, "Positivo_Negativo");
      Assert_True(restar(n1,n3) = 5, "Positivo_Cero");
      Assert_True(restar(n2,n3) = -3, "Negativo_Cero");


   end Test_Restar;

   procedure Test_Multiplicar is

      n1 : Integer := 5;
      n2 : Integer := 10;
      n3 : Integer := -20;
      n4 : Integer := -2;

   begin

      Assert_True(multiplicar(n2,n1) = 50, "Positivo_Positivo");
      Assert_True(multiplicar(n3,n1) = -100, "Negativo_Positivo");
      Assert_True(multiplicar(n3,n4) = 40, "Negativo_Negativo");
      Assert_True(multiplicar(n2,n4) = -20, "Positivo_Negativo");

   end Test_Multiplicar;

   procedure Test_Dividir_Cociente is

      n1 : Integer := 5;
      n2 : Integer := 10;
      n3 : Integer := -20;
      n4 : Integer := -2;

   begin

      Assert_True(dividirCociente(n2,n1) = 2, "Positivo_Positivo");
      Assert_True(dividirCociente(n3,n1) = -4, "Negativo_Positivo");
      Assert_True(dividirCociente(n3,n4) = 10, "Negativo_Negativo");
      Assert_True(dividirCociente(n2,n4) = -5, "Positivo_Negativo");

   end Test_Dividir_Cociente;

   procedure Test_Dividir_Resto is

      n1 : Integer := 5;
      n2 : Integer := 9;
      n3 : Integer := -20;
      n4 : Integer := -3;

   begin

      Assert_True(dividirResto(n2,n1) = 4, "Positivo_Positivo");
      Assert_True(dividirResto(n3,n1) = 0, "Negativo_Positivo");
      Assert_True(dividirResto(n3,n4) = 2, "Negativo_Negativo");
      Assert_True(dividirResto(n2,n4) = 0, "Positivo_Negativo");

   end Test_Dividir_Resto;

begin

   Put_Line("Sumar");
   Test_Sumar;

   Put_Line("Restar");
   Test_Restar;

   Put_Line("Multiplicar");
   Test_Multiplicar;

   Put_Line("Dividir Cociente");
   Test_Dividir_Cociente;

   Put_Line("Dividir Resto");
   Test_Dividir_Resto;

end Main;
