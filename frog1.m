function frog1()

fig1 = figure('KeyPressFcn',@presskeys)

rectangle('position',[0 0 10 5]) %big boundry
rectangle('position',[0 0 10 1],'facecolor',[0 0.5,0])%lanes
rectangle('position',[0 1 10 1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')
rectangle('position',[0 4 10 1],'facecolor','g')

axis off

xRana = 4.5+ 15.*[0.0 0.4 0.4 0.2 0.4 0.6 0.8 0.6 0.6 1.0 0.8  1.0 0.8 0.7 0.9 0.8 0.9   0.83 0.8 0.7 0.3 0.2   0.16 0.1 0.2 0.1 0.3 0.2 0.0 0.2]/16;
yRana = 15.*[0.0 0.0 0.1 0.4 0.1 0.1 0.4 0.1 0.0 0.0 0.1  0.4 0.5 0.4 0.6 0.8 0.9   0.93 1.0 0.9 0.9 1.0   0.93 0.9 0.8 0.6 0.4 0.5 0.4 0.1]/16;
cow = patch(xRana,yRana,'y','edgecolor','b');

poscowX = get(cow,'XData')%searching for position of cow on the board
poscowY = get(cow,'YData')

    function presskeys(varargin)                    
        poscowX = get(cow,'XData')%searching for position of cow on the board
        poscowY = get(cow,'YData')
        display(poscowX)
        display(poscowY)
        switch varargin{2}.Key 
            case 'uparrow'
                if poscowY<4
                    poscowY = poscowY+1
                end
  
            case 'downarrow'
                if poscowY>0
                    poscowY = poscowY-1
                end
           
           case 'rightarrow'
                if poscowX <8.5
                    poscowX = poscowX+1
                end
           
           case 'leftarrow'
                if poscowX>1
                    poscowX = poscowX-1
                end
        end
        set(cow,'Ydata',poscowY,'XData',poscowX)
    end


xlim([0 10])
ylim([0 5])
gameover = 0

car(1) = rectangle('position',[3 1 2 1],'facecolor', 'b');
car(2) = rectangle('position',[6 2 2.5 1],'facecolor', 'b');
car(3) = rectangle('position',[11 3 1.5 1],'facecolor', 'b');
car(4) = rectangle('position',[4 3 1.5 1],'facecolor', 'b');
car(5) = rectangle('position',[15 1 2 1],'facecolor', 'b');

while gameover == 0    
    pause(0.001)
    for n = 1:length(car(:))
        carpos1 = get(car(n),'position');       
        carpos1(1) = carpos1(1) + 0.1;        
        
        if carpos1(1)>10
            carpos1(1)=-4
        end        
        set(car(n),'position',carpos1);

        distX = abs((carpos1(1)+carpos1(3)/2)-(poscowX(1)));        
        distY = abs(carpos1(2)-poscowY(1));
                        
        if  distY<1/100 && distX<(carpos1(3)/2 + 1/100)
            gameover = 1;
            Lose()                                    
        end
        
    end                
    if poscowY >= 4
        gameover = 1 ;
        Win()                                        
    end
end
    
function youwin1()
    youwin = text(0,3,{'You Win!'},'color','r','fontsize',80);
    set(youwin,'visible','on');
end    
function youlose1()
    youlose = text(0,3,{'You Lose.'},'color','m','fontsize',70);
    set(youlose,'visible','on');
end
function Nokeys(~,~)
end  
    function Lose()
         set(fig1,'KeyPressFcn',@Nokeys)
         [Carhit, Carhit_fps] = audioread('carstarthonkbackfire.mp3');
         sound(Carhit, Carhit_fps);
         %https://www.freesoundeffects.com/free-track/carstarthonkbackfire-466330/
         pause(2)
            
         youlose1()    
         pause(1.5)
         delete(gca)
         close(fig1)  
    end

    function Win()
        set(fig1,'KeyPressFcn',@Nokeys)
       
        [CheerSound, Cheer_fps] = audioread('cheer2.mp3');
        sound(CheerSound, Cheer_fps);    
        %https://www.freesoundeffects.com/free-track/cheer2-426825/
        youwin1()
        pause(4)
        delete(gca)
        close(fig1) 
    end






end
