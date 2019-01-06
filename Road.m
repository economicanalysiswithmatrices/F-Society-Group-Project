%Create empty road
%Choose initial position 
%Move the vehichles with a time functino
%use imagesc

rw = 1;%road width
rl = 10; %road length

road = zeros(rw,rl) %This is the empty road (We will need multiple of these to make different lanes)

%The initial position of the car x and y

xpos=1; 
ypos=2;

road(ypos,xpos) = 0;

imagesc(road)
axis equal
for t = 0 : 8
    
    road(ypos,xpos) = 0;
    
    xpos = xpos + 1;      
    road(ypos,xpos) = 1;
    
    imagesc(road)
    axis equal
    pause(0.1);

end

