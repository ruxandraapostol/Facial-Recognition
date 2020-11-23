function [A_k S] = task4(image, k)
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
   
   Z=A*(A')/(n-1);
   
   [V, S] = eig(Z);
   
   for i=m-k+1:m
     j=i-m+k;
     W(1:m,j)=V(1:m,i);
    endfor
   
   Y=(W')*A; 
   
   A_k=W*Y;
   nr1 = size(A_k)(1);
   nr2 = size(A_k)(2);
   for i=1:nr1
     for j=1:nr2
       A_k(i,j)+=miu(i);
       endfor
   endfor
endfunction
