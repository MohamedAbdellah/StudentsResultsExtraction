%%
% This part to perform character regonation
w = imread('rdy.jpg');
ocrResults=ocr(w);
aa=ocrResults.Words;


%%
%  This part to evalute the statistics about the results
a=genRand();

%%
succStudent=succRatio(res)
failStudent=24-succStudent

%%
% ========================================================

NoSeccStudentinCourses=succRate(res)
NoFailStudentinCourses=24-NoSeccStudentinCourses

% ========================================================

SuccStudentNoinSection=succStudentNoSection(res)

figure
subplot(3,1,1), pie(NoSeccStudentinCourses),title('No of Secc Student in courses')
subplot(3,1,2), pie(NoFailStudentinCourses),title('No of Fail Student in courses')
subplot(3,1,3), pie(SuccStudentNoinSection),title('No of Secc Student disrubted in Section')
