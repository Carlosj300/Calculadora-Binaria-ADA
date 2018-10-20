package funciones with SPARK_Mode is
   
   hex : constant String := ("0123456789ABCDEF");
   subtype Binary_Values is Integer range 0 .. 1;
   type Binario is array (0 .. 31) of Binary_Values;
   type HBinario is array (0 .. 15) of Binary_Values;
   --Tipos usados en los metodos de conversion de numeros
     function BintoHex32 (n1 : Binario) return String
       with 
           Pre => (for all K in n1'Range =>
                     (n1(K) = 0 or n1(K) = 1)),
            post => (BintoHex32'Result'Length = 8);
       
       
   -- Método que convierte un número binario a un número hexadecimal (máx 32 bits)   
   
     function Hex32toBin (n1 : String) return Binario
       with 
         Pre => (n1'Length = 8) and (for all L in n1'Range =>
               (for some N in Hex'Range =>
                  n1(L) = Hex(N))),
       Post => (for all K in Hex32toBin'Result'Range =>
       Hex32toBin'Result(K) = 0 or Hex32toBin'Result(K) = 1 );
       
   -- Método que convierte un número hexadecimal a un número binario (máx 32 bits)

   function DectoHex16 (n1 : Integer) return String
     with
     Pre => n1 >= 0 and n1 <= 65535,
         
     Post => (DectoHex16'Result'Length = 4); 
       
   -- Método que convierte un número decimal a un número hexadecimal (máx 16 bits)
end funciones;
