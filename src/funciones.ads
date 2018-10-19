package funciones with SPARK_Mode is
   
   hex : constant String := ("0123456789ABCDEF");
   subtype Binary_Values is Integer range 0 .. 1;
   type Binario is array (0 .. 31) of Binary_Values;
   type HBinario is array (0 .. 15) of Binary_Values;
   --Tipos usados en los metodos de conversion de numeros
   
   --function BintoHex32 (n1 : Binario) return String;
   -- Método que convierte un número binario a un número hexadecimal (máx 32 bits)
   
   --function Hex32toBin (n1 : String) return Binario;
   -- Método que convierte un número hexadecimal a un número binario (máx 32 bits)
   
   function DectoBin (n1 : Integer) return HBinario
     with
       Pre =>
         n1 >= 0;
   -- Método que convierte un número decimal a un número binario (máx 16 bits)
   
   --function BintoDec (n1 : HBinario) return Integer;
   -- Método que convierte un número binario a un número decimal (máx 16 bits)
   
   function DectoHex16 (n1 : Integer) return String
     with
       Pre =>
         n1 >= 0;
   -- Método que convierte un número decimal a un número hexadecimal (máx 16 bits)
   
   --function Hex16toDec (n1 : String) return Integer;
   -- Método que convierte un número hexadecimal a un número decimal (máx 16 bits)
   
end funciones;
