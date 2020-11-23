function [A_k S] = task3(image, k)
   A = double(imread(image));
   m= size(A)(1); %linii
   n = size(A)(2); %coloane
   
   for i=1:m
     s=0;
     for j=1:n
       s+=A(i,j);
     endfor
     miu(i)=s/n;
    endfor
    
   for i=1:m
     for j=1:n
       A(i,j)-=miu(i);
       endfor
   endfor
   Z=A'/sqrt(n-1);
   [U, S, V ] = svd(Z);
   for i=1:k
     W(1:m,i)=V(1:m,i);
    endfor
   Y=(W')*A; 
   A_k=W*Y;
   for i=1:m
     for j=1:n
       A_k(i,j)+=miu(i);
       endfor
   endfor
endfunction