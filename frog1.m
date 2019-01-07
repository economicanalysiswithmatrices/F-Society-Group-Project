
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
    
axis off
xlim([0 10])
ylim([0 5])



car = hgtransform;
rectangle('position',[0 0 1 1],'facecolor', 'b','parent',car) ;

car2 = hgtransform;
rectangle('position',[0 0 3 1],'facecolor', 'b','parent',car2) ;

car3 = hgtransform;
rectangle('position',[0 0 1.5 1],'facecolor', 'b','parent',car3) ;



pt1 = [10 1 0];
pt2 = [0 1 0];

pt1_2 = [0 2  0];
pt2_2 = [8 2 0];

pt1_3 = [6 3  0];
pt2_3 = [0 3 0];


for  R = 1:1000
    
    for t=linspace(0,1,300)
        
        car.Matrix = makehgtform('translate',pt1 + t*(pt2-pt1))
        car2.Matrix = makehgtform('translate',pt1_2 + t*(pt2_2-pt1_2))
        car3.Matrix = makehgtform('translate',pt1_3 + t*(pt2_3-pt1_3))
        
        drawnow
    end
    
end




if poscowY == 4
    close figure 
end
   

end






