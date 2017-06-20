%this function calculate the number of successfel  student in the each section
% input argument : a (matrix 24*7) represent the students grades
% output argumment : z (matrix 25*1)represent the percentage grade of each student
function [succ]=succStudentNoSection(a)
m=[100,100,100,100,50,150,150];
succ=[0,0,0,0];
f=0;
for k=1:4
for i=1:24
for j=1:7
   if a(i,j)>=(m(j)/2)
        f=f+1;
        if f>=5
            succ(k)=succ(k)+1;
            f=0;
            break
        end
end
end
end
end
end