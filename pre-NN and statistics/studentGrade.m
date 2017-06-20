%this function calculate the percentage grade of each student 
% input argument : a (matrix 24*7) represent the students grades
% output argumment : z (matrix 25*1)represent the percentage grade of each student
function s=studentGrade(a)
z=studentRatio(a);
s=0;
for i=1:24
     if z(i)>=50
        s=s+1;
     end
end
end

        
 