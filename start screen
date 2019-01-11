function startscreen

f = figure('menubar','none','closereq', @Closefig)

axis off

rectangle('position',[0 0 10 5]) %big boundry
rectangle('position',[0 0 10 2],'facecolor',[0 0.5,0])%lanes
rectangle('position',[0 1.25 10 1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')
rectangle('position',[0 4 10 1],'facecolor','g')
 
Howtoplay = text(0.75,1,{'How To Play'},'color','m','fontsize',18);
crossroad = text(0.5,0.5,{'Cross the road without getting hit.'},'color','w','fontsize',12);
arrowkeys = text(0.5,0.25,{'Use arrow keys to move.'},'color','w','fontsize',12);
title = text(3.25,4.5,{'Frogger'},'color','k','fontsize',30,'fontweight','bold')
Difficulty = text(6.5,1,{'Choose Difficulty'},'color','r','fontsize',15);

xRana = 3.5+ 40.*[0.0 0.4 0.4 0.2 0.4 0.6 0.8 0.6 0.6 1.0 0.8  1.0 0.8 0.7 0.9 0.8 0.9   0.83 0.8 0.7 0.3 0.2   0.16 0.1 0.2 0.1 0.3 0.2 0.0 0.2]/16;
yRana =1.25+40.*[0.0 0.0 0.1 0.4 0.1 0.1 0.4 0.1 0.0 0.0 0.1  0.4 0.5 0.4 0.6 0.8 0.9   0.93 1.0 0.9 0.9 1.0   0.93 0.9 0.8 0.6 0.4 0.5 0.4 0.1]/16;
cow = patch(xRana,yRana,'y','edgecolor','b');

[Opening, Opening_fps] = audioread('Opening.mp3'); %PLACEHOLDER SOUND
sound(Opening, Opening_fps);

a = 0;


c = uicontrol(f,'Style','popupmenu');
c.Position = [400 80 85 10];
c.String = {'Select','Easy','Hard','Hardest','Chaos'};
c.Callback = @selection;

    function selection(src,event)
        val = c.Value;
        str = c.String;
        str{val};
        disp(['Selection: ' str{val}]);   
    end



function Closefig(varargin)
a = 1;
clear sound
delete(gca)
delete(f)

    end
while a == 0

diff = get(c,'Value');
pause(0.5)
if diff(1) == 2
    display('Easy mode initiating...')
    pause(1)
    clear sound
    close(f)
    pause(0.5)
    Easymode()
    a = 1

elseif diff(1) == 3
    display('Hard mode initiating...')
    pause(1)
    clear sound
    close(f)
    pause(0.5)
    Hardmode()
    a = 1
    
elseif diff(1) == 4
    display('Hardest mode initiating...')
    pause(1)
    clear sound
    close(f)
    pause(0.5)
    Hardestmode()
    a = 1

elseif diff(1) == 5
    display('Chaos mode initiating...')
    pause(1)
    clear sound
    close(f)
    pause(0.5)
    Chaosmode()
    a = 1    
end
end
end
