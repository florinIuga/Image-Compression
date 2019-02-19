function cerinta2()
 figure(1)   
   % task1
   A = double(imread("in/images/image1.gif"));
   % decomenteaza pentru a aplicat algoritmul pentru image2
   % A = double(imread("in/images/image2.gif"));
   [U1,S1,V1] = svd(A);
   [m1 n1] = size(A);
   vec = diag(S1);
   % sortez vectorul in ordine descrecatoare
   vec_sorted = sort(vec, 'descend');
  subplot(2,2,1);
  plot(vec_sorted);
  title('Toate valorile singulare');
  errVec = [];
  singVal = []; 
   % task2
   contor = 1;
   % construiesc vectorul cu numerele de valori singulare
   for i = [1:19 20:20:99 100:30:min(m1,n1)]
     k(contor) = i;
     contor = contor + 1;
   endfor
   
   for i = 1:length(k)
    s = 0;
    
    A_k = cerinta1("in/images/image1.gif",k(i));
    % decomenteaza pentru a aplicat algoritmul pentru image2
    % A_k = cerinta1("in/images/image2.gif",k(i));
    % pentru task3
    % calculez fiecare eroare
    err = (sum(sum((A-A_k).^2)))/(m1*n1);
    % si o adaug in vectorul de erori(pentru plot)
    errVec = [errVec, err];
    % adaug si numarul de valori singulare in vectorul de valori singulare
    singVal = [singVal, k(i)];
    % aplic SVD pe fiecare matrice A_k
    [U,S,V] = svd(A_k);
    % pentru task2 
    % calculez prima suma
      l = length(k);
     for j = 1:k(i)
        s = s + S1(j,j);
       endfor
     sum1(i) = s;

   endfor
   % calculez a doua suma
   % si aflu informatia furnizata de primele k valori singulare
    sum2 = 0;
    for i = 1:min(m1,n1)
     sum2 = sum2 + S1(i,i);
    endfor
  for i = 1:length(k)
    info(i) = sum1(i)/sum2;
  endfor
   subplot(2,2,2);
   plot(k,info);
   title('Informatia furnizata de primele k valori singulare');
   % task3
   subplot(2,2,3);
   plot(singVal, errVec);
   title('Eroarea de aproximare cu k valori singulare');
   % task4
   rate = [];
   % calculez rata de compresie a datelor pentru fiecare element din k
   for i = 1:length(k)
     r = (m1*k(i) + n1*k(i) + k(i))/(m1*n1);
     rate = [rate,r];
   endfor
   subplot(2,2,4);
   plot(k,rate);
   title('Rata de compresie a datelor');

   
    
endfunction
