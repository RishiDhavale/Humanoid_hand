
function [x,y,z] = DK(t1,t2,t3,t4,f)

t1 = -1*t1;
t2 = -1*t2;
t3 = -1*t3;
t4 = -1*t4;

if f == 1
     a1 = 25;
     a2 = 15;
     a3 = 10;
     x0 = -37;
     y0 = 45;
elseif f == 2
    a1 = 37;
    a2 = 30;
    a3 = 15;
    x0 = -24;
    y0 = 73;
elseif f  == 3
    a1 = 40;
    a2 = 35;
    a3 = 17;
    x0 = -8;
    y0 = 73;
elseif f == 4
    a1 = 37;
    a2 = 30;
    a3 = 15; 
    x0 = 7;
    y0 = 73;
elseif f == 5
    a1 = 27;
    a2 = 25;
    a3 = 10;
    x0 = 19;
    y0 = 73;
end



t1 = linspace(0,t1,20);
t2 = linspace(0,t2,20);
t3 = linspace(0,t3,20);
t4 = linspace(0,t4,20);


for i = 1:20
A01 = [cos(t1(i)) -sin(t1(i)) 0 0;sin(t1(i)) cos(t1(i)) 0 0; 0 0 1 0; 0 0 0 1]*[1 0 0 0; 0 0 -1 0; 0 1 0 0; 0 0 0 1];
A12 = [cos(t2(i)) -sin(t2(i)) 0 a1*cos(t2(i));sin(t2(i)) cos(t2(i)) 0 a1*sin(t2(i)); 0 0 1 0; 0 0 0 1];
A23 = [cos(t3(i)) -sin(t3(i)) 0 0;sin(t3(i)) cos(t3(i)) 0 0; 0 0 1 0; 0 0 0 1]*[1 0 0 a2; 0 cos(0) -sin(0) 0; 0 sin(0) cos(0) 0; 0 0 0 1];
A34 = [cos(t4(i)) -sin(t4(i)) 0 a3*cos(t4(i));sin(t4(i)) cos(t4(i)) 0 a3*sin(t4(i)); 0 0 1 0; 0 0 0 1];
Teb = A01*A12*A23*A34;

x(i) = x0 + Teb(2,4);
y(i) = y0 + Teb(1,4);
z(i)  =  Teb(3,4);

end
