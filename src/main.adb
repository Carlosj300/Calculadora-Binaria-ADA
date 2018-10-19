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

      -- Asserts
      Assert_True(sumar(n1,n1) = 10, "Positivo_Positivo");
      Assert_True(sumar(n2,n2) = -6, "Negativo_Negativo");
      Assert_True(sumar(n3,n3) = 0, "Cero_Cero");
      Assert_True(sumar(n1,n2) = 2, "Positivo_Negativo");
      Assert_True(sumar(n1,n3) = 5, "Positivo_Cero");
      Assert_True(sumar(n2,n3) = -3, "Negativo_Cero");

   exception

         --Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Sumar;

   procedure Test_Restar is

      -- Variables
      n1 : Integer := 5;
      n2 : Integer := -3;
      n3 : Integer := 0;

   begin

      -- Asserts
      Assert_True(restar(n1,n1) = 0, "Positivo_Positivo");
      Assert_True(restar(n2,n2) = 0, "Negativo_Negativo");
      Assert_True(restar(n3,n3) = 0, "Cero_Cero");
      Assert_True(restar(n1,n2) = 8, "Positivo_Negativo");
      Assert_True(restar(n1,n3) = 5, "Positivo_Cero");
      Assert_True(restar(n2,n3) = -3, "Negativo_Cero");

   exception

         -- Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Restar;

   procedure Test_Multiplicar is

      -- Variables
      n1 : Integer := 5;
      n2 : Integer := 10;
      n3 : Integer := -20;
      n4 : Integer := -2;

   begin

      -- Asserts
      Assert_True(multiplicar(n2,n1) = 50, "Positivo_Positivo");
      Assert_True(multiplicar(n3,n1) = -100, "Negativo_Positivo");
      Assert_True(multiplicar(n3,n4) = 40, "Negativo_Negativo");
      Assert_True(multiplicar(n2,n4) = -20, "Positivo_Negativo");

   exception

         -- Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Multiplicar;

   procedure Test_Dividir_Cociente is

      -- Variables
      n1 : Integer := 5;
      n2 : Integer := 10;
      n3 : Integer := -20;
      n4 : Integer := -2;

   begin

      -- Asserts
      Assert_True(dividirCociente(n2,n1) = 2, "Positivo_Positivo");
      Assert_True(dividirCociente(n3,n1) = -4, "Negativo_Positivo");
      Assert_True(dividirCociente(n3,n4) = 10, "Negativo_Negativo");
      Assert_True(dividirCociente(n2,n4) = -5, "Positivo_Negativo");

   exception

         --Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Dividir_Cociente;

   procedure Test_Dividir_Resto is

      -- Variables
      n1 : Integer := 5;
      n2 : Integer := 9;
      n3 : Integer := -20;
      n4 : Integer := -3;

   begin

      -- Asserts
      Assert_True(dividirResto(n2,n1) = 4, "Positivo_Positivo");
      Assert_True(dividirResto(n3,n1) = 0, "Negativo_Positivo");
      Assert_True(dividirResto(n3,n4) = 2, "Negativo_Negativo");
      Assert_True(dividirResto(n2,n4) = 0, "Positivo_Negativo");

   exception

         --Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Dividir_Resto;

   procedure Test_Binario_A_Hexadecimal is

      -- Variables
      a1 : Binario := (1,0,0,0,1,1,0,1,0,1,1,1,0,1,0,0,0,0,1,0,1,1,1,1,1,0,0,0,1,0,1,0);
      a2 : Binario := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      a3 : Binario := (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

   begin

      -- Asserts
      Assert_True(BintoHex32(a1) = "8D742F8A", "Numero_Aleatorio");
      Assert_True(BintoHex32(a2) = "00000000", "Numero_Minimo");
      Assert_True(BintoHex32(a3) = "FFFFFFFF", "Numero_Maximo");

   exception

         -- Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Binario_A_Hexadecimal;

   procedure Test_Hexadecimal_A_Binario is

      -- Variables
      a1 : Binario := (1,0,0,0,1,1,0,1,0,1,1,1,0,1,0,0,0,0,1,0,1,1,1,1,1,0,0,0,1,0,1,0);
      a2 : Binario := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      a3 : Binario := (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

   begin

      -- Asserts
      Assert_True(Hex32toBin("8D742F8A") = a1, "Numero_Aleatorio");
      Assert_True(Hex32toBin("00000000") = a2, "Numero_Minimo");
      Assert_True(Hex32toBin("FFFFFFFF") = a3, "Numero_Maximo");

   exception

         --Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Hexadecimal_A_Binario;

   procedure Test_Binario_A_Decimal is

      -- Variables
      a1 : HBinario := (0,0,1,0,1,1,1,1,1,0,0,0,1,0,1,0);
      a2 : HBinario := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      a3 : HBinario := (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

   begin

      -- Asserts
      Assert_True(BintoDec(a1) = 12170, "Numero_Aleatorio");
      Assert_True(BintoDec(a2) = 0, "Numero_Minimo");
      Assert_True(BintoDec(a3) = 65535, "Numero_Maximo");

   exception

         -- Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Binario_A_Decimal;

   procedure Test_Decimal_A_Binario is

      -- Variables
      a1 : HBinario := (0,0,1,0,1,1,1,1,1,0,0,0,1,0,1,0);
      a2 : HBinario := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      a3 : HBinario := (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

   begin

      -- Asserts
      Assert_True(DectoBin(12170) = a1, "Numero_Aleatorio");
      Assert_True(DectoBin(0) = a2, "Numero_Minimo");
      Assert_True(DectoBin(65535) = a3, "Numero_Maximo");

   exception

         -- Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Decimal_A_Binario;

   procedure Test_Decimal_A_Hexadecimal is

      -- Variables
      s1 : String (1 .. 4) := "2F8A";
      s2 : String (1 .. 4) := "0000";
      s3 : String (1 .. 4) := "FFFF";

   begin

      -- Asserts
      Assert_True(DectoHex16(12170) = s1, "Numero_Aleatorio");
      Assert_True(DectoHex16(0) = s2, "Numero_Minimo");
      Assert_True(DectoHex16(65535) = s3, "Numero_Maximo");

   exception

         -- Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Decimal_A_Hexadecimal;

   procedure Test_Hexadecimal_A_Decimal is

      -- Variables
      s1 : String (1 .. 4) := "2F8A";
      s2 : String (1 .. 4) := "0000";
      s3 : String (1 .. 4) := "FFFF";

   begin

      -- Asserts
      Assert_True(Hex16toDec(s1) = 12170, "Numero_Aleatorio");
      Assert_True(Hex16toDec(s2) = 0, "Numero_Minimo");
      Assert_True(Hex16toDec(s3) = 65535, "Numero_Maximo");

   exception

         --Exception
      when Assertion_Error =>
         Put_Line (" Failed (assertion)");
      when others =>
         Put_Line (" Failed (exception)");

   end Test_Hexadecimal_A_Decimal;

begin

   Put_Line("----Sumar");
   Test_Sumar;
   New_Line;

   Put_Line("----Restar");
   Test_Restar;
   New_Line;

   Put_Line("----Multiplicar");
   Test_Multiplicar;
   New_Line;

   Put_Line("----Dividir Cociente");
   Test_Dividir_Cociente;
   New_Line;

   Put_Line("----Dividir Resto");
   Test_Dividir_Resto;
   New_Line;

   Put_Line("----Binario A Hexadecimal");
   Test_Binario_A_Hexadecimal;
   New_Line;

   Put_Line("----Hexadecimal A Binario");
   Test_Hexadecimal_A_Binario;
   New_Line;

   Put_Line("----Binario A Decimal");
   Test_Binario_A_Decimal;
   New_Line;

   Put_Line("----Decimal A Binario");
   Test_Decimal_A_Binario;
   New_Line;

   Put_Line("----Decimal A Hexadecimal");
   Test_Decimal_A_Hexadecimal;
   New_Line;

   Put_Line("----Hexadecimal A Decimal");
   Test_Hexadecimal_A_Decimal;
   New_Line;
end Main;
