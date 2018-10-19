package body funciones with SPARK_Mode is
   
--     function BintoHex32 (n1 : Binario) return String is
--        res : String (1 .. 8);
--        pos : Integer := 3;
--        num : Integer := 0;
--        StringPos : Integer := 1;
--     begin
--  
--        while pos <= 31 loop
--  
--           num := n1(pos-3)*8 + n1(pos-2)*4 + n1(pos-1)*2 + n1(pos)*1;
--  
--           pos := pos + 4;
--  
--           case num is
--              when 0 => res(StringPos) := '0';
--              when 1 => res(StringPos) := '1';
--              when 2 => res(StringPos) := '2';
--              when 3 => res(StringPos) := '3';
--              when 4 => res(StringPos) := '4';
--              when 5 => res(StringPos) := '5';
--              when 6 => res(StringPos) := '6';
--              when 7 => res(StringPos) := '7';
--              when 8 => res(StringPos) := '8';
--              when 9 => res(StringPos) := '9';
--              when 10 => res(StringPos) := 'A';
--              when 11 => res(StringPos) := 'B';
--              when 12 => res(StringPos) := 'C';
--              when 13 => res(StringPos) := 'D';
--              when 14 => res(StringPos) := 'E';
--              when 15 => res(StringPos) := 'F';
--  
--              when others => res(StringPos) := 'M';
--                 
--           end case;
--           
--           StringPos := StringPos+1;
--        end loop;
--  
--        return res;
--     end BinToHex32;
--  
--     function Hex32toBin (n1 : String) return Binario is
--        
--        --Variables
--        res : Binario;
--        pos : Integer := 0;
--        StringPos : Integer := 1;
--        
--     begin
--        
--        while StringPos <= 8 loop
--           
--           case n1(StringPos) is
--              when '0' => res(pos) := 0; res(pos+1) := 0; res(pos+2) := 0; res(pos+3) := 0;
--              when '1' => res(pos) := 0; res(pos+1) := 0; res(pos+2) := 0; res(pos+3) := 1;
--              when '2' => res(pos) := 0; res(pos+1) := 0; res(pos+2) := 1; res(pos+3) := 0;
--              when '3' => res(pos) := 0; res(pos+1) := 0; res(pos+2) := 1; res(pos+3) := 1;
--              when '4' => res(pos) := 0; res(pos+1) := 1; res(pos+2) := 0; res(pos+3) := 0;
--              when '5' => res(pos) := 0; res(pos+1) := 1; res(pos+2) := 0; res(pos+3) := 1;
--              when '6' => res(pos) := 0; res(pos+1) := 1; res(pos+2) := 1; res(pos+3) := 0;
--              when '7' => res(pos) := 0; res(pos+1) := 1; res(pos+2) := 1; res(pos+3) := 1;
--              when '8' => res(pos) := 1; res(pos+1) := 0; res(pos+2) := 0; res(pos+3) := 0;
--              when '9' => res(pos) := 1; res(pos+1) := 0; res(pos+2) := 0; res(pos+3) := 1;
--              when 'A' => res(pos) := 1; res(pos+1) := 0; res(pos+2) := 1; res(pos+3) := 0;
--              when 'B' => res(pos) := 1; res(pos+1) := 0; res(pos+2) := 1; res(pos+3) := 1;
--              when 'C' => res(pos) := 1; res(pos+1) := 1; res(pos+2) := 0; res(pos+3) := 0;
--              when 'D' => res(pos) := 1; res(pos+1) := 1; res(pos+2) := 0; res(pos+3) := 1;
--              when 'E' => res(pos) := 1; res(pos+1) := 1; res(pos+2) := 1; res(pos+3) := 0;
--              when 'F' => res(pos) := 1; res(pos+1) := 1; res(pos+2) := 1; res(pos+3) := 1;
--                 
--              when others => res(pos) := 0;
--           end case;
--  
--  
--           pos := pos + 4;
--           StringPos := StringPos + 1;
--         
--        end loop;
--        
--        return res;
--     end Hex32toBin;
   
   function DectoBin (n1 : Integer) return HBinario is
      
      -- Variables
      res : HBinario;
      pos : Integer := 15;
      temp : Integer := n1;
      
   begin
      
      -- Inicializamos res
      res := (others => 0);
      
      while pos >= 0 loop
         if temp rem 2 = 0 then
            res(pos) := 0;
         elsif temp rem 2 = 1 then
            res(pos) := 1;
         elsif temp = 1 then
            res(pos) := 1;
            temp := 0;
         end if;
         
         temp := temp / 2;
         pos := pos - 1;
         
         pragma Loop_Variant (Decreases => pos);
         pragma Loop_Invariant (pos in 0 .. 15);
         pragma Loop_Invariant ((for all a in reverse 0 .. pos => res(a) <= 0 or res(a) <= 1));
         pragma Loop_Invariant (temp in 0 .. n1);
      end loop;
      
      return res;      
   end DectoBin;
   
--     function BintoDec (n1 : HBinario) return Integer is
--        
--        --Variables
--        res : Integer := 0;
--        pos : Integer := 0;
--        exp : Integer := 15;
--        temp : Integer := 0;
--     begin
--        
--        while pos <= 15 loop
--           
--           res := res + n1(pos) * 2**exp;
--           pos := pos + 1;
--           exp := exp - 1;
--        
--        end loop;
--           
--        return res; 
--     end BintoDec;
--     
   function DectoHex16 (n1 : Integer) return String is
      
      -- Variables
      res : String (1..4);
      pos : Integer := 4;
      temp : Integer := n1;
      let : Character;
      
   begin
      
      -- Inicializamos res
      res := (others => '0');
      
      while pos >= 1 loop
         
         case temp rem 16 is
            when 0 => let := '0';
            when 1 => let := '1';
            when 2 => let := '2';
            when 3 => let := '3';
            when 4 => let := '4';
            when 5 => let := '5';
            when 6 => let := '6';
            when 7 => let := '7';
            when 8 => let := '8';
            when 9 => let := '9';
            when 10 => let := 'A';
            when 11 => let := 'B';
            when 12 => let := 'C';
            when 13 => let := 'D';
            when 14 => let := 'E';
            when 15 => let := 'F';
               
            when others => let := '0';
         end case;
         
         res(pos) := let;
         
         if temp < 16 then
            temp := 0;
         end if;
         
         temp := temp / 16;
         pos := pos - 1;
         
         pragma Loop_Variant (Decreases => pos);
         pragma Loop_Invariant (pos in 1 .. 4);
         pragma Loop_Invariant (temp in 0 .. n1);
         pragma Loop_Invariant (for some x in reverse hex'Range => res(pos) <= hex(x));
         
      end loop;
      
      return res;  
   end DectoHex16;
--     
--     function Hex16toDec (n1 : String) return Integer is
--        
--        -- Variables
--        res : Integer := 0;
--        StringPos : Integer := 1;
--        exp : Integer := 3;
--        num : Integer := 0;
--        
--     begin
--        
--        while StringPos <= 4 loop
--           
--           case n1(StringPos) is
--              when '0' => num := 0;
--              when '1' => num := 1;
--              when '2' => num := 2;
--              when '3' => num := 3;
--              when '4' => num := 4;
--              when '5' => num := 5;
--              when '6' => num := 6;
--              when '7' => num := 7;
--              when '8' => num := 8;
--              when '9' => num := 9;
--              when 'A' => num := 10;
--              when 'B' => num := 11;
--              when 'C' => num := 12;
--              when 'D' => num := 13;
--              when 'E' => num := 14;
--              when 'F' => num := 15;
--                 
--              when others => num := 0;
--           end case;
--           
--           res := res + num * 16**exp;
--           StringPos := StringPos + 1;
--           exp := exp - 1;
--        end loop;
--        
--        return res;
--     end Hex16toDec;
   
end funciones;
