library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
entity music is
  port( inclk ,enable     :  in      std_logic;        --Clock Signal
        spk      :  buffer  std_logic);       --speaker driver
end  music ;
--------------------------------------------------------------------
architecture behave of  music  is
  signal tone        :  std_logic_vector(10 downto 0);
  signal tone_count  :  std_logic_vector(10 downto 0);
  signal tone_index  :  integer range 0 to 15;
  signal clk10_count :  std_logic_vector(17 downto 0);
  signal time        :  integer range 0 to 150;
  signal clk         :  std_logic;
  signal clk10       :  std_logic;
  begin
    PROCESS(inclk)  --generate 2Mhz clock signal
     variable cnt1 : INTEGER RANGE 0 TO 29; 
    BEGIN 
      IF inclk='1' AND inclk'event THEN 
          IF cnt1=29 THEN cnt1:=0; 
            ELSE 
             IF cnt1<20 THEN clk<='1'; 
                ELSE clk<='0'; 
             END IF; 
            cnt1:=cnt1+1; 
         END IF; 
      END IF; 
   END PROCESS; 

process(clk)  --generate 10hz clock signal
    begin
      if(clk'event and clk='1') then
        clk10_count<=clk10_count+1;
        if(clk10_count=16#3fff#) then
           clk10<=not clk10;
        end if;
      end if;
  end process;
  process(clk10) 
    begin
      if(clk10'event and clk10='1') then
        if(time=150) then
           time<=0;
        else
           time<=time+1;
        end if;
      end if;
  end process;
  process(clk10) 
    begin
      if(clk10'event and clk10='1') then
		if enable = '1' then
        case time is
          when 0=>tone_index<=6;
          when 1=>tone_index<=9;
          when 2=>tone_index<=6;
          when 3=>tone_index<=9;--
          when 4=>tone_index<=4;
          when 5=>tone_index<=7;
          when 6=>tone_index<=4;
          when 7=>tone_index<=7;--
          when 8=>tone_index<=5;
          when 9=>tone_index<=8;
          when 10=>tone_index<=5;
          when 11=>tone_index<=8;--
          when 12=>tone_index<=7;
          when 13=>tone_index<=5;
          when 14=>tone_index<=14;
          when 15=>tone_index<=6;--
          when 16=>tone_index<=9;
          when 17=>tone_index<=6;
          when 18=>tone_index<=9;
          when 19=>tone_index<=4;--
          when 20=>tone_index<=7;
          when 21=>tone_index<=4;
          when 22=>tone_index<=7;
          when 23=>tone_index<=5;--
          when 24=>tone_index<=8;
          when 25=>tone_index<=5;
          when 26=>tone_index<=8;---------------
          when 27=>tone_index<=7;--
          when 28=>tone_index<=5;
          when 29=>tone_index<=7;
          when 30=>tone_index<=8;
          when 31=>tone_index<=9;--
          when 32=>tone_index<=8;
          when 33=>tone_index<=7;
          when 34=>tone_index<=7;
          when 35=>tone_index<=7;--
          when 36=>tone_index<=0;
          when 37=>tone_index<=5;
          when 38=>tone_index<=7;
          when 39=>tone_index<=8;--
          when 40=>tone_index<=9;
          when 41=>tone_index<=8;
          when 42=>tone_index<=7;
          when 43=>tone_index<=8;--
          when 44=>tone_index<=8;
          when 45=>tone_index<=9;
          when 46=>tone_index<=9;
          when 47=>tone_index<=9;--
          when 48=>tone_index<=3;
          when 49=>tone_index<=3;
          when 50=>tone_index<=8;
          when 51=>tone_index<=8;--
          when 52=>tone_index<=6;
          when 53=>tone_index<=5;
          when 54=>tone_index<=6;
          when 55=>tone_index<=8;--
          when 56=>tone_index<=5;
          when 57=>tone_index<=5;
          when 58=>tone_index<=5;
          when 59=>tone_index<=5;--
          when 60=>tone_index<=5;
          when 61=>tone_index<=5;
          when 62=>tone_index<=0;
          when 63=>tone_index<=0;----
          when 64=>tone_index<=10;
          when 65=>tone_index<=10;
          when 66=>tone_index<=10;
          when 67=>tone_index<=12;--
          when 68=>tone_index<=7;
          when 69=>tone_index<=7;
          when 70=>tone_index<=9;
          when 71=>tone_index<=9;--
          when 72=>tone_index<=6;
          when 73=>tone_index<=8;
          when 74=>tone_index<=5;
          when 75=>tone_index<=5;--
          when 76=>tone_index<=5;
          when 77=>tone_index<=5;
          when 78=>tone_index<=5;
          when 79=>tone_index<=5;--
          when 80=>tone_index<=5;
          when 81=>tone_index<=0;
          when 82=>tone_index<=0;
          when 83=>tone_index<=3;--
          when 84=>tone_index<=5;
          when 85=>tone_index<=3;
          when 86=>tone_index<=5;
          when 87=>tone_index<=5;--
          when 88=>tone_index<=6;
          when 89=>tone_index<=7;
          when 90=>tone_index<=9;
          when 91=>tone_index<=6;--
          when 92=>tone_index<=6;
          when 93=>tone_index<=6;
          when 94=>tone_index<=6;
          when 95=>tone_index<=6;--
          when 96=>tone_index<=6;
          when 97=>tone_index<=5;
          when 98=>tone_index<=6;
          when 99=>tone_index<=8;--
          when 100=>tone_index<=8;
          when 101=>tone_index<=8;
          when 102=>tone_index<=9;
          when 103=>tone_index<=12;--
          when 104=>tone_index<=12;
          when 105=>tone_index<=12;
          when 106=>tone_index<=10;
          when 107=>tone_index<=9;--
          when 108=>tone_index<=9;
          when 109=>tone_index<=10;
          when 110=>tone_index<=9;
          when 111=>tone_index<=8;--
          when 112=>tone_index<=8;
          when 113=>tone_index<=6;
          when 114=>tone_index<=5;
          when 115=>tone_index<=3;--
          when 116=>tone_index<=3;
          when 117=>tone_index<=3;
          when 118=>tone_index<=3;
          when 119=>tone_index<=8;--
          when 120=>tone_index<=8;
          when 121=>tone_index<=8;
          when 122=>tone_index<=8;
          when 123=>tone_index<=6;--
          when 124=>tone_index<=8;
          when 125=>tone_index<=6;
          when 126=>tone_index<=5;
          when 127=>tone_index<=3;--
          when 128=>tone_index<=5;
          when 129=>tone_index<=6;
          when 130=>tone_index<=8;
          when 131=>tone_index<=5;--
          when 132=>tone_index<=5;
          when 133=>tone_index<=5;
          when 134=>tone_index<=5;
          when 135=>tone_index<=5;--
          when 136=>tone_index<=5;
          when 137=>tone_index<=5;
          when 138=>tone_index<=0;
          when 139=>tone_index<=0;--
          when others=>tone_index<=0;
        end case;
      end if;
		end if;
  end process;
  process(tone_index)
    begin
      case tone_index is
         when 0=>tone<="11111111111";   --no output
         when 1=>tone<="01100000101";   --773
         when 2=>tone<="01110010000";   --912
         when 3=>tone<="10000001100";   --1036
         when 5=>tone<="10010101101";   --1197
         when 6=>tone<="10100001010";   --1290
         when 7=>tone<="10101011100";   --1372
         when 8=>tone<="10110000010";   --1410
         when 9=>tone<="10111001000";   --1480
         when 10=>tone<="11000000110";  --1542
         when 12=>tone<="11001010110";  --1622
         when 13=>tone<="11010000100";  --1668
         when 15=>tone<="11011000000";  --1728
         when others=>tone<="11111111111"; --others:no output  
      end case;
  end process;
  process(clk) --control the frequence of the speaker
    begin
      if(clk'event and clk='1') then
         if(tone_count=16#7ff#) then
            tone_count<=tone;
            if(tone<2047) then
               spk<=not spk;
            end if;
         else
            tone_count<=tone_count+1;
         end if;
      end if;
  end process;
end behave;