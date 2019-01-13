function Chaosmode()
%Creates figure for game.
fig1 = figure('NumberTitle','off','Name','Chaos Mode','menubar','none','KeyPressFcn',@presskeys,'position', [500 90 1000 900],'closereq', @Closefig);

%No boundary around game
axes('Position',[0,0,1,1],'Xlim',[0 10],'Ylim',[0 8])

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
frog = patch(xRana,yRana,'y','edgecolor','b');

%Searches for initial position of frog on the board.
posfrogX = get(frog,'XData');
posfrogY = get(frog,'YData');

%Frog hop sound.
[Hop,Hop_fps] = audioread('sound-frogger-hop.wav');

%Sound that runs in the background of the game.
[Bg, Bg_fps] = audioread('Benny Hill Theme.mp3');
sound(Bg, Bg_fps);

%%
%Credit: Gustavo Rodriguez.
function presskeys(varargin)              

    %'Switch' case for WASD.
    switch varargin{2}.Key
                
        case 'w'                             
            posfrogY = posfrogY+1; 
            sound(Hop, Hop_fps);

                
        case 's'
            %Makes sure frog stays inside playing area.
            if posfrogY>0                    
                posfrogY = posfrogY-1;
                sound(Hop, Hop_fps);

            end

        case 'd'
            %Makes sure frog stays inside playing area.
            %Larger movement per arrow key hit than Hard or Chaos mode.
            if posfrogX <9.5                    
                posfrogX = posfrogX+0.5;
                sound(Hop, Hop_fps);

            end                                             

        case 'a'
            %Makes sure frog stays inside playing area.
            %Larger movement per arrow key hit than Hard or Chaos mode.
            if posfrogX>0                    
                posfrogX = posfrogX-0.5; 
                sound(Hop, Hop_fps);

            end
    end
    %Sets new Frog position after every arrow key movement.
    set(frog,'Ydata',posfrogY,'XData',posfrogX);                     
end

%%
%Used for random car colours.
colorarray = {'y','m','c','r','b','g'};
col = length(colorarray);

%Cars. They have fixed colours to begin with.
car(1) = rectangle('position',[3 1 2 0.9],'facecolor', 'g','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(2) = rectangle('position',[6 2 2.5 0.9],'facecolor', 'b','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(3) = rectangle('position',[9 4 2.25 0.9],'facecolor', 'c','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(8) = rectangle('position',[1 5 1 0.9],'facecolor', 'g','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(12) = rectangle('position',[6 6 1.5 0.9],'facecolor', 'y','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);


%Random speed of cars upon game startup within a set range of values.
rand1 = -1.5+10*rand();
rand2 = -1.5+10*rand();
rand3 = -1.5+10*rand();
rand8 = -1.5+10*rand();
rand12 = -1.5+10*rand();

%%
function speed4()
while over==0
    %Sets a fixed refresh rate for the game.
    pause(0.05)
    
    %Get X position of each car every 0.01s.
    carpos1 = get(car(1),'position');
    carpos2 = get(car(2),'position');
    carpos3 = get(car(3),'position');    
    carpos8 = get(car(8),'position');
    carpos12 = get(car(12),'position');
    
    %Random location of cars upon after every loop.
    rand1 = -1+10*rand();
    rand2 = -1.5+10*rand();
    rand3 = -1.5+10*rand();
    rand8 = -0.5+10*rand();
    rand12 = -0.5+10*rand();
    
    %Gets Y position of frog for collisions.
    posfrogY = get(frog,'YData');
    
    %When frog reaches greener grass.
    if posfrogY > 6
        Win()
        break
    end     
    
    %%%%Car 1%%%
    
    %Gets X and Y distance of Frog from Car 1.
    %abs() get modulus of distance.
    Xdist1 = abs((carpos1(1)+carpos1(3)/2)-(posfrogX(1)));
    Ydist1 = abs(carpos1(2)-posfrogY(1));    
    
    %When car 1 exits the screen.    
    carpos1(1) = rand1;
    randicol = colorarray{randi(col)};
    set(car(1),'position',carpos1,'facecolor',randicol);                     
       
    %If there is a collision.    
    if Ydist1<1/10 && Xdist1<(carpos1(3)/2)
        Lose()
        break
    end  

    %%%Car 2%%%
    
    %Gets X and Y distance of Frog from Car 2.
    %abs() get modulus of distance.
    Xdist2 = abs((carpos2(1)+carpos2(3)/2)-(posfrogX(1)));
    Ydist2 = abs(carpos2(2)-posfrogY(1));           
    
    %When car 2 exits the screen.    
    carpos2(1) = rand2;
    randicol = colorarray{randi(col)};
    set(car(2),'position',carpos2,'facecolor',randicol);    
    
    %If there is a collision.
    if Ydist2<1/100 && Xdist2<(carpos2(3)/2)
        Lose()
        break
    end

    %%%Car 3%%%
    
    %Gets X and Y distance of Frog from Car 3.
    %abs() get modulus of distance.
    Xdist3 = abs((carpos3(1)+carpos3(3)/3)-(posfrogX(1)));
    Ydist3 = abs(carpos3(2)-posfrogY(1));    
   
   %When car 3 exits the screen.    
    carpos3(1) = rand3;
    randicol = colorarray{randi(col)};
    set(car(3),'position',carpos3,'facecolor',randicol); 

    %If there is a collision.     
    if Ydist3<1/100 && Xdist3<((carpos3(3)/2))
        Lose()
        break
    end    
    
    %%%Car 8%%%
    
    %Gets X and Y distance of Frog from Car 8.
    %abs() get modulus of distance.
    Xdist8 = abs((carpos8(1)+carpos8(3)/2)-(posfrogX(1)));
    Ydist8 = abs(carpos8(2)-posfrogY(1));    
    
   %When car 8 exits the screen.    
    carpos8(1) = rand8;
    randicol = colorarray{randi(col)};
    set(car(8),'position',carpos8,'facecolor',randicol);                  
    
    %If there is a collision.    
    if Ydist8<1/100 && Xdist8<(carpos8(3)/2)
        Lose()
        break
    end
    
      %%%Car 12%%%
    
    %Gets X and Y distance of Frog from Car 12.
    %abs() get modulus of distance.
    Xdist12 = abs((carpos12(1)+carpos12(3)/2)-(posfrogX(1)));
    Ydist12 = abs(carpos12(2)-posfrogY(1));    
    
    %When car 12 exits the screen.    
    carpos12(1) = rand12;
    randicol = colorarray{randi(col)};
    set(car(12),'position',carpos12,'facecolor',randicol);                            
    
    %If there is a collision.    
    if Ydist12<1/100 && Xdist12<(carpos12(3)/2)
        Lose()
        break
    end 
    
end
end
%Calls above function.
speed4()

%%
%'You Win!' text appears on win state.
function youwin1()
    youwin = text(0,4.8,{" You're Lucky..."},'color','k','fontsize',115,'backgroundcolor','c');
    set(youwin,'visible','on');
end    

%'You Lose.' text appears on lose state.
function youlose1()
    youlose = text(0,4.8,{'Of course you lost.'},'color','k','fontsize',90,'backgroundcolor','r');
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
    [MGTC_FPS, MGTC_fps] = audioread('MOM GET THE CAMERA - MLG Sound Effects (HD).mp3');
    sound(MGTC, MGTC_fps);
    youwin1()
    pause(16)
    delete(gca)
    delete(fig1)  
    Frogger()
end

%Close figure before win/loss state.
function Closefig(varargin)
    clear sound
    delete(gca)
    delete(fig1)
end

%Lose State.
function Lose()
    over = 1; 
    set(fig1,'KeyPressFcn',@Nokeys)
    clear sound
    [Carhit, Carhit_fps] = audioread('carstarthonkbackfire.mp3');
    sound(Carhit, Carhit_fps);
    pause(2)      
    youlose1() 
    pause(1)
    delete(fig1) 
    Frogger()
end
end
