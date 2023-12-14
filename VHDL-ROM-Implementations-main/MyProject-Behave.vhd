----------------------------------------------------------------------
---- Programmer:	Esfandiar Kiani								  ----
---- Date:			2023-01-12									  ----
---- Institution:	ShBU										  ----
---- Instructor:	Mr. Tabei							          ----
---- Course:		VHDL - Final Project				 		  ----
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity ROM is
	generic(						
	-- ROM 32x8
	    AddressLength: NATURAL := 5;
	    WordLength	 : NATURAL := 8;
		WordCount	 : NATURAL := 2**5		-- 2^AddressLength 
	);
	
	port(
	    CLK		: in 	std_logic;
	    enable	: in 	std_logic;
	    address	: in 	std_logic_vector((AddressLength - 1) downto 0);
	    data	: out 	std_logic_vector((WordLength    - 1) downto 0)
	);
end ROM;

-- Esfandiar Kiani - VHDL Course Final Project
 
architecture Behave of ROM is
	type ROM_TYPE is array (0 to (WordCount-1)) of std_logic_vector((WordLength - 1) downto 0);
	constant HighImpedance : std_logic_vector((WordLength-1) downto 0) := (others => 'Z');	
    constant memory: ROM_TYPE:=
    (	"01110000",
		"10100011",
		"00011111",
		"11010110",
		"00001111",
		"11010001",
		"00100000",
		"00011011",
		"00111001",
		"11010101",
		"11011101",
		"00010001",
		"11000001",
		"00010001",
		"00011010",
		"01110110",
		"10000000",
		"01101001",
		"00001010",
		"00000011",
		"01010110",
		"00100001",
		"01111101",
		"11100111",
		"01000010",
		"11110111",
		"01001001",
		"00000101",
		"10110001",
		"10000101",
		"00101011",
		"01101010" );
		
	begin
		 
	process(CLK) is
	begin
		if	rising_edge(CLK)	then
			if enable = '0' then
				data <= HighImpedance;
			else
				data <= memory(to_integer(unsigned(address)));
			end if;
			
	    end if;
	end process;
 
end Behave;									  

-- Esfandiar Kiani - VHDL Course Final Project