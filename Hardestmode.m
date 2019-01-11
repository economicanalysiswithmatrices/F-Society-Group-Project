function Hardestmode()
%Creates figure for game.
fig1 = figure('menubar','none','KeyPressFcn',@presskeys,'position', [500 90 1000 900],'closereq', @Closefig);

%Figure Boundary limits.
xlim([0 10])
ylim([0 8])

%Start grass.
rectangle('position',[0 -0.1 10 1],'facecolor',[0 0.5,0])

%Road Lanes.
rectangle('position',[0 0.9 10 1.1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3.9 10 1.1],'facecolor','k')
rectangle('position',[0 5 10 1],'facecolor','k')
rectangle('position',[0 6 10 1],'facecolor','k')

%Middle grass.
rectangle('position',[0 3 10 0.9],'facecolor',[0 0.8,0])

%Grass is always greener.
rectangle('position',[0 7 10 1],'facecolor','g')


%%Road markers%%
%First 3 markers.
rectangle('position',[-1 1.45 2 0.1],'facecolor','y')
rectangle('position',[3 1.45 2 0.1],'facecolor','y')
rectangle('position',[7 1.45 2 0.1],'facecolor','y')

%Second 3 markers.
rectangle('position',[-1 2.45 2 0.1],'facecolor','y')
rectangle('position',[3 2.45 2 0.1],'facecolor','y')
rectangle('position',[7 2.45 2 0.1],'facecolor','y')

%Third 3 markers.
rectangle('position',[-1 4.45 2 0.1],'facecolor','y')
rectangle('position',[3 4.45 2 0.1],'facecolor','y')
rectangle('position',[7 4.45 2 0.1],'facecolor','y')

%4th 3 markers.
rectangle('position',[-1 5.45 2 0.1],'facecolor','y')
rectangle('position',[3 5.45 2 0.1],'facecolor','y')
rectangle('position',[7 5.45 2 0.1],'facecolor','y')

%Last 3 markers.
rectangle('position',[-1 6.45 2 0.1],'facecolor','y')
rectangle('position',[3 6.45 2 0.1],'facecolor','y')
rectangle('position',[7 6.45 2 0.1],'facecolor','y')

%Turn off axis.
axis off

%Gameover flag.
over = 0;

%Creating the Frog, Credit: Gustavo Rodriguez.
xRana = 4.5+ 15.*[0.0 0.4 0.4 0.2 0.4 0.6 0.8 0.6 0.6 1.0 0.8  1.0 0.8 0.7 0.9 0.8 0.9   0.83 0.8 0.7 0.3 0.2   0.16 0.1 0.2 0.1 0.3 0.2 0.0 0.2]/16;
yRana = 15.*[0.0 0.0 0.1 0.4 0.1 0.1 0.4 0.1 0.0 0.0 0.1  0.4 0.5 0.4 0.6 0.8 0.9   0.93 1.0 0.9 0.9 1.0   0.93 0.9 0.8 0.6 0.4 0.5 0.4 0.1]/16;
cow = patch(xRana,yRana,'y','edgecolor','b');

%Searches for initial position of frog on the board.
poscowX = get(cow,'XData');
poscowY = get(cow,'YData');

%http://www.classicgaming.cc/classics/frogger/sounds
[Hop,Hop_fps] = audioread('sound-frogger-hop.wav');
%[Bg, Bg_fps] = audioread('Super Mario Bros (NES) Music - Underground Theme.mp3');
%sound(Bg, Bg_fps);

%%
function presskeys(varargin)              

    %'Switch' case for arrow keys.
    switch varargin{2}.Key
                
        case 'uparrow'                             
            poscowY = poscowY+1; 
            sound(Hop, Hop_fps);

                
        case 'downarrow'
            %Makes sure frog stays inside playing area.
            if poscowY>0                    
                poscowY = poscowY-1;
                sound(Hop, Hop_fps);

            end

        case 'rightarrow'
            %Makes sure frog stays inside playing area.
            %Larger movement per arrow key hit than Hard or Chaos mode.
            if poscowX <9.5                    
                poscowX = poscowX+0.5;
                sound(Hop, Hop_fps);

            end                                             

        case 'leftarrow'
            %Makes sure frog stays inside playing area.
            %Larger movement per arrow key hit than Hard or Chaos mode.
            if poscowX>0                    
                poscowX = poscowX-0.5; 
                sound(Hop, Hop_fps);

            end
    end
    %Sets new Frog position after every arrow key movement.
    set(cow,'Ydata',poscowY,'XData',poscowX);                     
end
%%
%Used for random car colours.
colorarray = {'y','m','c','r','b','g'};
col = length(colorarray);

%Cars. They have fixed colours to begin with.
car(1) = rectangle('position',[3 1 2 0.9],'facecolor', 'g','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(2) = rectangle('position',[6 2 2.5 0.9],'facecolor', 'b','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(3) = rectangle('position',[9 4 2.25 0.9],'facecolor', 'c','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(4) = rectangle('position',[5 4 2.25 0.9],'facecolor', 'r','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(5) = rectangle('position',[15 1 2 0.9],'facecolor', 'c','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(6) = rectangle('position',[1 4 2.25 0.9],'facecolor', 'y','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(7) = rectangle('position',[2 2 2.5 0.9],'facecolor', 'y','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(8) = rectangle('position',[1 5 1 0.9],'facecolor', 'g','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(9) = rectangle('position',[3 5 1 0.9],'facecolor', 'r','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(10) = rectangle('position',[5 5 1 0.9],'facecolor', 'b','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(11) = rectangle('position',[1 6 1.5 0.9],'facecolor', 'c','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(12) = rectangle('position',[6 6 1.5 0.9],'facecolor', 'y','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);


%Random speed of cars upon game startup within a set range of values.
rand1 = 0.03+0.12*rand();
rand2 = 0.03+0.12*rand();
rand3 = 0.03+0.12*rand();
rand4 = 0.1+0.12*rand();
rand5 = 0.03+0.12*rand();

%%
function speed3()
while over==0
    %Sets a fixed refresh rate for the game.
    pause(0.005)
    
    %Get X position of each car every 0.01s.
    carpos1 = get(car(1),'position');
    carpos2 = get(car(2),'position');
    carpos3 = get(car(3),'position');
    carpos4 = get(car(4),'position');
    carpos5 = get(car(5),'position');
    carpos6 = get(car(6),'position');
    carpos7 = get(car(7),'position');
    carpos8 = get(car(8),'position');
    carpos9 = get(car(9),'position');
    carpos10 = get(car(10),'position');
    carpos11 = get(car(11),'position');
    carpos12 = get(car(12),'position');
    
    %Gets Y position of frog for collisions.
    poscowY = get(cow,'YData');
    
    %When frog reaches greener grass.
    if poscowY > 6
        Win()
        break
    end     
    
    %%%%Car 1%%%
    
    %Gets X and Y distance of Frog from Car 1.
    %abs() get modulus of distance.
    Xdist1 = abs((carpos1(1)+carpos1(3)/2)-(poscowX(1)));
    Ydist1 = abs(carpos1(2)-poscowY(1));    
    
    %When car 1 exits the screen.
    if carpos1(1) > 10   
        carpos1(1) = -2;
        randicol = colorarray{randi(col)};
        set(car(1),'position',carpos1,'facecolor',randicol);                 
    
    %Causes car 1 to move every 0.01s.    
    elseif carpos1(1) < 10    
        carpos1(1) = carpos1(1) + rand1;
        set(car(1),'position',carpos1);
    end
    
    %If there is a collision.    
    if Ydist1<1/10 && Xdist1<(carpos1(3)/2)
        Lose()
        break
    end  

    %%%Car 2%%%
    
    %Gets X and Y distance of Frog from Car 2.
    %abs() get modulus of distance.
    Xdist2 = abs((carpos2(1)+carpos2(3)/2)-(poscowX(1)));
    Ydist2 = abs(carpos2(2)-poscowY(1));           
    
    %When Car 2 exits the screen.
    if carpos2(1) > 10   
        carpos2(1) = -7;
        randicol = colorarray{randi(col)};
        set(car(2),'position',carpos2,'facecolor',randicol);     
    
    %Causes Car 2 to move every 0.01s.        
    elseif carpos2(1) < 10        
        carpos2(1) = carpos2(1) + rand2;
        set(car(2),'position',carpos2);  
    end
    
    %If there is a collision.
    if Ydist2<1/100 && Xdist2<(carpos2(3)/2)
        Lose()
        break
    end

    %%%Car 3%%%
    
    %Gets X and Y distance of Frog from Car 3.
    %abs() get modulus of distance.
    Xdist3 = abs((carpos3(1)+carpos3(3)/3)-(poscowX(1)));
    Ydist3 = abs(carpos3(2)-poscowY(1));    
   
    %When Car 3 exits the screen.
    if carpos3(1) < -3
        carpos3(1) = 12;
        randicol = colorarray{randi(col)};
        set(car(3),'position',carpos3,'facecolor',randicol);   
    
    %Causes Car 3 to move every 0.01s.      
    elseif carpos3(1) > -3
        carpos3(1) = carpos3(1) - rand3;
        set(car(3),'position',carpos3);
    end
    
    %If there is a collision.     
    if Ydist3<1/100 && Xdist3<((carpos3(3)/2))
        Lose()
        break
    end
    
    %%%Car 4%%%
    
    %Gets X and Y distance of Frog from Car 4.
    %abs() get modulus of distance.
    Xdist4 = abs((carpos4(1)+carpos4(3)/2)-(poscowX(1)));
    Ydist4 = abs(carpos4(2)-poscowY(1));    
    
    %When Car 4 exits the screen.
    if carpos4(1) < -3
        carpos4(1) = 12;
        randicol = colorarray{randi(col)};
        set(car(4),'position',carpos4,'facecolor',randicol);        
                              
    %Causes Car 4 to move every 0.01s.      
    elseif carpos4(1) > -3        
        carpos4(1) = carpos4(1) - rand3;
        set(car(4),'position',carpos4);
    end
    
    If there is a collision.
    if Ydist4<1/100 && Xdist4<(carpos1(3)/2)
        Lose()  
        break
    end
    
    %%%Car 5%%%
    
    %Gets X and Y distance of Frog from Car 5.
    %abs() get modulus of distance.
    Xdist5 = abs((carpos5(1)+carpos5(3)/2)-(poscowX(1)));
    Ydist5 = abs(carpos5(2)-poscowY(1));    
    
    %When Car 5 exits the screen.
    if carpos5(1) > 10
        carpos5(1) = -2;
        randicol = colorarray{randi(col)};
        set(car(5),'position',carpos5,'facecolor',randicol);                      
    
    %Causes Car 5 to move every 0.01s.   
    elseif carpos5(1) < 10       
        carpos5(1) = carpos5(1) + rand1;
        set(car(5),'position',carpos5);
    end
    
    %If there is a collision.    
    if Ydist5<1/100 && Xdist5<(carpos5(3)/2)
        Lose()
        break
    end
    
     %%%Car 6%%%
    
    %Gets X and Y distance of Frog from Car 6.
    %abs() get modulus of distance.
    Xdist6 = abs((carpos6(1)+carpos6(3)/2)-(poscowX(1)));
    Ydist6 = abs(carpos6(2)-poscowY(1));    
    
    %When Car 6 exits the screen.
    if carpos6(1) < -3
        carpos6(1) = 12;
        randicol = colorarray{randi(col)};
        set(car(6),'position',carpos6,'facecolor',randicol);                      
    
    %Causes Car 6 to move every 0.01s.   
    elseif carpos6(1) > -3        
        carpos6(1) = carpos6(1) - rand3;
        set(car(6),'position',carpos6);
    end
    
    %If there is a collision.    
    if Ydist6<1/100 && Xdist6<((carpos6(3)/2)+0.5)
        Lose()
        break
    end 
    
    %%%Car 7%%%
    
    %Gets X and Y distance of Frog from Car 7.
    %abs() get modulus of distance.
    Xdist7 = abs((carpos7(1)+carpos7(3)/2)-(poscowX(1)));
    Ydist7 = abs(carpos7(2)-poscowY(1));           
    
    %When Car 7 exits the screen.
    if carpos7(1) > 10   
        carpos7(1) = -7;
        randicol = colorarray{randi(col)};
        set(car(7),'position',carpos7,'facecolor',randicol);     
    
    %Causes Car 7 to move every 0.01s.        
    elseif carpos7(1) < 10        
        carpos7(1) = carpos7(1) + rand2;
        set(car(7),'position',carpos7);  
    end
    
    %If there is a collision.
    if Ydist7<1/100 && Xdist7<(carpos7(3)/2)
        Lose()
        break
    end
    
    %%%Car 8%%%
    
    %Gets X and Y distance of Frog from Car 8.
    %abs() get modulus of distance.
    Xdist8 = abs((carpos8(1)+carpos8(3)/2)-(poscowX(1)));
    Ydist8 = abs(carpos8(2)-poscowY(1));    
    
    %When Car 8 exits the screen.
    if carpos8(1) < -4
        carpos8(1) = 15;
        randicol = colorarray{randi(col)};
        set(car(8),'position',carpos8,'facecolor',randicol);                      
    
    %Causes Car 8 to move every 0.01s.   
    elseif carpos8(1) > -4        
        carpos8(1) = carpos8(1) - rand4;
        set(car(8),'position',carpos8);
    end
    
    %If there is a collision.    
    if Ydist8<1/100 && Xdist8<(carpos8(3)/2)
        Lose()
        break
    end
    
    %%%Car 9%%%
    
    %Gets X and Y distance of Frog from Car 9.
    %abs() get modulus of distance.
    Xdist9 = abs((carpos9(1)+carpos9(3)/2)-(poscowX(1)));
    Ydist9 = abs(carpos9(2)-poscowY(1));    
    
    %When Car 9 exits the screen.
    if carpos9(1) < -4
        carpos9(1) = 15;
        randicol = colorarray{randi(col)};
        set(car(9),'position',carpos9,'facecolor',randicol);                      
    
    %Causes Car 9 to move every 0.01s.   
    elseif carpos9(1) > -4        
        carpos9(1) = carpos9(1) - rand4;
        set(car(9),'position',carpos9);
    end
    
    %If there is a collision.    
    if Ydist9<1/100 && Xdist9<(carpos9(3)/2)
        Lose()
        break
    end 
    
    %%%Car 10%%%
    
    %Gets X and Y distance of Frog from Car 10.
    %abs() get modulus of distance.
    Xdist10 = abs((carpos10(1)+carpos10(3)/2)-(poscowX(1)));
    Ydist10 = abs(carpos10(2)-poscowY(1));    
    
    %When Car 10 exits the screen.
    if carpos10(1) < -4
        carpos10(1) = 15;
        randicol = colorarray{randi(col)};
        set(car(10),'position',carpos10,'facecolor',randicol);                      
    
    %Causes Car 10 to move every 0.01s.   
    elseif carpos10(1) > -4        
        carpos10(1) = carpos10(1) - rand4;
        set(car(10),'position',carpos10);
    end
    
    %If there is a collision.    
    if Ydist10<1/100 && Xdist10<(carpos10(3)/2)
        Lose()
        break
    end 
    
    %%%Car 11%%%
    
    %Gets X and Y distance of Frog from Car 11.
    %abs() get modulus of distance.
    Xdist11 = abs((carpos11(1)+carpos11(3)/2)-(poscowX(1)));
    Ydist11 = abs(carpos11(2)-poscowY(1));    
    
    %When Car 11 exits the screen.
    if carpos11(1) < -2
        carpos11(1) = 12;
        randicol = colorarray{randi(col)};
        set(car(11),'position',carpos11,'facecolor',randicol);                      
    
    %Causes Car 11 to move every 0.01s.   
    elseif carpos11(1) > -2        
        carpos11(1) = carpos11(1) - rand5;
        set(car(11),'position',carpos11);
    end
    
    %If there is a collision.    
    if Ydist11<1/100 && Xdist6<(carpos11(3)/2)
        Lose()
        break
    end 
    
      %%%Car 12%%%
    
    %Gets X and Y distance of Frog from Car 12.
    %abs() get modulus of distance.
    Xdist12 = abs((carpos12(1)+carpos12(3)/2)-(poscowX(1)));
    Ydist12 = abs(carpos12(2)-poscowY(1));    
    
    %When Car 12 exits the screen.
    if carpos12(1) < -2
        carpos12(1) = 12;
        randicol = colorarray{randi(col)};
        set(car(12),'position',carpos12,'facecolor',randicol);                      
    
    %Causes Car 12 to move every 0.01s.   
    elseif carpos12(1) > -2        
        carpos12(1) = carpos12(1) - rand5;
        set(car(12),'position',carpos12);
    end
    
    %If there is a collision.    
    if Ydist12<1/100 && Xdist12<(carpos12(3)/2)
        Lose()
        break
    end 
    
end
end
%Calls above function.
speed3()

%%
%'You Win!' text appears on win state.
function youwin1()
    youwin = text(0,4.8,{'You Win!'},'color','r','fontsize',145);
    set(youwin,'visible','on');
end    

%'You Lose.' text appears on lose state.
function youlose1()
    youlose = text(0,4.8,{'You Lose.'},'color',[1 0 1],'fontsize',130);
    set(youlose,'visible','on');
end

%Stops use of keys after gameover without causing figure to minimse on key press. 
function Nokeys(~,~)
end

%Win State.
function Win()
    set(fig1,'KeyPressFcn',@Nokeys)
    over = 1;
    clear sound
    [CheerSound, Cheer_fps] = audioread('cheer2.mp3');
    sound(CheerSound, Cheer_fps);    
    %https://www.freesoundeffects.com/free-track/cheer2-426825/
    youwin1()
    pause(4)
    delete(gca)
    delete(fig1)    
end

%Close figure before win/loss state.
function Closefig(varargin)
    clear sound
    delete(gca)
    delete(fig1)
end

%Lose State.
function Lose()
    set(fig1,'KeyPressFcn',@Nokeys)
    clear sound
    [Carhit, Carhit_fps] = audioread('carstarthonkbackfire.mp3');
    sound(Carhit, Carhit_fps);
    %https://www.freesoundeffects.com/free-track/carstarthonkbackfire-466330/
    pause(2)
    over = 1;   
    youlose1() 
    pause(1)
    delete(fig1)    
end
end
