%this function calculate the number of successfel  student in the whole group 
% input argument : a (matrix 24*7) represent the students grades
% output argumment : z (matrix 24*1)represent the percentage grade of each student
function s=succStudentNo(a)
z=studentRatio(a);
s=0;
for k=1:4
for i=1:24
     if z(i,1,k)>=50
        s=s+1;
     end
end
end

        
 