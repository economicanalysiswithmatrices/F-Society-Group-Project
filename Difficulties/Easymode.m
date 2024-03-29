function Easymode()
%Creates figure for game.
fig1 = figure('NumberTitle','off','Name','Easy Mode','menubar','none','KeyPressFcn',@presskeys,'position', [500 90 1000 900],'closereq', @Closefig);

%No boundary around game.
axes('Position',[0,0,1,1],'Xlim',[0 10],'Ylim',[0 5])

%Start grass.
rectangle('position',[0 -0.1 10 1],'facecolor',[0 0.5,0])

%Road Lanes.
rectangle('position',[0 0.9 10 1.1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')

%Grass is always greener.
rectangle('position',[0 4 10 1],'facecolor','g')


%%Road lines%%
%Bottom 3 lines.
rectangle('position',[-1 1.45 2 0.1],'facecolor','y')
rectangle('position',[3 1.45 2 0.1],'facecolor','y')
rectangle('position',[7 1.45 2 0.1],'facecolor','y')

%Middle 3 lines.
rectangle('position',[-1 2.45 2 0.1],'facecolor','y')
rectangle('position',[3 2.45 2 0.1],'facecolor','y')
rectangle('position',[7 2.45 2 0.1],'facecolor','y')

%Top 3 lines.
rectangle('position',[-1 3.45 2 0.1],'facecolor','y')
rectangle('position',[3 3.45 2 0.1],'facecolor','y')
rectangle('position',[7 3.45 2 0.1],'facecolor','y')

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

%Random background sound upon game launch.
soundfiles = {'Undertale - 043 - Temmie Village.mp3','Undertale OST 005 - Ruins.mp3','Undertale OST 13 - Home (Music Box).mp3'};
sound1 = length(soundfiles);
randsound = soundfiles(randi(sound1));
rs = string(randsound);
[Bg, Bg_fps] = audioread(rs);
sound(Bg, Bg_fps);
disp('Song: ');
disp(rs);


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
            if posfrogX <8.5  
               
                posfrogX = posfrogX+0.5;
                 sound(Hop, Hop_fps);
            end                                             

        case 'a'
            %Makes sure frog stays inside playing area.
            if posfrogX>1 
                
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
car(3) = rectangle('position',[7 3 1.5 0.9],'facecolor', 'c','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(4) = rectangle('position',[4 3 1.5 0.9],'facecolor', 'r','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);
car(5) = rectangle('position',[15 1 2 0.9],'facecolor', 'w','edgecolor','w','linewidth',2,'curvature',[0.2,0.2]);

%Random speed of cars upon game startup within a set range of values.
rand1 = 0.02+0.01*rand();
rand2 = 0.02+0.01*rand();
rand3 = 0.02+0.01*rand();

%%
function speed1()
while over==0
    %Sets a fixed refresh rate for the game.
    pause(0.01)
    
    %Get X position of each car every 0.01s.
    carpos1 = get(car(1),'position');
    carpos2 = get(car(2),'position');
    carpos3 = get(car(3),'position');
    carpos4 = get(car(4),'position');
    carpos5 = get(car(5),'position');  
    
    %Gets Y position of frog for collisions.
    posfrogY = get(frog,'YData');
    
    %When frog reaches greener grass.
    if posfrogY > 3
        Win()
        break
    end     
    
    %%%%Car 1%%%
    
    %Gets X and Y distance of Frog from Car 1.
    %abs() get modulus of distance.
    Xdist1 = abs((carpos1(1)+carpos1(3)/2)-(posfrogX(1)));
    Ydist1 = abs(carpos1(2)-posfrogY(1));    
    
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
    Xdist2 = abs((carpos2(1)+carpos2(3)/2)-(posfrogX(1)));
    Ydist2 = abs(carpos2(2)-posfrogY(1));           
    
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
    Xdist3 = abs((carpos3(1)+carpos3(3)/2)-(posfrogX(1)));
    Ydist3 = abs(carpos3(2)-posfrogY(1));    
   
    %When Car 3 exits the screen.
    if carpos3(1) > 10
        carpos3(1) = -2;
        randicol = colorarray{randi(col)};
        set(car(3),'position',carpos3,'facecolor',randicol);   
    
    %Causes Car 3 to move every 0.01s.      
    elseif carpos3(1) < 10
        carpos3(1) = carpos3(1) + rand3;
        set(car(3),'position',carpos3);
    end
    
    %If there is a collision.     
    if Ydist3<1/100 && Xdist3<(carpos3(3)/2)
        Lose()
        break
    end
    
    %%%Car 4%%%
    
    %Gets X and Y distance of Frog from Car 4.
    %abs() get modulus of distance.
    Xdist4 = abs((carpos4(1)+carpos4(3)/2)-(posfrogX(1)));
    Ydist4 = abs(carpos4(2)-posfrogY(1));    
    
    %When Car 4 exits the screen.
    if carpos4(1) > 10
        carpos4(1) = -2;
        randicol = colorarray{randi(col)};
        set(car(4),'position',carpos4,'facecolor',randicol);        
                              
    %Causes Car 4 to move every 0.01s.      
    elseif carpos4(1) < 10        
        carpos4(1) = carpos4(1) + rand3;
        set(car(4),'position',carpos4);
    end
    
     %If there is a collision.
    if Ydist4<1/100 && Xdist4<(carpos1(3)/2)
        Lose()
        break
    end
    
    %%%Car 5%%%
    
    %Gets X and Y distance of Frog from Car 5.
    %abs() get modulus of distance.
    Xdist5 = abs((carpos5(1)+carpos5(3)/2)-(posfrogX(1)));
    Ydist5 = abs(carpos5(2)-posfrogY(1));    
    
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
end
end
%Calls above function.
speed1()

%%
%'You Win!' text appears on win state.
function youwin1()
    youwin = text(0,3,{'You Win!'},'color','k','fontsize',185,'backgroundcolor','c');
    set(youwin,'visible','on');
end    

%'You Lose.' text appears on lose state.
function youlose1()
    youlose = text(0,3,{'You Lose.'},'color','k','fontsize',170,'backgroundcolor','r');
    set(youlose,'visible','on')
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
    youwin1()
    pause(5)
    delete(gca)
    close(fig1)
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
    set(fig1,'KeyPressFcn',@Nokeys)
    clear sound
    [Carhit, Carhit_fps] = audioread('carstarthonkbackfire.mp3');
    sound(Carhit, Carhit_fps);
    pause(2)
    over = 1; 
    youlose1() 
    pause(1)
    delete(gca)
    delete(fig1)
    Frogger()
end
end
