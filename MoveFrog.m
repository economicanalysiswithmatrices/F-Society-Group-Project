rectangle('position',[0 0 10 5]) %big boundry

rectangle('position',[0 0 10 1],'facecolor',[0 0.5,0])%lanes
rectangle('position',[0 1 10 1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')
rectangle('position',[0 4 10 1],'facecolor','g')
axis on

cow = rectangle('position',[4.5 0 1 1],'facecolor','w');%character

function movecow(arrowkey);

poscowX = get(cow,'XData')%searching for position of cow on the board
poscowY = get(cow,'YData')

switch arrowkey(2).Key
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
        
    case 'rightharrow'
        if pocowX<10
        poscowX = poscowX+1
        end
end
display poscowY

end
%rotation of object
r1 = 2*pi;
for t=linspace(0,1,10)
  cow = makehgtform( 'xrotate',r1);
  drawnow
end


                
                
                
                
                
