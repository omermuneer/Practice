%   Maud
%   Project

%   Clearing the Previous Data
clear all;
%   Input from the User
Input = input('Enter the Name of the Image to be Seen from Some Distance : ');
%   Reading the First Image
im = imread(Input);
im = im2single(im);
im = double(im);
%   User Input for the Value of Sigma
sigma=input('Enter the value of sigma for image to be seen from some distance : ');
%   Calculating Size of the Mask
n=floor(4*sigma+1);
%   Initializing the Mask with zeros
maskG =zeros(n,n);
%   Calculating the Values of the Mask
for r=1:n
    for c=1:n
       maskG(r,c)= (exp(-(((floor(-((n/2)-r))))^2+(floor(-((n/2)-c)))^2)/(2*sigma^2))/(2*pi*sigma));
%        maskG(r,c) = maskG(r,c)*(1/(2*pi*sigma));
    end
end
maskG = maskG / sum(sum(maskG));

imageSize = size(im);
%   Initializing the Filtered Image of Size of the Image im with Zeros
filtered = zeros(size(im,1),size(im,2),size(im,3));
%   Multiplying Values of the Mask with the Image
for i=(n+1)/2:imageSize(1)-(((n+1)/2)-1)
    tic
    for j=(n+1)/2:imageSize(2)-(((n+1)/2)-1)
		Red=0;
		Green=0;
		Blue=0;
        
        for m=1:n
            for b=1:n
                %   Multiplying the Values of Mask with Red
                Red = Red+(im(m+(i-((n+1)/2)),b+(j-((n+1)/2)),1)*maskG(m,b));
                %   Multiplying the Values of Mask with Green
                Green = Green+(im(m+(i-((n+1)/2)),b+(j-((n+1)/2)),2)*maskG(m,b));
                %   Multiplying the Values of Mask with Blue
                Blue = Blue+(im(m+(i-((n+1)/2)),b+(j-((n+1)/2)),3)*maskG(m,b));
            end
        end
        %   Filtered Image of Red 
		filtered(i,j,1)=Red;
        %   Filtered Image of Green
		filtered(i,j,2)=Green;
		%   Filtered Image of Blue 
        filtered(i,j,3)=Blue;
		
    end
    toc
end
%   Filtered Image
imwrite ((filtered),'output1.jpg','jpeg','quality',95);

%   Input from the User
Input2= input('Enter Name of the Image to be seen from Near : ');
%   Read second Image
im1 = imread(Input2);
im1 = im2single(im1);
im1 = double(im1);
%   User Input for the Value of Sigma
sigma1=input('Enter the value of sigma for image to be seen from near : ');
%   Calculating Mask Size
n=floor(4*sigma1+1);
Gmask =zeros(n,n);
%   Calculating values of the Mask
for r=1:n
    for c=1:n
       Gmask(r,c)= (exp(-(((floor(-((n/2)-r))))^2+(floor(-((n/2)-c)))^2)/(2*sigma1^2))/(2*pi*sigma));
       %Gmask(r,c) = Gmask(r,c)*(1/(2*pi*sigma1));
    end
end
Gmask = Gmask / sum(sum(Gmask));
%   Initializing the Filtered Image of Size of the Image im1 with
%   Zeros
filtered1 = zeros(size(im1,1),size(im1,2),size(im1,3));
%   Multiplying Values of the Mask with the Image
for i=floor((n/2)+1): size(im1,1)-((n/2)+1)
    tic
    for j=floor((n/2)+1): size(im1,2)-((n/2)+1)
		Red=0;
		Green=0;
		Blue=0;
        for m=1:n
            for b=1:n
                %   Multiplying the Values of Mask with Red
                Red = Red+(im1(m+(i-((n+1)/2)),b+(j-((n+1)/2)),1)*Gmask(m,b));
                %   Multiplying the Values of Mask with Green
                Green = Green+(im1(m+(i-((n+1)/2)),b+(j-((n+1)/2)),2)*Gmask(m,b));
                %   Multiplying the Values of Mask with Blue
                Blue = Blue+(im1(m+(i-((n+1)/2)),b+(j-((n+1)/2)),3)*Gmask(m,b));
            end
        end
        %   Filtered Image of Red
		filtered1(i,j,1)=Red;
        %   Filtered Image of Green
		filtered1(i,j,2)=Green;
        %   Filtered Image of Blue
		filtered1(i,j,3)=Blue;
		
    end
    toc
end
%   Subtract Filtered Image from Original Image(im1)
filtered2 = imsubtract(im1,filtered1);
imwrite ((filtered2),'output2.jpg','jpeg','quality',95);
%   Hybrid Image
Himg = imadd(filtered,filtered2);
imwrite ((Himg),'output.jpg','jpeg','quality',95);
