function groupimages( namefolder,sexpval)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
storedfiles2=cell(1,numel(conc));
curfile=cd;
for r=1:numel(conc);
    testlc2= sprintf('\\%1.1f ngperml\\',conc(r));
    fpofname=strcat(namefolder,testlc2);
    cd(fpofname);
    summaryfiles2=dir(fullfile(fpofname,'*.tif'));
    storedfiles2{r} = imread(summaryfiles2(sexpval).name);
end
cd(curfile);
imdisp(storedfiles2, 'Border', 0.01)

end

