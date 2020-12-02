entity func is
port (x1,x2,x3,x4 : in BIT;
       y1,y2,y3 : out BIT);
end func;
architecture struct_1 of func is
begin
y1<= ((x1 and x3) or (x1 and x2 and x4) or (x2 and x3 and x4) or ((not x1) and x2 and (not x3) and (not x4)));
y2<= (((not x1) and (not x2) and x3) or ((not x1) and x3 and (not x4)) or (x1 and (not x3) and (not x4)) or (x1 and (not x2) and (not x3)) or (x1 and x2 and x3 and x4) or ((not x1) and x2 and (not x3) and x4));
y3<= (((not x2) and x4) or (x1 and x2 and (not x4)) or (x2 and x3 and (not x4)));
end struct_1;                 
