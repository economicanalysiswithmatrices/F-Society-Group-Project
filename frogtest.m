function frog1()

 [carsoundmusic, carsound_frames_per_second] = audioread('carsounds.mp3')
    sound(carsoundmusic,carsound_frames_per_second)
fig1 = figure('KeyPressFcn',@presskeys)

rectangle('position',[0 0 10 5]) %big boundry
rectangle('position',[0 0 10 1],'facecolor',[0 0.5,0])%lanes
rectangle('position',[0 1 10 1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')
rectangle('position',[0 4 10 1],'facecolor','g')
axis equal

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

axis on
xlim([0 10])
ylim([0 5])
A=1



car(1) = rectangle('position',[0 1 1 1],'facecolor', 'b');
car(2) = rectangle('position',[5 2 3 1],'facecolor', 'b');
car(3) = rectangle('position',[3 3 1.5 1],'facecolor', 'b');

while A==1
    pause(0.001)
    for n = 1:length(car(:))
        carpos1 = get(car(n),'position');
        carpos1(1) = carpos1(1) + 0.05;
        set(car(n),'position',carpos1);
        drawnow
    distX = abs((carpos1(1)+carpos1(3)/2)-(poscowX(1)));
    distY = abs(carpos1(2)-poscowY(1));
    if  distY<1/16 && distX<(carpos1(3)/2 + 1/60);
        then clear fgr 
          nx = n;
    end
    end
     set(car(n),'position',carpos1);     
     if poscowY >= 4 
        pause (1)
         then clear fgr
     end
end
end

