%this function calculate the number of successful students in each subject
% input argument : a (matrix 24*7) represent the students grades
% output argumment : r (matrix 7*1)represent the successfel student in each subject  
function r=succRate(a)
m=[100,100,100,100,50,150,150];
r=[0,0,0,0,0,0,0];

for j=1:7
for i=1:24
   if a(i,j)>=(m(j)/2)
        r(j)=r(j)+1;
   end
end
end
end