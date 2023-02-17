%find the ridge line on the XYZ surf

figure;
surf(X, Y, Z);
xlabel('K');
ylabel('total width');
zlabel('R2');

%ncol=size(Z,1);
ncol=35;
nrow=size(Z,2);
px=zeros(ncol,1);
py=zeros(ncol,1);
pz=zeros(ncol,1);
for i=1:1:ncol
    px(i)=X(1,i);
    [pz(i), ind]=max(Z(:,i));
    py(i)=Y(ind,i);
end

hold on;
scatter3(px,py,pz,'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

%plot the fitted ridge line
mdl=fitlm(px,py);
b=mdl.Coefficients.Estimate(1);
a=mdl.Coefficients.Estimate(2);
yfit=a*px+b;

hold on;
plot3(px, yfit, pz);