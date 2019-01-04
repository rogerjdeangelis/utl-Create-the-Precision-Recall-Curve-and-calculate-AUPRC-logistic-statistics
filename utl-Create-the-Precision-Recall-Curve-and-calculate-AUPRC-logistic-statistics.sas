Create the Precision Recall Curve and calculate AUPRC logistic statistics

SAS/IML/R Solution

R and SAS are a better sources for AUC statistics than Python?

I have not used AUCPRC curve, so I am a little out of my element.

see
https://tinyurl.com/ydd82ha2
https://communities.sas.com/t5/SAS-Data-Mining-and-Machine/How-to-create-the-Precision-Recall-Curve-and-calculate-AUPRC-in/m-p/524188

see
https://rdrr.io/cran/PerfMeas/man/AUPRC.html
and page 11 for plotting example.
https://www.rdocumentation.org/packages/PerfMeas/versions/1.2.1/topics/AUPRC

You need to use a Bioconducter install to get limma

For kmma function
source("http://www.bioconductor.org/biocLite.R")
> biocLite()
To get just limma alone (much quicker) you can use
> biocLite("limma")
This will allow you do to perform many basic analyses, alth

EXAMPLE
=======

%utl_submit_r64('
library(PerfMeas);
library(limma);
library(graph);
library(statmod);
data(T);
data(Scores);
res=list();
classes=1:10;
for (j in classes) res=c(res, list(precision.at.all.recall.levels(Scores[,j], T[,j])));
names(res)<-seq(0.1, 1, by=0.1);
AUPRC (res, comp.precision=TRUE);
str(AUPRC);
data(PrecRec);
x <- seq(0.1, 1, by=0.1);
res <- numeric(nrow(PrecRec));
names(res) <- rownames(PrecRec);
for (i in 1:nrow(PrecRec))
  res[i] <- trap.rule.integral(x, PrecRec[i,]);
print(res);
');

      AV       NN      KNN       RW      RWR      SVM       GM
0.388210 0.303345 0.395690 0.052710 0.250960 0.353825 0.383885


