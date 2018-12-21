maximum_x = 19
maximum_y = 9
grid = zeros(maximum_x,maximum_y)



%Starting position (CAR)
x = 10
y = 1
grid(x,y) = 1

length = 1
posX = zeros(1)
posY = zeros(1)
posX(1) = x;
posY(1) = y;

fig1 = figure
set(fig1,'menubar','none')
set(fig1,'CurrentObject',imagesc(grid));

for i = 1:1000000
     
            grid(posX(1),posY(1)) = 0
            
            posX(1) = x;
            posY(1) = y;
            
            grid(x,y) = 1;
            if y>9
                y =1
                posY(1) = y
                pause(0.5)
            else
                y = y+1
                posY(1) = y
                pause(0.5)
            end
            set(fig1,'CurrentObject',imagesc(grid));
            
     
end