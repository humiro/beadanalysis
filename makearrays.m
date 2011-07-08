function [conc,exposures]=makearrays(namefolder)

%creates text files to store data by group

locofsumfiles=dir(namefolder);
storelocations= cell(1,numel(locofsumfiles));
dlgprompt='Enter concentrations:';
conc=[];
inputconc=inputdlg(dlgprompt);
conc(1,:)=str2num(inputconc{1});
dlgprompt='Enter exposures:';
exposures=[];
inputexp=inputdlg(dlgprompt);
exposures(1,:)=str2num(inputexp{1});
% dlgprompt2='Enter exposures';
% numexposures=[];
% inputnumexposures=inputdlg(dlgprompt2);
% numexposures(1,:)=str2num(inputnumexposures{1});

end

