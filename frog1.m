
function frog1()

  
fig1 = figure('KeyPressFcn',@presskeys)
rectangle('position',[0 0 10 10]) %big boundry
rectangle('position',[0 0 10 1],'facecolor',[0 0.5,0])%lanes
rectangle('position',[0 1 10 1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')
rectangle('position',[0 4 10 1],'facecolor','g')
axis off


over = 0
grid = zeros(10,10)

xRana = 4.5+ 15.*[0.0 0.4 0.4 0.2 0.4 0.6 0.8 0.6 0.6 1.0 0.8  1.0 0.8 0.7 0.9 0.8 0.9   0.83 0.8 0.7 0.3 0.2   0.16 0.1 0.2 0.1 0.3 0.2 0.0 0.2]/16;
yRana = 15.*[0.0 0.0 0.1 0.4 0.1 0.1 0.4 0.1 0.0 0.0 0.1  0.4 0.5 0.4 0.6 0.8 0.9   0.93 1.0 0.9 0.9 1.0   0.93 0.9 0.8 0.6 0.4 0.5 0.4 0.1]/16;
cow = patch(xRana,yRana,'y','edgecolor','b');
%cow = rectangle('position',[4.5 0 1 1],'facecolor','w');%character
poscowX = get(cow,'XData')%searching for position of cow on the board
poscowY = get(cow,'YData')

if poscowY(1) == 4
    Over()
end
    function presskeys(varargin)      
     %while over == 0    
        poscowX = get(cow,'XData')%searching for position of cow on the board        
        poscowY = get(cow,'YData')        
        display(poscowX)        
        display(poscowY)
                        
        switch varargin{2}.Key
            case 'uparrow'
                 if poscowY(1)==4
                    %poscowY = yRana
                    
                     %disp('Youwin')
                    
                    Over()
                elseif poscowY<4                    
                    poscowY = poscowY+1
                    disp(poscowY(1))
               
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
        %pause(0.3)
     %end
    end
    
    



axis off
xlim([0 10])
ylim([0 5])

A=1

car(1) = rectangle('position',[0 1 1 1],'facecolor', 'b');
%car(2) = rectangle('position',[5 2 3 1],'facecolor', 'b');
%car(3) = rectangle('position',[3 3 1.5 1],'facecolor', 'b');
carpos1 = get(car(1),'position')
%(r(:,1))
%if car
%  for n=1:length(r(:,1))
    %function  movecar()
while A==1
    pause(0.0001)
    carpos1 = get(car(1),'position');
    
        
    if carpos1(1)<10 
   %for n = 1:3%length(car(:))
        carpos1 = get(car(1),'position')
        carpos1(1) = carpos1(1) + 0.1;
        set(car(1),'position',carpos1);
        
        
    else
       
        disp('check')
        carpos1(1) = -1
        set(car(1),'position',carpos1);
    
   

    end
end







