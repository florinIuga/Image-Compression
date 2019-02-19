function A_k = cerinta1(image,k)
  % mai intai, citim imaginea si obtinem matricea asociata
  myImage = imread(image);
  imageCompr = double(myImage);
  [U,S,V] = svd(imageCompr);
  % fac o copie valorilor singulare
  Sc = S;
  % eliminam valorile singulare care nu sunt necesare compresiei
  Sc(k+1:end, :) = 0;
  Sc(:,k+1:end) = 0;
  % creez noua imagine formata din valorile singulare dorite
  A_k = U*Sc*V';
endfunction
