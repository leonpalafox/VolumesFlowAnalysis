%%
%-------------- Code for the full data---------------------------
filename = 'C:\Users\leon\Documents\Data\all_McCartys_data.txt';
data = load(filename);
x_axis = data(:,1);
hist_1 = data(:,2);
hist_2 = data(:,3);
hist_3 = data(:,4);
old_mat = [];
for row_idx = 1:size(data,1)
    new_mat = repmat(data(row_idx,1),1, data(row_idx,3));
    old_mat = [old_mat, new_mat];
end
%hist(x_axis, hist_1)
%old_mat = old_mat(find(old_mat<10));
phat = gamfit(old_mat);
y = gampdf(x_axis,phat(1),phat(2));
hold on
plot(x_axis, y)
histogram(old_mat,'Normalization', 'pdf')
%% ------------- Poisson Distribution------------------------------
%old_mat = old_mat(find(old_mat<10));
lambdahat = poissfit(old_mat');
y = poisspdf(1:1:range(old_mat),lambdahat);
hold on
histogram(old_mat,256, 'Normalization', 'pdf');
plot(1:1:range(old_mat), y, 'o');

break
%%--------------- Log Normal Distribution---------------------
%old_mat_1 = old_mat(find(old_mat<15));
old_mat_1 = old_mat;
options = statset('TolX',100)
phat = lognfit(old_mat_1, options);
y = lognpdf(x_axis,phat(1),phat(2));
cum_y = logncdf(x_axis,phat(1),phat(2))
hold on
histogram(old_mat_1,256,'Normalization', 'pdf', 'FaceAlpha', 0.5)
plot(x_axis, y)
[M,V]= lognstat(phat(1),phat(2))
median_dist = exp(phat(1))
line([median_dist median_dist],[0 lognpdf(median_dist,phat(1),phat(2))],'color', 'red','LineWidth',2);
mode_dist = exp(phat(1)-phat(2)^2)
line([mode_dist mode_dist],[0 lognpdf(mode_dist,phat(1),phat(2))],'color' ,'black','LineWidth',2);
line([M M],[0 lognpdf(M,phat(1),phat(2))],'color' ,'blue','LineWidth',2);
cum_dist = x_axis(cum_y<=0.75)
sf_perc = cum_dist(end)
line([sf_perc sf_perc],[0 lognpdf(sf_perc,phat(1),phat(2))],'color' ,'red','LineWidth',2);
cum_dist = x_axis(cum_y<=0.95)
nf_perc = cum_dist(end)
line([nf_perc nf_perc],[0 lognpdf(nf_perc,phat(1),phat(2))],'color' ,'red','LineWidth',2);
legend('Histogram', 'Fit LogNormal', 'Median', 'Mode', 'Mean', '75 Perc', '95 Perc')
%%---------------- Code for an arbitrary patch of land ----------------
filename = 'C:\Users\leon\Documents\Data\plateau_statistics.txt';
data = load(filename);
x_axis = data(:,1);
hist_1 = data(:,2);
plat_mat = [];
for row_idx = 1:size(data,1)
    new_mat = repmat(data(row_idx,1),1, data(row_idx,2));
    plat_mat = [plat_mat, new_mat];
end
phat = gamfit(plat_mat); %phat(1) is A, and phat(2) is B
y = gampdf(x_axis,phat(1),phat(2));
hold on
histogram(plat_mat,256,'Normalization', 'pdf', 'FaceAlpha', 0.5)
plot(x_axis, y)