function frog1()
  
fig1 = figure('KeyPressFcn',@presskeys)
rectangle('position',[0 0 10 5]) %big boundry
rectangle('position',[0 0 10 1],'facecolor',[0 0.5,0])%lanes
rectangle('position',[0 1 10 1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')
rectangle('position',[0 4 10 1],'facecolor','g')

axis off
over = 0

xRana = 4.5+ 15.*[0.0 0.4 0.4 0.2 0.4 0.6 0.8 0.6 0.6 1.0 0.8  1.0 0.8 0.7 0.9 0.8 0.9   0.83 0.8 0.7 0.3 0.2   0.16 0.1 0.2 0.1 0.3 0.2 0.0 0.2]/16;
yRana = 15.*[0.0 0.0 0.1 0.4 0.1 0.1 0.4 0.1 0.0 0.0 0.1  0.4 0.5 0.4 0.6 0.8 0.9   0.93 1.0 0.9 0.9 1.0   0.93 0.9 0.8 0.6 0.4 0.5 0.4 0.1]/16;
cow = patch(xRana,yRana,'y','edgecolor','b');
%cow = rectangle('position',[4.5 0 1 1],'facecolor','w');%character
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
                  elseif poscowY(1)>1
                    Over()
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

A=1

car(1) = rectangle('position',[0 1 1 1],'facecolor', 'b');
car(2) = rectangle('position',[5 2 3 1],'facecolor', 'b');
car(3) = rectangle('position',[3 3 1.5 1],'facecolor', 'b');

%(r(:,1))

%  for n=1:length(r(:,1))
while over==0
    pause(0.01)
    carpos1 = get(car(1),'position');
    carpos2 = get(car(2),'position');
    carpos3 = get(car(3),'position');
     
    if carpos1(1) > 10   
        carpos1(1) = -2;
        set(car(1),'position',carpos1);
    
    elseif carpos1(1) < 10
        carpos1 = get(car(1),'position');      % This line might not be necessary for our code
        carpos1(1) = carpos1(1) + 0.03;
        set(car(1),'position',carpos1);
    end
        
    if carpos2(1) > 10   
        carpos2(1) = -9;
        set(car(2),'position',carpos2);
        
    elseif carpos2(1) < 10
        carpos2 = get(car(2),'position');
        carpos2(1) = carpos2(1) + 0.1;
        set(car(2),'position',carpos2);       
    end

    if carpos3(1) > 10   
        carpos3(1) = -2;
        set(car(3),'position',carpos3);
    
    elseif carpos3(1) < 10
        carpos3 = get(car(3),'position');
        carpos3(1) = carpos3(1) + 0.05;
        set(car(3),'position',carpos3);
    end
   
    
     %set(car(1),'position',carpos1);
end






function youwin1()
    youwin = text(0,3,{'You Win!'},'color','r','fontsize',80);
    set(youwin,'visible','on');
end

function Nokeys(~)
end  

function Over()
    set(fig1,'KeyPressFcn',@Nokeys)
    over = 1;   
    youwin1()    
    pause(1.5)
    close(fig1)
end
end
