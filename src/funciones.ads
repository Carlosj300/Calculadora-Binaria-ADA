package funciones with SPARK_Mode is
   
   hex : constant String := ("0123456789ABCDEF");
   subtype Binary_Values is Integer range 0 .. 1;
   type Binario is array (0 .. 31) of Binary_Values;
   type HBinario is array (0 .. 15) of Binary_Values;
   --Tipos usados en los metodos de conversion de numeros
   
end funciones;
