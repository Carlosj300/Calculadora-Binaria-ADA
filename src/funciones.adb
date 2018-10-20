package body funciones with SPARK_Mode is

   function BintoHex32 (n1 : Binario) return String is
      res : String (1 .. 8);
      pos : Integer := 3;
      num : Integer;
      StringPos : Integer := 1;
   begin
      res := ('0','0','0','0','0','0','0','0', others => '0');
      while pos <= 31 loop

         num := n1(pos-3)*8 + n1(pos-2)*4 + n1(pos-1)*2 + n1(pos)*1;

         pos := pos + 4;
         case num is
            when 0 => res(StringPos) := '0';
            when 1 => res(StringPos) := '1';
            when 2 => res(StringPos) := '2';
            when 3 => res(StringPos) := '3';
            when 4 => res(StringPos) := '4';
            when 5 => res(StringPos) := '5';
            when 6 => res(StringPos) := '6';
            when 7 => res(StringPos) := '7';
            when 8 => res(StringPos) := '8';
            when 9 => res(StringPos) := '9';
            when 10 => res(StringPos) := 'A';
            when 11 => res(StringPos) := 'B';
            when 12 => res(StringPos) := 'C';
            when 13 => res(StringPos) := 'D';
            when 14 => res(StringPos) := 'E';
            when 15 => res(StringPos) := 'F';

            when others => res(StringPos) := 'M';
               
            end case;
         
         if StringPos < 8 then
            StringPos := StringPos+1;
         end if;
            
         pragma Loop_Variant(Increases => pos);
         pragma Loop_Invariant(pos in 3..35);
         pragma Loop_Invariant(StringPos in 1..8);
         pragma Loop_Invariant(num in 0..15);
         pragma Loop_Invariant(StringPos in res'Range);
      end loop;

      return res;
   end BinToHex32;
   
   function Hex32toBin (n1 : String) return Binario is
      
      --Variables
      res : Binario:= (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      pos : Integer := 0;
      StringPos : Integer := n1'First;
      loopOut : Integer := 1;
      
   begin
      
      while loopOut <= 8 loop
         
         case n1(StringPos) is
            when '0' => res(pos) := 0; res(pos+1) := 0; res(pos+2) := 0; res(pos+3) := 0;
            when '1' => res(pos) := 0; res(pos+1) := 0; res(pos+2) := 0; res(pos+3) := 1;
            when '2' => res(pos) := 0; res(pos+1) := 0; res(pos+2) := 1; res(pos+3) := 0;
            when '3' => res(pos) := 0; res(pos+1) := 0; res(pos+2) := 1; res(pos+3) := 1;
            when '4' => res(pos) := 0; res(pos+1) := 1; res(pos+2) := 0; res(pos+3) := 0;
            when '5' => res(pos) := 0; res(pos+1) := 1; res(pos+2) := 0; res(pos+3) := 1;
            when '6' => res(pos) := 0; res(pos+1) := 1; res(pos+2) := 1; res(pos+3) := 0;
            when '7' => res(pos) := 0; res(pos+1) := 1; res(pos+2) := 1; res(pos+3) := 1;
            when '8' => res(pos) := 1; res(pos+1) := 0; res(pos+2) := 0; res(pos+3) := 0;
            when '9' => res(pos) := 1; res(pos+1) := 0; res(pos+2) := 0; res(pos+3) := 1;
            when 'A' => res(pos) := 1; res(pos+1) := 0; res(pos+2) := 1; res(pos+3) := 0;
            when 'B' => res(pos) := 1; res(pos+1) := 0; res(pos+2) := 1; res(pos+3) := 1;
            when 'C' => res(pos) := 1; res(pos+1) := 1; res(pos+2) := 0; res(pos+3) := 0;
            when 'D' => res(pos) := 1; res(pos+1) := 1; res(pos+2) := 0; res(pos+3) := 1;
            when 'E' => res(pos) := 1; res(pos+1) := 1; res(pos+2) := 1; res(pos+3) := 0;
            when 'F' => res(pos) := 1; res(pos+1) := 1; res(pos+2) := 1; res(pos+3) := 1;
               
            when others => res(pos) := 0;
         end case;

         if pos rem 4 = 0 then
            if pos < 28 then
               pos := pos + 4;
            end if;
         end if;
         if StringPos < n1'Last then
            StringPos := StringPos + 1;
         end if;
         
         loopOut := loopOut+1;
         pragma Loop_Variant(Increases => loopOut);
         pragma Loop_Invariant(pos in 0..28);
         pragma Loop_Invariant(StringPos in n1'First..n1'Last);
         pragma Loop_Invariant(n1'Last - n1'First = 7);
         
      end loop;
      
      return res;
   end Hex32toBin;
   
   function DectoHex16 (n1 : Integer) return String is
      
      -- Variables
      res : String (1..4) := (others => '0');
      pos : Integer := 4;
      temp : Integer := n1;
      let : Character;
      counter : Integer := 4;
      
   begin
      
      while counter >= 1 loop
         
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
         
         if pos > 1 then
            pos := pos - 1;
         end if;
         
         if counter >= 1 then
            counter := counter -1;
         end if;
         
         pragma Loop_Invariant (counter in 0..4);
         pragma Loop_Variant(Decreases => counter);
         pragma Loop_Invariant(pos in 1..4);
         pragma Loop_Invariant(n1 >= 0);
         pragma Loop_Invariant (let = '0' or let = '1' or let = '2' or let = '3' or let = '4' or let = '5' or let = '6' or
                                  let = '7' or let = '8' or let = '9' or let = 'A' or let = 'B' or let = 'C' or let = 'D' or
                                    let = 'E' or let = 'F');
         
      end loop;
      
      return res;  
   end DectoHex16;   
   
end funciones;
