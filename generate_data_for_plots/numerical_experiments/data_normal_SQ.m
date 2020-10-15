function [EW] = data_normal_SQ(d, lambda,SCV,f,Bsize, N, tol)
%

if length(lambda) > 1
    iter=lambda; choice=1;
elseif length(SCV) > 1
    iter=SCV; choice=2;
elseif length(f) > 1
    iter=f; choice=3;
elseif length(d) > 1
    iter=d; choice=4;
else
    choice=5;
end

EW=zeros(1, length(iter));

if choice == 5
    [~, ER] = SQ_PH(lambda, d, Bsize, SCV, f, tol);
    EW(:)=ER-1;
else
    for i=1:length(iter)
        if choice == 1
            lambda=iter(i);
        elseif choice == 2
            SCV=iter(i);
        elseif choice==3
            f=iter(i);
        elseif choice == 4
            d=d_iter(i);
        end
        [~, ER] = SQ_PH(lambda, d, Bsize, SCV, f, tol);
        EW(i)=ER-1;
    end
end

end

