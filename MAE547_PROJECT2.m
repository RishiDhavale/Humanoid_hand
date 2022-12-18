clear all; close all; clc

%% HUMAN HAND initialization
hand = SGparadigmatic;

% Thump
q1 = 0.5; q2 = 0.001; q3 = 0.001; q4 = 0.001;
% Index
q5 = 0.001; q6 = 0; q7 = 0.000; q8 = 0;
% Middle
q9 = 0.001; q10 = 0.0001; q11 = 0.001; q12 = 0.0001;
% Ring
q13 = 0.001; q14 = 0.001; q15 = 0.001; q16 = 0.0001;
% Pinky
q17 = -0.5001; q18 = 0.001; q19 = 0.001; q20 = 0.001;

qm = [q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15 q16 q17 q18 q19 q20]';


set(0,'Units','pixels') 
scnsize = get(0,'ScreenSize');
fig1 = figure(1);


position = get(fig1,'Position');
outerpos = get(fig1,'OuterPosition');
borders = outerpos - position;
edge = -borders(1)/2;
pos1 = [edge,edge,scnsize(3)/2,scnsize(4)+edge];


% plotting hands
figure(1)
SGplotHand(hand);
axis on
grid on
view([-154 12]);
axis([-70 80 20 180 -80 100]);

for j = 1:20
    qq(j,1:20) = linspace(0.000001,qm(j),20);
end

qmm = zeros(20,20);

% to plot the hand movemnt 
for i = 1:20

    qmm(1:20,i) = qq(1:20,i);

    figure(1)
    hand1 = SGmoveHand(hand,qmm(1:20,i));
    SGplotHand(hand1);
    axis on
    grid on
view([-154 -120 100]);
axis([-70 80 20 180 -80 100]);

end


q = zeros(20,20);

% Down is the code for making the option 
while(1) 
    Finger = input('Select a part to make analysis to Or Press 0 to exit\n1:Thumb\n2:Index\n3:Middle\n4:Ring\n5:Pinky\n6:The whole hand\n\n');
    switch Finger
        case 0 
            break;
case 1 
           q(1:4,1:20) = qmm(1:4,1:20);
           [x,y,z] = DK(qmm(1,20),qmm(2,20),qmm(3,20),qmm(4,20),1);
            while(2)
                Type = input('\nSelect the type of analysis  or press 0 to return: \n1:Operational Space \n2:Position \n3:Trace End-effector Trajectory motion \n');
                    switch Type
                         case 0 
                         break;
                        case 1 
                            t1 = linspace(-1.573,1.573,10);
                            t2 = linspace(-pi/2,0.0872665,10);
                            t3 = linspace(-2.1,0,10);
                            t4 = linspace(-pi/4,0,10);
                
                                for i =1:10
                                       for j = 1:10
                                           for o = 1:10
                                               for s = 1:10
                 a1 = 25;
                 a2 = 15;
                 a3 = 10;
                 x0 = -37;
                 y0 = 45;
                x = x0+ a1*cos(t2(j))*sin(t1(i)) - a3*sin(t4(s))*(cos(t2(j))*sin(t1(i))*sin(t3(o)) + cos(t3(o))*sin(t1(i))*sin(t2(j))) - a3*cos(t4(s))*(sin(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t2(j))*cos(t3(o))*sin(t1(i))) + a2*cos(t2(j))*cos(t3(o))*sin(t1(i)) - a2*sin(t1(i))*sin(t2(j))*sin(t3(o));
                y = y0+ a1*cos(t1(i))*cos(t2(j)) - a3*cos(t4(s))*(cos(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t1(i))*cos(t2(j))*cos(t3(o))) - a3*sin(t4(s))*(cos(t1(i))*cos(t2(j))*sin(t3(o)) + cos(t1(i))*cos(t3(o))*sin(t2(j))) + a2*cos(t1(i))*cos(t2(j))*cos(t3(o)) - a2*cos(t1(i))*sin(t2(j))*sin(t3(o));
                z = a1*sin(t2(j)) + a3*cos(t4(s))*(cos(t2(j))*sin(t3(o)) + cos(t3(o))*sin(t2(j))) + a3*sin(t4(s))*(cos(t2(j))*cos(t3(o)) - sin(t2(j))*sin(t3(o))) + a2*cos(t2(j))*sin(t3(o)) + a2*cos(t3(o))*sin(t2(j));
                plot3(x,y,z,'r.','MarkerSize',30)
                hold on
                
                
                                               end
                                           end
                                       end
                                end
                                          
                SGplotHand(hand1);
                hold off
            
                    case 2
                         q(1:4,1:20) = qmm(1:4,1:20);
                         [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),1);
                         x = x(1,20);
                         y = y(1,20);
                         z = z(1,20);
                         fprintf('The end-effector position is (x,y,z) = (%.4f , %.4f , %.4f) \n ',x,y,z)
                    case 3
                        q(1:4,1:20) = qmm(5:8,1:20);
                       [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),1);
                       %x = -1*x;
                       %y = -1*y;
                       %z = -1*z;
                        figure
                        hold on
                        plot3(x,y,z,'-r','LineWidth',2)
                        SGplotHand(hand1);
                        axis on
                        grid on
                        view([-154 -120 100]);
                        axis([-70 80 20 180 -80 100]);
                        hold off
            
                end
            
            
            
                    end
             



case 2 
           q(1:4,1:20) = qmm(5:8,1:20);
           [x,y,z] = DK(qmm(1,20),qmm(2,20),qmm(3,20),qmm(4,20),2);
        while(2)
            Type = input('\nSelect the type of analysis  or press 0 to return: \n1:Operational Space \n2:Position \n3:Trace End-effector Trajectory motion \n');
    switch Type
        case 0 
            break;
        case 1 
            t1 = linspace(-0.523599,0.523599,10);
            t2 = linspace(-pi/2,0.0872665,10);
            t3 = linspace(-2.9,0,10);
            t4 = linspace(-pi/4,0,10);

                for i =1:10
                       for j = 1:10
                           for o = 1:10
                               for s = 1:10
a1 = 37;
a2 = 30;
a3 = 15;

x = -24+ a1*cos(t2(j))*sin(t1(i)) - a3*sin(t4(s))*(cos(t2(j))*sin(t1(i))*sin(t3(o)) + cos(t3(o))*sin(t1(i))*sin(t2(j))) - a3*cos(t4(s))*(sin(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t2(j))*cos(t3(o))*sin(t1(i))) + a2*cos(t2(j))*cos(t3(o))*sin(t1(i)) - a2*sin(t1(i))*sin(t2(j))*sin(t3(o));
y = 73+ a1*cos(t1(i))*cos(t2(j)) - a3*cos(t4(s))*(cos(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t1(i))*cos(t2(j))*cos(t3(o))) - a3*sin(t4(s))*(cos(t1(i))*cos(t2(j))*sin(t3(o)) + cos(t1(i))*cos(t3(o))*sin(t2(j))) + a2*cos(t1(i))*cos(t2(j))*cos(t3(o)) - a2*cos(t1(i))*sin(t2(j))*sin(t3(o));
z = a1*sin(t2(j)) + a3*cos(t4(s))*(cos(t2(j))*sin(t3(o)) + cos(t3(o))*sin(t2(j))) + a3*sin(t4(s))*(cos(t2(j))*cos(t3(o)) - sin(t2(j))*sin(t3(o))) + a2*cos(t2(j))*sin(t3(o)) + a2*cos(t3(o))*sin(t2(j));
plot3(x,y,z,'r.','MarkerSize',30)
hold on


                               end
                           end
                       end
                end
                          
SGplotHand(hand1);
hold off

        case 2
             q(1:4,1:20) = qmm(5:8,1:20);
             [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),2);
             x = x(1,20);
             y = y(1,20);
             z = z(1,20);
             fprintf('The end-effector position is (x,y,z) = (%.4f , %.4f , %.4f) \n ',x,y,z)
        case 3
            q(1:4,1:20) = qmm(5:8,1:20);
           [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),2);
            figure
            hold on
            plot3(x,y,z,'-r','LineWidth',2)
            SGplotHand(hand1);
            axis on
            grid on
            view([-154 -120 100]);
            axis([-70 80 20 180 -80 100]);
            hold off

    end



        end

case 3
           q(1:4,1:20) = qmm(9:12,1:20);
           [x,y,z] = DK(qmm(1,20),qmm(2,20),qmm(3,20),qmm(4,20),3);
        while(2)
            Type = input('\nSelect the type of analysis  or press 0 to return: \n1:Operational Space \n2:Position \n3:Trace End-effector Trajectory motion \n');
    switch Type
        case 0 
            break;
        case 1 
            t1 = linspace(-0.523599,0.523599,10);
            t2 = linspace(-pi/2,0.0872665,10);
            t3 = linspace(-2.9,0,10);
            t4 = linspace(-pi/4,0,10);

                for i =1:10
                       for j = 1:10
                           for o = 1:10
                               for s = 1:10
    a1 = 40;
    a2 = 35;
    a3 = 17;
    x0 = -8;
    y0 = 73;
x = -24+ a1*cos(t2(j))*sin(t1(i)) - a3*sin(t4(s))*(cos(t2(j))*sin(t1(i))*sin(t3(o)) + cos(t3(o))*sin(t1(i))*sin(t2(j))) - a3*cos(t4(s))*(sin(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t2(j))*cos(t3(o))*sin(t1(i))) + a2*cos(t2(j))*cos(t3(o))*sin(t1(i)) - a2*sin(t1(i))*sin(t2(j))*sin(t3(o));
y = 73+ a1*cos(t1(i))*cos(t2(j)) - a3*cos(t4(s))*(cos(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t1(i))*cos(t2(j))*cos(t3(o))) - a3*sin(t4(s))*(cos(t1(i))*cos(t2(j))*sin(t3(o)) + cos(t1(i))*cos(t3(o))*sin(t2(j))) + a2*cos(t1(i))*cos(t2(j))*cos(t3(o)) - a2*cos(t1(i))*sin(t2(j))*sin(t3(o));
z = a1*sin(t2(j)) + a3*cos(t4(s))*(cos(t2(j))*sin(t3(o)) + cos(t3(o))*sin(t2(j))) + a3*sin(t4(s))*(cos(t2(j))*cos(t3(o)) - sin(t2(j))*sin(t3(o))) + a2*cos(t2(j))*sin(t3(o)) + a2*cos(t3(o))*sin(t2(j));
plot3(x,y,z,'r.','MarkerSize',30)
hold on


                               end
                           end
                       end
                end
                          
SGplotHand(hand1);
hold off

        case 2
             q(1:4,1:20) = qmm(9:12,1:20);
             [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),3);
             x = x(1,20);
             y = y(1,20);
             z = z(1,20);
             fprintf('The end-effector position is (x,y,z) = (%.4f , %.4f , %.4f) \n ',x,y,z)
        case 3
           q(1:4,1:20) = qmm(9:12,1:20);
           [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),3);
            figure
            hold on
            plot3(x,y,z,'-r','LineWidth',2)
            SGplotHand(hand1);
            axis on
            grid on
            view([-154 -120 100]);
            axis([-70 80 20 180 -80 100]);
            hold off

    end



        end

case 4
           q(1:4,1:20) = qmm(13:16,1:20);
           [x,y,z] = DK(qmm(1,20),qmm(2,20),qmm(3,20),qmm(4,20),4);
        while(2)
            Type = input('\nSelect the type of analysis  or press 0 to return: \n1:Operational Space \n2:Position \n3:Trace End-effector Trajectory motion \n');
    switch Type
        case 0 
            break;
        case 1 
            t1 = linspace(-0.523599,0.523599,10);
            t2 = linspace(-pi/2,0.0872665,10);
            t3 = linspace(-2.9,0,10);
            t4 = linspace(-pi/4,0,10);

                for i =1:10
                       for j = 1:10
                           for o = 1:10
                               for s = 1:10

    a1 = 37;
    a2 = 30;
    a3 = 15; 
    x0 = 7;
    y0 = 73;

x = -24+ a1*cos(t2(j))*sin(t1(i)) - a3*sin(t4(s))*(cos(t2(j))*sin(t1(i))*sin(t3(o)) + cos(t3(o))*sin(t1(i))*sin(t2(j))) - a3*cos(t4(s))*(sin(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t2(j))*cos(t3(o))*sin(t1(i))) + a2*cos(t2(j))*cos(t3(o))*sin(t1(i)) - a2*sin(t1(i))*sin(t2(j))*sin(t3(o));
y = 73+ a1*cos(t1(i))*cos(t2(j)) - a3*cos(t4(s))*(cos(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t1(i))*cos(t2(j))*cos(t3(o))) - a3*sin(t4(s))*(cos(t1(i))*cos(t2(j))*sin(t3(o)) + cos(t1(i))*cos(t3(o))*sin(t2(j))) + a2*cos(t1(i))*cos(t2(j))*cos(t3(o)) - a2*cos(t1(i))*sin(t2(j))*sin(t3(o));
z = a1*sin(t2(j)) + a3*cos(t4(s))*(cos(t2(j))*sin(t3(o)) + cos(t3(o))*sin(t2(j))) + a3*sin(t4(s))*(cos(t2(j))*cos(t3(o)) - sin(t2(j))*sin(t3(o))) + a2*cos(t2(j))*sin(t3(o)) + a2*cos(t3(o))*sin(t2(j));
plot3(x,y,z,'r.','MarkerSize',30)
hold on


                               end
                           end
                       end
                end
                          
SGplotHand(hand1);
hold off

        case 2
             q(1:4,1:20) = qmm(13:16,1:20);
             [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),4);
             x = x(1,20);
             y = y(1,20);
             z = z(1,20);
             fprintf('The end-effector position is (x,y,z) = (%.4f , %.4f , %.4f) \n ',x,y,z)
        case 3
            q(1:4,1:20) = qmm(13:16,1:20);
           [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),4);
           %x = -1*x;
           %y = -1*y;
           %z = -1*z;
            figure
            hold on
            plot3(x,y,z,'-r','LineWidth',2)
            SGplotHand(hand1);
            axis on
            grid on
            view([-154 -120 100]);
            axis([-70 80 20 180 -80 100]);
            hold off


    end 
        end


case 5
           q(1:4,1:20) = qmm(17:20,1:20);
           [x,y,z] = DK(qmm(1,20),qmm(2,20),qmm(3,20),qmm(4,20),5);
        while(2)
            Type = input('\nSelect the type of analysis  or press 0 to return: \n1:Operational Space \n2:Position \n3:Trace End-effector Trajectory motion \n');
    switch Type
        case 0 
            break;
        case 1 
            t1 = linspace(-0.523599,0.523599,10);
            t2 = linspace(-pi/2,0.0872665,10);
            t3 = linspace(-2.9,0,10);
            t4 = linspace(-pi/4,0,10);

                for i =1:10
                       for j = 1:10
                           for o = 1:10
                               for s = 1:10

    a1 = 27;
    a2 = 25;
    a3 = 10;
    x0 = 19;
    y0 = 73;


x = x0+ a1*cos(t2(j))*sin(t1(i)) - a3*sin(t4(s))*(cos(t2(j))*sin(t1(i))*sin(t3(o)) + cos(t3(o))*sin(t1(i))*sin(t2(j))) - a3*cos(t4(s))*(sin(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t2(j))*cos(t3(o))*sin(t1(i))) + a2*cos(t2(j))*cos(t3(o))*sin(t1(i)) - a2*sin(t1(i))*sin(t2(j))*sin(t3(o));
y = y0+ a1*cos(t1(i))*cos(t2(j)) - a3*cos(t4(s))*(cos(t1(i))*sin(t2(j))*sin(t3(o)) - cos(t1(i))*cos(t2(j))*cos(t3(o))) - a3*sin(t4(s))*(cos(t1(i))*cos(t2(j))*sin(t3(o)) + cos(t1(i))*cos(t3(o))*sin(t2(j))) + a2*cos(t1(i))*cos(t2(j))*cos(t3(o)) - a2*cos(t1(i))*sin(t2(j))*sin(t3(o));
z = a1*sin(t2(j)) + a3*cos(t4(s))*(cos(t2(j))*sin(t3(o)) + cos(t3(o))*sin(t2(j))) + a3*sin(t4(s))*(cos(t2(j))*cos(t3(o)) - sin(t2(j))*sin(t3(o))) + a2*cos(t2(j))*sin(t3(o)) + a2*cos(t3(o))*sin(t2(j));
plot3(x,y,z,'r.','MarkerSize',30)
hold on


                               end
                           end
                       end
                end
                          
SGplotHand(hand);
hold off

        case 2
             q(1:4,1:20) = qmm(17:20,1:20);
             [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),5);
             x = x(1,20);
             y = y(1,20);
             z = z(1,20);
             fprintf('The end-effector position is (x,y,z) = (%.4f , %.4f , %.4f) \n ',x,y,z)
        case 3
            q(1:4,1:20) = qmm(17:20,1:20);
           [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20),5);
            figure
            hold on
            plot3(x,y,z,'-r','LineWidth',2)
            SGplotHand(hand1);
            axis on
            grid on
            view([-154 -120 100]);
            axis([-70 80 20 180 -80 100]);
            hold off

    end
end
        case 6
              while(2)
            Type = input('Select the type of analysis 1:Position of every finger 2:Trace End-effector Trajectory motion of every finger: ');
                switch Type
        case 0 
            break;
                    case 1
             q(1:4,1:20) = qmm(17:20,1:20);
             [x,y,z] = DK(q(1,20),q(2,20),q(3,20),q(4,20));
           [x1,y1,z1] = DK(q(1,20),q(2,20),q(3,20),q(4,20),1);
           [x2,y2,z2] = DK(q(5,20),q(6,20),q(7,20),q(8,20),2);
           [x3,y3,z3] = DK(q(9,20),q(10,20),q(11,20),q(12,20),3);
           [x4,y4,z4] = DK(q(13,20),q(14,20),q(15,20),q(16,20),4);
           [x5,y5,z5] = DK(q(17,20),q(18,20),q(19,20),q(20,20),5);
             fprintf('The end-effector position in (x,y,z) is \nThumb: (%.4f , %.4f , %.4f) \nIndex: (%.4f , %.4f , %.4f) \nMiddle: (%.4f , %.4f , %.4f) \nRing: (%.4f , %.4f , %.4f) \nPinky: (%.4f , %.4f , %.4f) \n\n ',x1(1,20),y1(1,20),z1(1,20),x2(1,20),y2(1,20),z2(1,20),x3(1,20),y3(1,20),z3(1,20),x4(1,20),y4(1,20),z4(1,20),x5(1,20),y5(1,20),z5(1,20))
        case 2
            q(1:20,1:20) = qmm(1:20,1:20);
           [x1,y1,z1] = DK(q(1,20),q(2,20),q(3,20),q(4,20),1);
           [x2,y2,z2] = DK(q(5,20),q(6,20),q(7,20),q(8,20),2);
           [x3,y3,z3] = DK(q(9,20),q(10,20),q(11,20),q(12,20),3);
           [x4,y4,z4] = DK(q(13,20),q(14,20),q(15,20),q(16,20),4);
           [x5,y5,z5] = DK(q(17,20),q(18,20),q(19,20),q(20,20),5);
            figure
            hold on
            plot3(x1,y1,z1,'-r','LineWidth',2)
            plot3(x2,y2,z2,'-blue','LineWidth',2)
            plot3(x3,y3,z3,'-r','LineWidth',2)
            plot3(x4,y4,z4,'-blue','LineWidth',2)
            plot3(x5,y5,z5,'-red','LineWidth',2)
            SGplotHand(hand1);
            axis on
            grid on
            view([-154 -120 100]);
            axis([-70 80 20 180 -80 100]);
            hold off
                end
              end
    end
end

