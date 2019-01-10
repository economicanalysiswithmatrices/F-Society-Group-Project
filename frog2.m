function frog1()

  
fig1 = figure('KeyPressFcn',@presskeys,'position', [500 90 1000 900]);
rectangle('position',[0 0 10 5]) %big boundry
rectangle('position',[0 0 10 1],'facecolor',[0 0.5,0])%lanes
rectangle('position',[0 1 10 1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')
rectangle('position',[0 4 10 1],'facecolor','g')
axis off

over = 0;

xRana = 4.5+ 15.*[0.0 0.4 0.4 0.2 0.4 0.6 0.8 0.6 0.6 1.0 0.8  1.0 0.8 0.7 0.9 0.8 0.9   0.83 0.8 0.7 0.3 0.2   0.16 0.1 0.2 0.1 0.3 0.2 0.0 0.2]/16;
yRana = 15.*[0.0 0.0 0.1 0.4 0.1 0.1 0.4 0.1 0.0 0.0 0.1  0.4 0.5 0.4 0.6 0.8 0.9   0.93 1.0 0.9 0.9 1.0   0.93 0.9 0.8 0.6 0.4 0.5 0.4 0.1]/16;
cow = patch(xRana,yRana,'y','edgecolor','b');
%cow = rectangle('position',[4.5 0 1 1],'facecolor','w');%character
poscowX = get(cow,'XData');%searching for position of cow on the board
poscowY = get(cow,'YData');

%if over ==0
%for m = 1:10
%[drivebysound, Driveby_fps] = audioread('BMW+driveby.mp3');
%sound(drivebysound, Driveby_fps);
%pause(5)


    
function presskeys(varargin)      
    poscowX = get(cow,'XData');%searching for position of cow on the board        
    poscowY = get(cow,'YData');        
    display(poscowX)        
    display(poscowY)
                        
    switch varargin{2}.Key
        case 'uparrow'
            if poscowY<4                   
                poscowY = poscowY+1;                
            end                
                                                              
        case 'downarrow'                
            if poscowY>0                    
                poscowY = poscowY-1;                    
            end
                
        case 'rightarrow'                
            if poscowX <8.5                    
                poscowX = poscowX+0.5;                    
            end               
                               
        case 'leftarrow'                
            if poscowX>1                    
                poscowX = poscowX-0.5;                    
            end
    end
    set(cow,'Ydata',poscowY,'XData',poscowX)                      
end


xlim([0 10])
ylim([0 5])

%car(1) = rectangle('position',[0 1 1 1],'facecolor', 'b');
%car(2) = rectangle('position',[5 2 3 1],'facecolor', 'b');
%car(3) = rectangle('position',[3 3 1.5 1],'facecolor', 'b');
car(1) = rectangle('position',[3 1 2 1],'facecolor', 'b');
car(2) = rectangle('position',[6 2 2.5 1],'facecolor', 'b');
car(3) = rectangle('position',[7 3 1.5 1],'facecolor', 'b');
car(4) = rectangle('position',[4 3 1.5 1],'facecolor', 'b');
car(5) = rectangle('position',[15 1 2 1],'facecolor', 'b');
rand1 = 0.1*rand()
rand2 = 0.1*rand()
rand3 = 0.1*rand()

while over==0
    pause(0.01)
    carpos1 = get(car(1),'position');
    carpos2 = get(car(2),'position');
    carpos3 = get(car(3),'position');
    carpos4 = get(car(4),'position');
    carpos5 = get(car(5),'position');
    
    poscowY = get(cow,'YData');
    if poscowY > 3
        over = 1;
        Win()
    end
     
    if carpos1(1) > 10   
        carpos1(1) = -2;
        set(car(1),'position',carpos1);
    
    elseif carpos1(1) < 10
        %carpos1 = get(car(1),'position');      % This line might not be necessary for our code
        carpos1(1) = carpos1(1) + rand1;
        set(car(1),'position',carpos1);
    end
        
    if carpos2(1) > 10   
        carpos2(1) = -9;
        set(car(2),'position',carpos2);
        
    elseif carpos2(1) < 10
        %carpos2 = get(car(2),'position');
        carpos2(1) = carpos2(1) + rand2;
        set(car(2),'position',carpos2);       
    end

    if carpos3(1) > 10
        carpos3(1) = -2;
        set(car(3),'position',carpos3);
    
    elseif carpos3(1) < 10
        %carpos3 = get(car(3),'position');
        carpos3(1) = carpos3(1) + rand3;
        set(car(3),'position',carpos3);
    end
    
    if carpos4(1) > 10
        carpos4(1) = -2;
        set(car(4),'position',carpos4);
    
    elseif carpos4(1) < 10
        %carpos3 = get(car(3),'position');
        carpos4(1) = carpos4(1) + rand3;
        set(car(4),'position',carpos4);
    end
    
    if carpos5(1) > 10
        carpos5(1) = -2;
        set(car(5),'position',carpos5);
    
    elseif carpos5(1) < 10
        %carpos3 = get(car(3),'position');
        carpos5(1) = carpos5(1) + rand1;
        set(car(5),'position',carpos5);
    end
    Xdist1 = abs((carpos1(1)+carpos1(3)/2)-(poscowX(1)));
    Ydist1 = abs(carpos1(2)-poscowY(1));
    
    if  Ydist1<1/100 && Xdist1<(carpos1(3)/2)
        Lose()
    end
    
    Xdist2 = abs((carpos2(1)+carpos2(3)/2)-(poscowX(1)));
    Ydist2 = abs(carpos2(2)-poscowY(1));
    
    if  Ydist2<1/100 && Xdist2<(carpos2(3)/2)
        Lose()
    end
    
    Xdist3 = abs((carpos3(1)+carpos3(3)/2)-(poscowX(1)));
    Ydist3 = abs(carpos3(2)-poscowY(1));
    
    if  Ydist3<1/100 && Xdist3<(carpos3(3)/2)
        Lose()
    end
    
    Xdist4 = abs((carpos4(1)+carpos4(3)/2)-(poscowX(1)));
    Ydist4 = abs(carpos4(2)-poscowY(1));
    
    if  Ydist4<1/100 && Xdist4<(carpos1(3)/2)
        Lose()
    end
    
    Xdist5 = abs((carpos5(1)+carpos5(3)/2)-(poscowX(1)));
    Ydist5 = abs(carpos5(2)-poscowY(1));
    
    if  Ydist5<1/100 && Xdist5<(carpos5(3)/2)
        Lose()
    end
    
   
end


function youwin1()
    youwin = text(0,3,{'You Win!'},'color','r','fontsize',145);
    set(youwin,'visible','on');
end    
function youlose1()
    youlose = text(0,3,{'You Lose.'},'color','m','fontsize',130);
    set(youlose,'visible','on');
end

function Nokeys(~,~)
end  

function Win()
    set(fig1,'KeyPressFcn',@Nokeys)
    over = 1;
    [CheerSound, Cheer_fps] = audioread('cheer2.mp3');
    sound(CheerSound, Cheer_fps);    
    %https://www.freesoundeffects.com/free-track/cheer2-426825/
    youwin1()
    pause(4)
    delete(gca)
    close(fig1)    
end

function Lose()
    set(fig1,'KeyPressFcn',@Nokeys)
    [Carhit, Carhit_fps] = audioread('carstarthonkbackfire.mp3');
    sound(Carhit, Carhit_fps);
    %https://www.freesoundeffects.com/free-track/carstarthonkbackfire-466330/
    pause(2)
    over = 1;   
    youlose1()    
    pause(1.5)
    delete(gca)
    close(fig1)  

end

end
    

   







