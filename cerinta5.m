function cerinta5()
   
   % task1
   A = double(imread("in/images/image1.gif"));
   % decomenteaza pentru a aplicat algoritmul pentru image2
   % A = double(imread("in/images/image2.gif"));
   [U1,S1,V1] = svd(A);
   [m1 n1] = size(A);
   vec = diag(S1);
   subplot(2,2,1);
   plot(vec);
   title('Toate valorile singulare');
   errVec = [];
   singVal = []; 
   % task2
   % construiesc vectorul cu numarul de valori singulare
   contor = 1;
   for i = [1:19 20:20:99 100:30:min(m1,n1)]
     k(contor) = i;
     contor = contor + 1;
   endfor
   
   for i = 1:length(k)
    s = 0;
    % pentru fiecare numar de valori singulare am o matrice A_k
    [A_k,S] = cerinta3("in/images/image1.gif",k(i));
    % decomenteaza pentru a aplica algoritmul pentru image2
    % [A_k,S] = cerinta3("in/images/image2.gif",k(i));
    % calculez eroarea pentru task3
    err = (sum(sum((A-A_k).^2)))/(m1*n1);
    % o adaug in vectorul de erori
    errVec = [errVec, err];
    singVal = [singVal, k(i)];

   % [U,S,V] = svd(A_k);
     % calculez suma pentru fiecare numar de valori singulare
      l = length(k);
     for j = 1:k(i)
        s = s + S(j,j);
     endfor
     sum1(i) = s;
   endfor
   % calculez suma2
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
   % calculez rata de compresie a datelor
   for i = 1:length(k)
     r = (2*k(i) + 1)/n1;
     rate = [rate,r];
   endfor
  
   subplot(2,2,4);
   plot(k,rate);
   title('Rata de compresie a datelor');    
endfunction

