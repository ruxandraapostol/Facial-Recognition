function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  C=double(rgb2gray(imread(image_path)));
   mi = size(C)(1);
   n = size(C)(2);
   linie = 1;
   for i=1:mi
     for j=1:n
       X(linie) = C(i,j);
       linie++;
     endfor
   endfor
   for i=1:(linie-1)
     X(i)-=m(i);
   endfor
 X=transpose(X);
 PrTestImg=transpose(eigenfaces)*X;
 min=norm(PrTestImg-pr_img(:,1),2);
 for i=2:size(pr_img)(2)
   s=norm(PrTestImg-pr_img(:,i),2);
   if(s<min)
     min=s;
     output_img_index=i;
   endif
endfor
min_dist = min;
end