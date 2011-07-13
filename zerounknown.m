function  [zerolp zerolpsd zerolpcv zerocaoi zerocaoisd zerocaoicv] = zerounknown(folder,exposures,dist)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%create matrices to store LP values

zerolp=zeros(8,numel(exposures));

zerolpsd=zeros(8,numel(exposures));

%create matrices to store LP CV values
zerolpcv=zeros(8,numel(exposures));

%create matrices to store CAOI values
zerocaoi=zeros(8,numel(exposures));

%create matrices to store CAOI SD values
zerocaoisd=zeros(8,numel(exposures));

%create matrices to store CAOI CV values
zerocaoicv=zeros(8,numel(exposures));


%locofsumfiles=dir(folder);
for w=1:numel(folder)
% storelocations= cell(1,numel(locofsumfiles));
if ispc
    if(dist==1)
    testlc= '\0.0 ngperml\Results\';
    else
        teslc='\Results\'
    end
end
if ismac
    if(dist==1)
    testlc= '/0.0 ngperml/Results/';
    else
        testlc='/Results/';
    end
end
fpofname=char(strcat(folder{w},testlc));
summaryfiles=dir(fullfile(fpofname,'*summary*.txt'));
storedfiles=cell(1,numel(summaryfiles));
for h = 1:numel(summaryfiles) 
    storedfiles{h} = summaryfiles(h).name;
end 
for t=1:numel(summaryfiles)
    storedfilename=char(strcat(fpofname,storedfiles(t)));
    sumlines=textread(storedfilename,'%s','delimiter',' ');
            %store LP values
            zerolp(1,t)=str2double(char(sumlines(11)));
            zerolp(2,t)=str2double(char(sumlines(20)));
            zerolp(3,t)=str2double(char(sumlines(29)));
            zerolp(4,t)=str2double(char(sumlines(38)));
            zerolp(5,t)=str2double(char(sumlines(47)));
            zerolp(6,t)=str2double(char(sumlines(56)));
            zerolp(7,t)=str2double(char(sumlines(65)));
            zerolp(8,t)=str2double(char(sumlines(74)));
            %store LP SD values
            zerolpsd(1,t)=str2double(char(sumlines(12)));
            zerolpsd(2,t)=str2double(char(sumlines(21)));
            zerolpsd(3,t)=str2double(char(sumlines(30)));
            zerolpsd(4,t)=str2double(char(sumlines(39)));
            zerolpsd(5,t)=str2double(char(sumlines(48)));
            zerolpsd(6,t)=str2double(char(sumlines(57)));
            zerolpsd(7,t)=str2double(char(sumlines(66)));
            zerolpsd(8,t)=str2double(char(sumlines(75)));
            %store LP CV values
            zerolpcv(1,t)=str2double(char(sumlines(13)));
            zerolpcv(2,t)=str2double(char(sumlines(22)));
            zerolpcv(3,t)=str2double(char(sumlines(31)));
            zerolpcv(4,t)=str2double(char(sumlines(40)));
            zerolpcv(5,t)=str2double(char(sumlines(49)));
            zerolpcv(6,t)=str2double(char(sumlines(58)));
            zerolpcv(7,t)=str2double(char(sumlines(67)));
            zerolpcv(8,t)=str2double(char(sumlines(76)));
            %store CAOI values
            zerocaoi(1,t)=str2double(char(sumlines(14)));
            zerocaoi(2,t)=str2double(char(sumlines(23)));
            zerocaoi(3,t)=str2double(char(sumlines(32)));
            zerocaoi(4,t)=str2double(char(sumlines(41)));
            zerocaoi(5,t)=str2double(char(sumlines(50)));
            zerocaoi(6,t)=str2double(char(sumlines(59)));
            zerocaoi(7,t)=str2double(char(sumlines(68)));
            zerocaoi(8,t)=str2double(char(sumlines(77)));
            %store CAOI SD values
            zerocaoisd(1,t)=str2double(char(sumlines(15)));
            zerocaoisd(2,t)=str2double(char(sumlines(24)));
            zerocaoisd(3,t)=str2double(char(sumlines(33)));
            zerocaoisd(4,t)=str2double(char(sumlines(42)));
            zerocaoisd(5,t)=str2double(char(sumlines(51)));
            zerocaoisd(6,t)=str2double(char(sumlines(60)));
            zerocaoisd(7,t)=str2double(char(sumlines(69)));
            zerocaoisd(8,t)=str2double(char(sumlines(78)));
            %store CAOI CV values
            zerocaoicv(1,t)=str2double(char(sumlines(16)));
            zerocaoicv(2,t)=str2double(char(sumlines(25)));
            zerocaoicv(3,t)=str2double(char(sumlines(34)));
            zerocaoicv(4,t)=str2double(char(sumlines(43)));
            zerocaoicv(5,t)=str2double(char(sumlines(52)));
            zerocaoicv(6,t)=str2double(char(sumlines(61)));
            zerocaoicv(7,t)=str2double(char(sumlines(70)));
            zerocaoicv(8,t)=str2double(char(sumlines(79)));
end
       if dist>1
           if w==1
               ukLP={zerolp}
               ukLPSD={zerolpsd}
               ukLPCV={zerolpcv}
               ukcAOI={zerocaoi}
               ukcAOISD={zerocaoisd}
               ukcAOICV={zerocaoicv}
           else
               ukLP={ukLP,zerolp}
               ukLPSD={ukLPSD,zerolpsd}
               ukLPCV={ukLPCV,zerolpcv}
               ukcAOI={ukcAOI,zerocaoi}
               ukcAOISD={ukcAOISD,zerocaoisd}
               ukcAOICV={ukcAOICV,zerocaoicv}
           end
       end
end

if dist>1
    zerolp=ukLP;
    zerolpsd=ukLPSD;
    zerolpcv=ukLPCV;
    zerocaoi=ukcAOI;
    zerocaoisd=ukcAOISD;
    zerocaoicv=ukcAOICV;
end

       



