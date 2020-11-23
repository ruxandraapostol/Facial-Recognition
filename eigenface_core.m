function [m A eigenfaces pr_img] = eigenface_core(database_path)
for nr=1:10
   path = database_path;
   path = strcat (path, "/");
   path = strcat(path, int2str(nr));
   path = strcat (path, ".jpg");
   C=double(rgb2gray(imread(path)));
   mi = size(C)(1);
   n = size(C)(2);
   coloana = nr;
   linie = 1;
   for i=1:mi
     for j=1:n
       A(linie,coloana) = C(i,j);
       linie++;
     endfor
   endfor
 endfor
 linie--;
 for i=1:linie
   suma = 0;
   for j=1:10
     suma+=A(i,j);
   endfor
   m(i)=suma/10;
   for j=1:10
     A(i,j)-=m(i);
   endfor
 endfor
 L = A'*A;
 [Vec,Val] = eig(L);
 V=Vec(:,diag(Val)>1);
 eigenfaces = A*V;
 pr_img = eigenfaces'*A;
end