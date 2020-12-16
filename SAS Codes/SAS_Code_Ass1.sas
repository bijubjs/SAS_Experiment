*** Filename: STAT 5023: Assignment 1.sas ***
TITLE 'STAT 5023: Assignment 1';
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
OPTIONS LS = 80 PAGENO = 1;
DATA metal;
INPUT supplier tenstren @@;
CARDS;
1 21.1 1 24.6 1 26.2 1 22.9
2 27.3 2 30.3 2 24.2 2 29.9
3 31.8 3 30.0 3 21.9 3 25.1
4 26.9 4 26.3 4 12.7 4 15.5
5 8.08 5 18.9 5 31.4 5 27.1
;
PROC PRINT DATA = metal;
TITLE 'ANOVA, HOVS (LEVENE AND BARTLETT), MEANS, STANDARD DEVIATIONS, PLOTS';
PROC GLM DATA = metal ALPHA = 0.02 PLOTS = (BOXPLOT RESIDUALS DIAGNOSTICS);
CLASS supplier;
MODEL tenstren = supplier;
MEANS supplier / HOVTEST = LEVENE (TYPE = ABS)HOVTEST = BARTLETT ALPHA = 0.02;
LSMEANS supplier / STDERR CL ALPHA = 0.02;
PROC MEANS DATA = metal N NMISS MIN MAX MEAN MEDIAN VAR STDERR STDDEV;
BY supplier;

RUN;
QUIT;

