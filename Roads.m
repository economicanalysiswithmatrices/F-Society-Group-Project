function Roads() 

function Car_row1()


axis equal
xlim([0.5 10])
ylim([0 5])

car = hgtransform;
rectangle('position',[0.5 0 1 1],'facecolor', 'b','parent',car) ;


pt1 = [10 1 0];
pt2 = [0.5 1 0];


for  R = 1:1000
for t=linspace(0,1,200)
  car.Matrix = makehgtform('translate',pt1 + t*(pt2-pt1))
  drawnow
  
  if t == 0
      for t=linspace(0,1,200)
  car.Matrix = makehgtform('translate',pt1 + t*(pt2-pt1))
  drawnow
      end
  end
end
end
end
function Car_row2()


axis equal
xlim([0.5 10])
ylim([0 5])

car2 = hgtransform;
rectangle('position',[0.5 1 3 1],'facecolor', 'b','parent',car2) ;


pt1_2 = [10 2  0];
pt2_2 = [0.5 2 0];


for  R = 1:1000
for t=linspace(0,1,200)
  car2.Matrix = makehgtform('translate',pt1_2 + t*(pt2_2-pt1_2))
  drawnow
  
  if t == 0
      for t=linspace(0,1,200)
  car2.Matrix = makehgtform('translate',pt1_2 + t*(pt2_2-pt1_2))
  drawnow
      end
  end
end
end
end

end




