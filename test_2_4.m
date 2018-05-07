%opdracht 2.4

%for n = 5 : 30
   g = 2/(n+6);
   i = 1;
   disp(g);
   for q = -1:g:1
     i = 1;   
     t(i) = q;
     i = i + 1;
   end
   disp(t);
   %[s] = deBoor();
%end