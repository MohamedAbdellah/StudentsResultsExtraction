%this function calculate the percentage grade of each student 
% input argument : a (matrix 24*7) represent the students grades
% output argumment : z (matrix 25*1*4)represent the percentage grade of each student
function z=studentRatio(a)
m=[100,100,100,100,50,150,150];
z=zeros(24,1);
for i=1:24
for j=1:7
   z(i,1)=z(i,1)+a(i,j);
end
end
z=(z/750)*100;
end
        
 