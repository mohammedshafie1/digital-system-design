Library ieee;
use ieee.std_logic_1164.All;
use ieee.std_logic_signed.All;
use ieee.std_logic_arith.All;
Entity PROJECTFINAL IS port(
motor: out std_logic;
sensor: In std_logic;
row_line: out std_logic_vector(3 downto 0):="0111";
col_line: in std_logic_vector(3 downto 0);

sevenseg:out std_logic_vector(0 to 6);
sevenseg2:out std_logic_vector(0 to 6);
sevenseg3:out std_logic_vector(0 to 6);
sevenseg4:out std_logic_vector(0 to 6);
sevenseg5:out std_logic_vector(0 to 6);
sevenseg6:out std_logic_vector(0 to 6);
n : IN STD_LOGIC_VECTOR(1 DOWNTO 0) :="10"
);
end PROJECTFINAL;
 


Architecture arch of PROJECTFINAL Is 
signal c:  std_logic_vector(1 downto 0);
signal e:std_logic_vector(6 downto 0);
signal total :std_logic_vector(1 downto 0);
signal flag:std_logic;
begin
--c<="10";

--e<="0010010";
--sevenseg6<="0010010";



process(col_line)
begin



if col_line="0111" then
 
 flag<='1';
 sevenseg6<="1001111";
 sevenseg5<="1111111";
sevenseg4<="1111111";
sevenseg3<="1111111";
sevenseg2<="1111111";
sevenseg<="1111111";


 end if;
 
 
if col_line="1011" then
 
 sevenseg6<="0000001";
 sevenseg5<="1111111";
sevenseg4<="1111111";
sevenseg3<="1111111";
sevenseg2<="1111111";
sevenseg<="1111111";
 flag<='1';
 
 
 end if;
 
 
 
if col_line="1101" then 
             --e<="0010000";
			    sevenseg6<="0010000";
				 sevenseg5<="0111001";
				 sevenseg4<="0001001";
				 sevenseg3<="0011000";
				 sevenseg2<="1110000";
				 sevenseg<="1000100";
				 flag<='0';
				 
				 
			end if;	 



if col_line="1110" then

sevenseg6<="0010010";
sevenseg5<="1111111";
sevenseg4<="1111111";
sevenseg3<="1111111";
sevenseg2<="1111111";
sevenseg<="1111111";
flag<='0';
end if;












end process;








process(sensor) is
begin

if(flag='1'and sensor='0') then
motor<='1';
end if;


if(flag='1'and sensor='1') then
motor<='0';
end if;

if(flag='0')then motor<='0';end if;



end process;



end arch;