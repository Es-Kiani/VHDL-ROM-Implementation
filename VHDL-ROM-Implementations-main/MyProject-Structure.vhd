----------------------------------------------------------------------
---- Programmer:	Esfandiar Kiani								  ----
---- Date:			2023-01-13									  ----
---- Institution:	ShBU										  ----
---- Instructor:	Mr. Tabei							          ----
---- Course:		VHDL - Final Project - Phase 2		 		  ----
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
	    address	: in 	std_logic_vector((AddressLength - 1) 	downto 0);
	    data	: out 	std_logic_vector((WordLength    - 1) 	downto 0)
	);
end ROM;

-- Esfandiar Kiani - VHDL Course Final Project
 
architecture Structure of ROM is
	component dec
		port (
			addrss	:	in 	std_logic_vector((AddressLength-1) 	downto 0);
			D	  	: 	out	std_logic_vector((WordCount-1)     	downto 0)
			);
	end component;
	
	component ORc
		port (
			input	:	in 	std_logic_vector((WordCount-1) 	   	downto 0);
			output	:	out	std_logic
			);
	end component;	
	
	signal conector : 		std_logic_vector((WordCount-1)     	downto 0);	
	
	begin
	
		DEC:	dec port map(addrss => address, D => conector);	
		Data0:	ORc port map(conector(1), conector(2), conector(4), conector(5), conector(7), conector(8), conector(9), conector(10), conector(11), conector(12), conector(13), conector(17), conector(19), conector(21), conector(22), conector(23), conector(25), conector(26), conector(27), conector(28), conector(29), conector(30), data(0));
		Data1:	ORc port map(conector(1), conector(2), conector(3), conector(4), conector(7), conector(14), conector(15), conector(18), conector(19), conector(20), conector(23), conector(24), conector(25), conector(30), conector(31), data(1));
		Data2:	ORc port map(conector(2), conector(3), conector(4), conector(9), conector(10), conector(15), conector(20), conector(22), conector(23), conector(25), conector(27), conector(29), data(2));
		Data3:	ORc port map(conector(2), conector(4), conector(7), conector(8), conector(10), conector(14), conector(17), conector(18), conector(22), conector(26), conector(30), conector(31), data(3));
		Data4:	ORc port map(conector(0), conector(2), conector(3), conector(5), conector(7), conector(8), conector(9), conector(10), conector(11), conector(13), conector(14), conector(15), conector(20), conector(22), conector(25), conector(28), data(4));
		Data5:	ORc port map(conector(0), conector(1), conector(6), conector(8), conector(15), conector(17), conector(21), conector(22), conector(23), conector(25), conector(28), conector(30), conector(31), data(5));
		Data6:	ORc port map(conector(0), conector(3), conector(5), conector(9), conector(10), conector(12), conector(15), conector(17), conector(20), conector(22), conector(23), conector(24), conector(25), conector(26), conector(31), data(6));
		Data7:	ORc port map(conector(1), conector(3), conector(5), conector(9), conector(10), conector(12), conector(16), conector(23), conector(25), conector(28), conector(29), data(7));
 			  

end Structure;									  

-- Esfandiar Kiani - VHDL Course Final Project