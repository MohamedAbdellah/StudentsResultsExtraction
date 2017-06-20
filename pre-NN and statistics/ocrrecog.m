%%
%Read the actual image,then add filter to it
c=imread('R4adja22.jpg');
R4=imread('RR4.png');             %Read the frst section data
R3=imread('RR4.png');             %Read the sec section data
R2=imread('RR4.png');             %Read the thrd
R1=imread('RR4.png');
f1=c+R1;
f1= imcrop(f1,[440 471 629 1511]) ;
f1 = imresize(f1,[1024 1024]);
figure ,imshow(R1)
figure ,imshow(c)
figure ,imshow(f1)
imwrite(f1,'R6adj11.png');
%%
% Now you have to start the NN to genrate the text file that contains the
% result

%to start the NN do as follow:
%1- open main.m
%2- choose the image 
% this link describe how the NN work
% https://www.youtube.com/watch?v=aX92H8pcjfg&t=3s

%%
fileContents = fileread('Arabic_output.txt');

%%
cunt=1;
for i=1:359
          r = i/15;
         r=floor(r)+1;
            g(r,cunt)=fileContents(i);
           
           if(cunt==15)
               cunt=0;
           end
           cunt=cunt+1;
end
%%
cunt=0;

for i=1:24
    for j=2:2:15
         cunt=cunt+1;
         char=g(i,j);
 
         if char=='a'
         res(i,cunt)=88;      
         
         elseif char=='e'
         res(i,cunt)=78;
         
         elseif char=='g'
         res(i,cunt)=68;
         
         elseif char=='p'
         res(i,cunt)=58;
         
         elseif char=='m'
         res(i,cunt)=45;
         
         elseif char=='w'
         res(i,cunt)=35;
         
         elseif char=='f'
         res(i,cunt)=30;
         end
           
         if cunt==7
         cunt=0;
         end
         
    end
    
end
%%
for i=1:24
    for j=5:6
   res(i,j)=res(i,j)+25;
    end 
end


%%
%calculate the number of succ and failed student
succStudent=succRatio(res)
failStudent=24-succStudent
%%
SuccinSection=[succStudent,24-succStudent];
FailedSection=[failStudent,24-failStudent];
% ========================================================

NoSeccStudentinCourses=succRate(res)
NoFailStudentinCourses=24-NoSeccStudentinCourses

% ========================================================

SuccStudentNoinSection=succStudentNoSection(res)
FailStudentNoinSection=24-SuccStudentNoinSection
figure
subplot(4,1,1), pie(NoSeccStudentinCourses),title('NO of Secc Student in courses')
subplot(4,1,2), pie(NoFailStudentinCourses),title('NO of Fail Student in courses')
subplot(4,1,3), pie(SuccinSection),title('NO of Secc Student VS NO of failed student in Section')



%%
clc
clear

        
        

%%


%%
%===================================== Quiz ==============================
%display an image and its histogram
I = imread('circuit.tif');
figure, subplot(2,2,1), imshow(I), title('Image')
subplot(2,2,2), imhist(I,256), axis tight, title('Histogram')

%%
%histogram with 64 and 32 bin
subplot(2,2,3), imhist(I,64), axis tight, title('Histogram with 64 bins')
subplot(2,2,4), imhist(I,32), axis tight, title('Histogram with 32 bins')
%%
%get the value of each bin
c_32 = imhist(I,32);
c_64 = imhist(I,64);

%%
%normalize the value 
c_norm32 = c_32 / numel(I);
c_norm64 = c_64 / numel(I);
%%
%display the histogram data
figure , subplot(2,2,1), bar_1= bar(c_32),title('Histogram data 32');
set(gca, 'XLim', [0 32], 'YLim', [0 max(c_32)]);


 subplot(2,2,2), bar_1=bar(c_64),title('Histogram data 64');
set(gca, 'XLim', [0 32], 'YLim', [0 max(c_64)]);
%%
%change the colour of the bar chart
%ERROR
set(gca, 'XTick', [0:8:32], 'YTick', [linspace(0,7000,8) max(c)]);
set(bar_1, 'FaceColor', 'r'), title('Bar Chart')
%%
%display the normalized bar chart
subplot(1,2,2), bar_2 = bar(c_norm32);
set(gca, 'XTick', [0:8:32], 'YTick', [linspace(0,0.09,10) ,max(c_norm32)])
xlim([0 32]), ylim([0 max(c_norm32)])
title('Normalized Bar Chart')
set(bar_2, 'FaceColor', 'g')
%%
%display stem chart for  standered histogram data
subplot(2,2,1), stem(c_32,'fill','MarkerFaceColor','red'), axis tight ,title('Stem Chart 32')
subplot(2,2,2), stem(c_64,'fill','MarkerFaceColor','red'), axis tight ,title('Stem Chart 64')
%%
%display stem chart for normalized histogram data
subplot(2,2,1), stem(c_norm32,'fill','MarkerFaceColor','red'), axis tight, title('Normalized Stem Chart 32')
subplot(2,2,2), stem(c_norm64,'fill','MarkerFaceColor','red'), axis tight, title('Normalized Stem Chart 64')
%%
%Display a plot graph for normalized histogram data
figure, subplot(1,2,1), plot(c_32), axis auto, title('Plot Graph')
subplot(1,2,2), plot(c_norm32), axis auto, title('Normalized Plot Graph')

figure, subplot(1,2,1), plot(c_64), axis auto, title('Plot Graph')
subplot(1,2,2), plot(c_norm64), axis auto, title('Normalized Plot Graph')
%%
%dispaly an image and its histogram
I = imread('pout.tif');
figure, subplot(2,2,1), imshow(I), title('Original Image')
subplot(2,2,2), imhist(I), title('Original Histogram')
%%
%perform image equalization
I_eq = histeq(I,256);
subplot(2,2,3), imshow(I_eq), title('Equalized Image')
subplot(2,2,4), imhist(I_eq), title('Equalized Histogram')
%%
%display an original and equalized inamges
I = imread('tire.tif'); I_eq = histeq(I,256);
figure, subplot(2,2,1), imshow(I), title('Original Image')
subplot(2,2,2), imhist(I), title('Original Histogram')
subplot(2,2,3), imshow(I_eq), title('Equalized Image')
subplot(2,2,4), imhist(I_eq), title('Equalized Histogram')
%%
%display an original and equalized inamges
I = imread('eight.tif'); I_eq = histeq(I,256);
figure, subplot(2,2,1), imshow(I), title('Original Image')
subplot(2,2,2), imhist(I), title('Original Histogram')
subplot(2,2,3), imshow(I_eq), title('Equalized Image')
subplot(2,2,4), imhist(I_eq), title('Equalized Histogram')
%%
%Display the normalized cdf for the eight.tif image
I_hist = imhist(I); tf = cumsum(I_hist); tf_norm = tf / max(tf);
figure, plot(tf_norm), axis tight
%%
%The transformation function
[newmap, T] = histeq(I);
figure, plot(T)
%%
%display an image and its histogram
img1 = imread('pout.tif');
figure, subplot(3,3,1), imshow(img1), title('Original Image')
subplot(3,3,2), imhist(img1), title('Original Histogram')
%%
%Display the image after histogram equalization for comparison
img1_eq = histeq(img1); m1 = ones(1,256)*0.5;
subplot(3,3,4), imshow(img1_eq), title('Equalized Image')
subplot(3,3,5), imhist(img1_eq), title('Equalized Histogram')
subplot(3,3,6), plot(m1), title('Desired Histogram Shape'), ...
ylim([0 1]), xlim([1 256])
%%
%
m2 = linspace(0,1,256); img2 = histeq(img1,m2);
subplot(3,3,1), imshow(img2), title('Matched Image')
subplot(3,3,2), imhist(img2), title('Matched Histogram')
subplot(3,3,3), plot(m2), title('Desired Histogram Shape'), ...
ylim([0 1]), xlim([1 256])
%%
%Perform local histogram equalization on the coins image
I = imread('coins.png');
I_eq = histeq(I,256);
I_leq = adapthisteq(I,'ClipLimit',0.1);
figure, subplot(3,2,1), imshow(I), title('Original Image')
subplot(3,2,2), imhist(I), title('Original Histogram')
subplot(3,2,3), imshow(I_eq), title('Equalized Image')
subplot(3,2,4), imhist(I_eq), title('Equalized Histogram')
subplot(3,2,5), imshow(I_leq), title('Local Histogram Equalization')
subplot(3,2,6), imhist(I_leq), title('Local Hist Equalization Histogram')
%%
%display original image
J = imread('pout.tif');
I = im2double(J);
clear J
figure, subplot(3,2,1), imshow(I), title('Original Image')
subplot(3,2,2), imhist(I), axis tight, title('Original Histogram')
%%
%a brighter version of the input image by adding 0.1 toeach pixel
const = 0.1;
I2 = I + const;
subplot(3,2,3), imshow(I2), title('Original Image + 0.1')
subplot(3,2,4), imhist(I2), axis tight, title('Original Hist + 0.1')
%%
%a brighter version of the input image by adding 0.5 toeach pixel
const = 0.5;
I3 = I + const;
bad_values = find(I3 > 1);
I3(bad_values) = 1;
subplot(3,2,5), imshow(I3), title('Original Image + 0.5')
subplot(3,2,6), imhist(I3), axis tight, title('Original Hist + 0.5')
%%
%ERROR
J = imadjust(I,[low_in; high_in],[low_out; high_out], gamma)
%%
%code to see histogram stretching on the pout image
img_limits = stretchlim(I);
I_stretch = imadjust(I,img_limits,[]);
figure
subplot(3,2,1), imshow(I), title('Original Image')
subplot(3,2,2), imhist(I), axis tight, title('Original Histogram')
subplot(3,2,3), imshow(I_stretch), title('Stretched Image')
subplot(3,2,4), imhist(I_stretch), axis tight, title('Stretched Histogram')
%%
I_stretch2 = imadjust(I);
subplot(3,2,5), imshow(I_stretch2), title('Stretched Image')
subplot(3,2,6), imhist(I_stretch2), axis tight, title('Stretched Histogram')
I_stretch_diff = imabsdiff(I_stretch, I_stretch2);
figure, imshow(I_stretch_diff,[])
min(I_stretch_diff(:))
max(I_stretch_diff(:))
%%
%original image and sherink image 
I = imread('westconcordorthophoto.png');
I_shrink = imadjust(I,stretchlim(I),[0.25 0.75]);
figure
subplot(2,2,1), imshow(I), title('Original Image')
subplot(2,2,2), imhist(I), axis tight, title('Original Histogram')
subplot(2,2,3), imshow(I_shrink), title('Shrunk Image')
subplot(2,2,4), imhist(I_shrink), axis tight, title( 'Shrunk Histogram')
%%
X = reshape(I,1,prod(size(I)));
Y = reshape(I_shrink,1,prod(size(I_shrink)));
figure, plot(X,Y,'.')
xlim([0 255]); ylim([0 255]);
xlabel('Original Image');
ylabel('Adjusted Image');
%%
I_shrink = imadjust(I,stretchlim(I),[0.25 0.75],2);
X = reshape(I,1,prod(size(I)));
Y = reshape(I_shrink,1,prod(size(I_shrink)));
figure
subplot(2,2,1), imshow(I), title('Original Image')
subplot(2,2,2), imhist(I), axis tight, title('Original Histogram')
subplot(2,2,3), imshow(I_shrink), title('Adjusted Image')
subplot(2,2,4), imhist(I_shrink), axis tight, title('Adjusted Histogram')
figure, plot(X,Y,'.'), xlim([0 255]), ylim([0 255])