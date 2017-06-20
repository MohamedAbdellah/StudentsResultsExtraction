% this function calculate the percentage of the successful students in the all group
% input argument : a (matrix 24*7) represent the students grades
% output argumment : succ (variable)represent the success ratio
function succ=succRatio(a)
m=[100,100,100,100,50,150,150];
succ=0;
f=0;
for i=1:24
for j=1:7
   if a(i,j)>=(m(j)/2)
        f=f+1;
        if f>=5
            succ=succ+1;
            f=0;
            break
        end
end
end

%succ=(succ/24)*100;

end
