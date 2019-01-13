function Frogger

% Add all folders to path.
% Credit: Antonio Mele
folders_to_be_added = genpath(pwd);
addpath(folders_to_be_added );

%Create figure for start screen.
f = figure('menubar','none','closereq', @Closefig);

%No Boundary
axes('Position',[0,0,1,1],'Xlim',[0 10],'Ylim',[0 5])

% Turn off axis.
axis off

%Create menu background.
rectangle('position',[0 0 10 5])
rectangle('position',[0 0 10 2],'facecolor',[0 0.5,0])
rectangle('position',[0 1.25 10 1],'facecolor','k')
rectangle('position',[0 2 10 1],'facecolor','k')
rectangle('position',[0 3 10 1],'facecolor','k')
rectangle('position',[0 4 10 1],'facecolor','g')


%%% Text that appears on screen%%%

%How to play.
text(0.75,1,{'How To Play'},'color','m','fontsize',18);

%Cross Road.
text(0.5,0.75,{'Cross the road without getting hit.'},'color','w','fontsize',12);

%WSAD.
text(0.5,0.5,{'Use W, S, A and D to move up, down,'},'color','w','fontsize',12);

%Key description.
text(0.5,0.25,{'left and right respectively.'},'color','w','fontsize',12);

%Title.
text(3.5,4.5,{'Frogger'},'color','k','fontsize',30,'fontweight','bold');

%Difficulty.
text(6.5,1,{'Choose Difficulty'},'color','r','fontsize',15);

%Draw frog icon.
xRana = 3.75+ 40.*[0.0 0.4 0.4 0.2 0.4 0.6 0.8 0.6 0.6 1.0 0.8  1.0 0.8 0.7 0.9 0.8 0.9   0.83 0.8 0.7 0.3 0.2   0.16 0.1 0.2 0.1 0.3 0.2 0.0 0.2]/16;
yRana =1.25+40.*[0.0 0.0 0.1 0.4 0.1 0.1 0.4 0.1 0.0 0.0 0.1  0.4 0.5 0.4 0.6 0.8 0.9   0.93 1.0 0.9 0.9 1.0   0.93 0.9 0.8 0.6 0.4 0.5 0.4 0.1]/16;
patch(xRana,yRana,'y','edgecolor','b');

%Menu music.
%Credit: Antonio Mele.
%[Opening, Opening_fps] = audioread('OPENING.mp3'); %PLACEHOLDER SOUND
%sound(Opening, Opening_fps);

%Flag for while loop.
a = 0;

%%
%Popup mneu to select difficulty.
c = uicontrol(f,'Style','popupmenu');
c.Position = [400 50 85 10];
c.String = {'Select','Easy','Hard','Hardest','Chaos'};
c.Callback = @selection;

    function selection(~,~)
        val = c.Value;
        str = c.String;
        disp(['Selection: ' str{val}]);   
    end

%%
%When figure is closed manually.
function Closefig(varargin)
a = 1;
clear sound
delete(gca)
delete(f)
end

%Check to see which difficulty is selected.
while a == 0

%Gets difficulty value.
diff = get(c,'Value');
%Refreshes every 0.5s.
pause(0.5)

%Easy mode is selected
if diff(1) == 2
    disp('Easy mode initiating...');
    pause(1)
    clear sound
    close(f)
    pause(0.5)
    Easymode()
    a = 1;

%Hard mode is selected
elseif diff(1) == 3
    disp('Hard mode initiating...');
    pause(1)
    clear sound
    close(f)
    pause(0.5)
    Hardmode()
    a = 1;

%Hardest mode is selected
elseif diff(1) == 4
    disp('Hardest mode initiating...');
    pause(1)
    clear sound
    close(f)
    pause(0.5)
    Hardestmode()
    a = 1;

%Chaos mode is selected
elseif diff(1) == 5
    disp('Chaos mode initiating...');
    pause(1)
    clear sound
    close(f)
    pause(0.5)
    Chaosmode()
    a = 1;   
end
end
end
