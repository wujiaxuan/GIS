function [ max_flow ] = push_relabel_sample( C, E, n )
INF = 20;
F = zeros(n);
 excess = zeros(1,n);
  height = zeros(1,n);
  seen = zeros(1,n);
  list = zeros(1,n-2);
  
  for i=1:n-2
      list(i) = i+1;
  end
  
  height(1) = n;
  excess(1) = INF;
  for i=1:n
    [F,excess] = push(C, F, excess, 1, i);
  end
  p = 1;
  while (p <= n - 2 && p >= 1)
     u = list(p);
     old_height = height(u);
     [ F,excess,seen,height ] = discharge(C, F, excess, height, seen, u, n, INF);
     if (height(u) > old_height)
       list = move_to_front(p,list);
       p = 1;
     else
       p = p + 1;
     end
  end
  max_flow = 0;
   for i=1:n
     max_flow = max_flow + F(1,i);
   end
end

