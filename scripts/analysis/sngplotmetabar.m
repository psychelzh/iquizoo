function [h, hname] = sngplotmetabar(metadata)
%SNGPLOTMETABAR bar plot for metadata.

%Get all the grades and school names.
grades = cellstr(unique(metadata.grade));
schools = cellstr(unique(metadata.school));
ngrades = length(grades);
nschools = length(schools);
%Set the plot data.
plotdata = nan(ngrades, nschools);
for ischool = 1:nschools
    plotdata(:, ischool) = countcats(metadata.grade(metadata.school == schools{ischool}));
end
h = bar3(plotdata);
hax = gca;
hax.FontName = 'Microsoft YaHei UI Light';
hax.FontSize = 12;
hax.XTickLabel = schools;
hax.YTickLabel = grades;
hax.XLabel.String = 'School';
hax.YLabel.String = 'Grade';
hax.ZLabel.String = 'Count';
