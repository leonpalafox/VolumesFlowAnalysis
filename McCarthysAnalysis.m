
filename = 'C:\Users\leon\Documents\Data\McCarthys.dat';
data = load(filename);
old_mat = [];
for row_idx = 1:size(data,1)
    new_mat = repmat(data(row_idx,1),1, data(row_idx,2));
    old_mat = [old_mat, new_mat];
end
phat = gamfit(old_mat);
x_plot =  1:range(old_mat);
y = gampdf(x_plot,phat(1),phat(2));
hold on
histogram(old_mat, 'Normalization', 'pdf')
plot(x_plot, y)
%%
% Mu = [3;15];
% PComponents = [4/5, 1/5];
% Sigma(:,:,1) = 0.1;
% Sigma(:,:,2) = 0.1;
% Sigma(:,:,2) = 0.1;
% S = struct('mu',Mu,'Sigma',Sigma, 'ComponentProportion',PComponents);
num_clust = 3;
GMModel = fitgmdist(old_mat',num_clust);
[f,x]=hist(old_mat,50);%# create histogram from a normal distribution.
bar(x,f/trapz(x,f));
hold on
for idx = 1:num_clust
    y1 = normpdf(x_plot,GMModel.mu(idx), GMModel.Sigma(idx));
    plot(x_plot, y1)
end