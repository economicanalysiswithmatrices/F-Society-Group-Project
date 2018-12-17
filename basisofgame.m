
%NOTE: inspiration taken from 
%      https://gist.github.com/andydonzelli/65040b7f709df073a67e




function MoveCow()


%Size of playing field
maximum_x = 19
maximum_y = 9
grid = zeros(maximum_x,maximum_y)



%Starting position (Cow)
x = 19
y = 5
grid(x,y) = 1

%Cow stuff
length = 1
posX = zeros(1)
posY = zeros(1)
posX(1) = x;
posY(1) = y;

over = 0

%Creating the figure
fig1 = figure;
set(fig1,'menubar','none');



set(fig1,'CurrentObject',imagesc(grid));
set(fig1,'KeyPressFcn',@PressKey);
    

    %used to register key press (any key)
    function PressKey (~,arrow)
        moveFrog(arrow.Key)
        
        
    end
    
    function moveFrog(dir)
        movedir(dir);
        
        if over == 0
            grid(posX(1),posY(1)) = 0
            
            posX(1) = x;
            posY(1) = y;
            
            grid(x,y) = 1;
            set(fig1,'CurrentObject',imagesc(grid));
        end
    end

    %Move in direction of 'dir' key
    
    function movedir(dir)
       
           switch(dir)
               case 'uparrow'
                   if x < 2            
                       x = x
                   elseif (x==1)
                       Over();
                       
                  
                   else
                       x = x-1
                   end
               case 'downarrow'
                   if x > 18
                       x = x
                   elseif (x==1)
                       Over();
                       
                   else
                       x = x+1
                   end 
               case 'rightarrow'
                   if y >9
                       y = y
                   
                   elseif (x==1)
                       Over();
                       
                   else
                       y = y+1
                   end
               case 'leftarrow'
                   if y <2
                       y = y
                   
                   elseif (x==1)
                       Over();                      
                   else
                       y = y-1
                   end 
       
       
    end

    %When the game is done
    function Empty(~,~)
    end
            
       
   
    %Finish game on winstate
    function Over()
        set(fig1,'KeyPressFcn',@Empty);
        set(fig1,'CurrentObject',imagesc(grid));
        pause(0.01)
        close(fig1);
        disp('You win!')
        over = 1;
    end
end
        
            
            
    
            
            

end
