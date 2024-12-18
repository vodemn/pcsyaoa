entity Test_func is end Test_func;
architecture Behavior of test_func is
component func 
port (x1,x2,x3,x4 : in BIT;
       y1,y2,y3 : out BIT);
end component;
signal  x1, x2, x3, x4 :  BIT;
signal  y1, y2, y3 : BIT;
begin
p1 : func port map (x1 => x1, x2 => x2, x3 => x3, x4 => x4, y1 => y1, y2 => y2, y3 => y3);

x1 <=	'0',
	'0'	after 50ns,
	'0'	after 100ns,
	'0'	after 150ns,
	'0'	after 200ns,
	'0'	after 250ns,
	'0'	after 300ns,
	'0'	after 350ns,
	'1'	after 400ns,
	'1'	after 450ns,
	'1'	after 500ns,
	'1'	after 550ns,
	'1'	after 600ns,
	'1'	after 650ns,
	'1'	after 700ns,
	'1'	after 750ns;
x2 <=	'0',
	'0'	after 50ns,
	'0'	after 100ns,
	'0'	after 150ns,
	'1'	after 200ns,
	'1'	after 250ns,
	'1'	after 300ns,
	'1'	after 350ns,
	'0'	after 400ns,
	'0'	after 450ns,
	'0'	after 500ns,
	'0'	after 550ns,
	'1'	after 600ns,
	'1'	after 650ns,
	'1'	after 700ns,
	'1'	after 750ns;
x3 <=	'0',
	'0'	after 50ns,
	'1'	after 100ns,
	'1'	after 150ns,
	'0'	after 200ns,
	'0'	after 250ns,
	'1'	after 300ns,
	'1'	after 350ns,
	'0'	after 400ns,
	'0'	after 450ns,
	'1'	after 500ns,
	'1'	after 550ns,
	'0'	after 600ns,
	'0'	after 650ns,
	'1'	after 700ns,
	'1'	after 750ns;
x4 <=	'0',
	'1'	after 50ns,
	'0'	after 100ns,
	'1'	after 150ns,
	'0'	after 200ns,
	'1'	after 250ns,
	'0'	after 300ns,
	'1'	after 350ns,
	'0'	after 400ns,
	'1'	after 450ns,
	'0'	after 500ns,
	'1'	after 550ns,
	'0'	after 600ns,
	'1'	after 650ns,
	'0'	after 700ns,
	'1'	after 750ns;
end behavior;
