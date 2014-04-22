function [ F,excess,seen,height ] = discharge( C, F, excess, height, seen, u, n, INF )
    while (excess(u) > 0)
        if (seen(u) < n)
          v = seen(u);
          if (v == 0)
            v = 1;
          end
          if ((C(u,v) - F(u,v) > 0) && (height(u) > height(v)))
            [F,excess] = push(C, F, excess, u, v);
          else
            seen(u) = seen(u) + 1;
          end
        else
          height = relabel(C, F, height, u, INF, n);
          seen(u) = 1;
        end
    end
end

