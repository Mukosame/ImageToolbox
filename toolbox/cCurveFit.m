% ===================================================
% *** FUNCTION cCurveFit
% *** cout: give the fit data points to form a close area
% *** It is ok to plot(cout(:,1), cout(:,2))
% *** function [cout] = clcurfit(x, y, points, method, param) %param only
% for smooth spline fit
% *** close curve fit
% *** x and y:n*1 single array
% *** points: number of data points you want to get at the final fit data
% ===================================================
function [cout] = cCurveFit(x, y, points, method, param)
mx = median(x)/1.5; my = median(y)/1.5;
%mx = 0; my = 0;
x = x - mx;
y = y - my;
[theta, rho] = cart2pol(x, y);
pol = [theta, rho];
pol = sortrows(pol, 1);
if (exist('param','var'))
if (strcmp(method, 'smoothingspline'))
    [f, gof, out] = fit(pol(:,1), pol(:,2), method, 'SmoothingParam',param);
end
else
    [f, gof, out] = fit(pol(:,1), pol(:,2), method);
end
% set point of xsql
mi = min(pol(:,1)); ma = max(pol(:,1));
step = (ma - mi) / (points-1);
xsql = mi:step:ma;
fity = f(xsql);
[outx, outy] = pol2cart(xsql' ,fity);
cout = [outx+mx, outy+my];
cout = [cout; cout(1,:)];
end