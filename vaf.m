function v = vaf(y,ym)
% Variance accounted for.
% V = VAF(Y,Ym) returns the percentile "Variance Accounted For" measure
% between two signals. When used to validate models, Y contains the
% measured data and Ym is the model output. When Y and Ym are matrices,
% VAF is computed over the corresponding columns.

% (c) Robert Babuska, 1996

v=diag(100*(eye(size(y,2))-cov(y-ym)./cov(y)));

