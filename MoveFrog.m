
%This still needs work
fig1 = figure('KeyPressFcn',@presskeys)
rectangle('position',[0 0 10 5]) %big boundry

rectangle('position',[0 0 10 1],'facecolor',[0 0.5,0])%lanes
rectangle('position',[0 1 10 1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')
rectangle('position',[0 4 10 1],'facecolor','g')
axis on

 xRana = 15.*[0.0 0.4 0.4 0.2 0.4 0.6 0.8 0.6 0.6 1.0 0.8  1.0 0.8 0.7 0.9 0.8 0.9   0.83 0.8 0.7 0.3 0.2   0.16 0.1 0.2 0.1 0.3 0.2 0.0 0.2]/16;
 yRana = 15.*[0.0 0.0 0.1 0.4 0.1 0.1 0.4 0.1 0.0 0.0 0.1  0.4 0.5 0.4 0.6 0.8 0.9   0.93 1.0 0.9 0.9 1.0   0.93 0.9 0.8 0.6 0.4 0.5 0.4 0.1]/16;   
 cow = patch(xRana + 7/15,yRana + 1/15,'y','edgecolor','b');     
%cow = rectangle('position',[4.5 0 1 1],'facecolor','w');%character
poscowX = get(cow,'XData')%searching for position of cow on the board
poscowY = get(cow,'YData')

function presskeys(varargin)
poscowX = get(cow,'XData')%searching for position of cow on the board
poscowY = get(cow,'YData')
display(poscowX)
display(poscowY)

switch varargin.Key
    case 'uparrow'
        if poscowY<4
            poscowY = poscowY+1
        end
    
    case 'downarrow'
        if poscowY>0
            poswcowY= poscowY-1
        end
    
    case 'leftarrow'
        if poscowX>0
            poscowX = poscowX-1
        end
        
    case 'rightarrow'
        if pocowX<10
            poscowX = poscowX+1
        end
set(cow,'Ydata',poscowY,'XData',poscowX)
end
end
                
                
                
                
                
