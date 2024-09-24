function calcAnalitico = calcAnalitico(p,k,n)
                                                %N - número de experiências
     calcAnalitico= nchoosek(n,k)*p^k*(1-p)^(n-k);       %p - probabilidade
                                                %k - número de peças   
end                                             % nchoosek(n,k)= n!/(n-k)!/k!    
                                                %n - número de lançamentos