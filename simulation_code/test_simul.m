lam=0.8;
d=2;
N=100;
EX=1;
SCV=10;
f=1/2;
nruns=2;
runlen=100;
use_xi=true;
RepGran=1;
RepMax=40;
Bsize=40;
type=5;
S=[-2 2;0 -2];
alpha=[1 0];
threshold=2.3;
[b] = define_b(Delta, RepMax);

[qls_dist,mresp,mwait]=simulSQd_HEXP(d,N,lam,EX,SCV,f,nruns,runlen,type,Delta,RepMax,Bsize,threshold)