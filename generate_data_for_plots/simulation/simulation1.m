addpath('../../simulation_code')
addpath('../../general_functions')


%% lambda = 0.7, Delta=0.01, Bsize=40, d=3, type 1, Hyperexponential jobs SCV = 10 & f = 1/2
clear variables
nruns=40;
N_iter=[10 50 100 500 1000 2000];

d=3; lambda=0.7;
SCV=10; f=1/2; EX=1;
type=1;
Delta=0.01;
RepMax=40;
Bsize=30; tol=10^(-10);
threshold=0;
EW=zeros(1, length(N_iter)+1);

for i=1:length(N_iter)
    N=N_iter(i)
    runlen=10^7/N;
    [~,~,EW(i)]=simulSQd_HEXP_mex(d,N,lambda,EX,SCV,f,nruns,runlen,type,Delta,RepMax,Bsize,threshold);
end


[k_indxs, l_indxs, r, greater, greater_or_eq, ~] = sorted_kl_indxs(SCV, f,type,Delta,RepMax,Bsize,threshold);
[lambdas] = init_lambda(r, Bsize);
EW(end)=simple_kl_PH_mex(d,lambda,SCV,f,Delta,Bsize,r,k_indxs, l_indxs, greater, greater_or_eq, tol, lambdas);
save(strcat("../../data/simulation1.mat"), "EW", "N_iter")

