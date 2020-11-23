function task2()
 A = double(imread("in/images/image3.gif"));
 m=size(A)(1);
 n=size(A)(2);
 x=min(m,n);
 for k=1:x
  A_k = task1("in/images/image2.gif", k);
  c(k)=0;
  for i=1:m
    for j=1:n
     c(k)+= (A(i,j)-A_k(i,j))^2;
    endfor
  endfor
  c(k)/=(m*n);
endfor
 [U, S, V ] = svd(A);
 suma=0;
 j=0;
 for i=1:x
   vector(i)=S(i,i);
   suma+=S(i,i);
   sum(i)=suma;
 endfor
 
 k=1:x;
 figure(4)
 plot(k,k*(m+n+1)/(m*n),'LineWidth',2);
 
 k=1:min(m,n);
 figure(1)
 plot(k,vector(k),'LineWidth',2);
 grid;
 
 k=1:min(m,n);
 figure(2)
 plot(k,sum(k)/suma,'LineWidth',2);
 grid;

 k=1:min(m,n);
 figure(3)
 plot(k,c(k),'LineWidth',2);
 grid;
 

end