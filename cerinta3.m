function [A_k,S] = cerinta3(image,k)
 % citim imaginea si asociem matricea
 myImage = imread(image);
 A = double(myImage);
 % numarul de linii si de coloane
 [m,n] = size(A);
 M = zeros(m,1);
 % calculez urmatoarea medie pentru fiecare vector a_i
  for i = 1:m
   s = 0;
    for j = 1:n
       s = s + A(i,j);
       
    endfor
      M(i) = s/n;
  endfor
 
  % actualizez vectorii a_i
  for i = 1:m
    A(i,:) = A(i,:) - M(i);
  endfor
  % construiesc matricea Z
  Z = A'/sqrt(n-1);
  % calculez DVS pentru matricea Z
  [U,S,V] = svd(Z);
  [l,p] = size(V);
  W =  zeros(l,k);
  % W reprezinta spatiul k-dimensional al componentelor principale (primele k coloane din V)
  for i = 1:k
    W(:,i) = V(:,i);
  endfor
  % calculez proiectia lui A in spatiul componentelor principale
  Y = W' * A;
  % aproximam matricea initiala
  A_k = W * Y + M;

endfunction
