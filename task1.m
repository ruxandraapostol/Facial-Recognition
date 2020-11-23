function A_k = task1(image, k)
  A = double(imread(image));
  
  [U, S, V ] = svd(A);
  nr_l = size (A)(1);
  nr_c = size (A)(2);
  
  Uk = zeros (nr_l,nr_l);
  Sk = zeros (nr_l,nr_c);
  Vk = zeros (nr_c,nr_c);
  
  for i = 1:k
    Uk(:,i) = U(:,i);
    for j = 1:k
      Sk(i,j)=S(i,j);
    endfor
    Vk(:,i) = V(:,i);
  endfor
  
  A_k = Uk*Sk*(Vk');
end