function [EW] = data_plot_EW(d,lambda,SCV,f,type,Delta,RepMax,threshold,Bsize,tol,good_threshold)
%


 if ~exist('good_threshold','var')
      good_threshold=false;
 end

if length(lambda) > 1
    iter=lambda; choice=1;
elseif length(SCV) > 1
    iter=SCV; choice=2;
elseif length(f) > 1
    iter=f; choice=3;
elseif length(Delta) > 1
    iter=Delta; choice=4;
elseif length(d) > 1
    iter=d; choice=5;
elseif length(threshold) > 1
    iter=threshold; choice=6;
end

EW=zeros(size(iter));

for i=1:length(iter)
    ceil((i./length(iter))*100)
    if choice == 1
        lambda=iter(i);
    elseif choice == 2
        SCV=iter(i);
    elseif choice == 3
        f=iter(i);
    elseif choice == 4
        Delta=iter(i);
    elseif choice == 5
        d=iter(i);
    elseif choice == 6
        threshold=iter(i);
    end
    
    if good_threshold
        [~, ~, mu, ~] = hyperexponential_init(1, SCV, f);
        EX1=1./mu(1);
        threshold=2*EX1;
        for qwop=1:1000000000
            if qwop*Delta >= threshold
                Delta=threshold/qwop;
                RepMax=Delta*(500-0.5);
                break
            end
        end
    end
    
    [k_indxs, l_indxs, r, greater, greater_or_eq] = sorted_kl_indxs(SCV, f,type,Delta,RepMax,Bsize,threshold);
    if i == 1
        [lambdas] = init_lambda(r, Bsize);
    end
    [EW(i), lambdas, ~, ~, ~] = simple_kl_PH_mex(d,lambda,SCV,f,Delta,Bsize,r,k_indxs, l_indxs, greater, greater_or_eq, tol, lambdas); 
end

end