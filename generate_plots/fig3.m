%% Fig 3a : No Threshold
clear variables
load('../data/fig3ab.mat')

x=lambdas(1:end); y=EW_rel([1 4 5 7], 1:end); legend_entries={"SQ($20$)-RTB",  "LAS($20$)",  "LAS($20$)-QTB",  "LEW($20$)"};
legend_loc="southwest"; xLab='$\lambda$'; yLab='$E_{W, rel, P}$'; xLim=[0.3,1]; yLim=[0, 1];
filename='../figures/fig3a.pdf'; logplot=false;

make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Fig 3b : with thresholds
clear variables
load('../data/fig3ab.mat')

x=lambdas(1:end); y=EW_rel([2 3 6 7], 1:end); legend_entries={"SQ($20$)-RE($2$)",  "SQ($20$)-RTB-RE($2$)",  "RE($20,2$)",  "LEW($20$)"};
legend_loc="southwest"; xLab='$\lambda$'; yLab='$E_{W, rel, P}$'; xLim=[0.3,1]; yLim=[0, 1];
filename='../figures/fig3b.pdf'; logplot=false;

make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);