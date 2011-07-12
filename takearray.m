function [LP LPSD LPCV cAOI cAOISD cAOICV]=takearray(xval,folder,exposures)
%create matrices to store LP values
conc=xval;
namefolder=char(folder);
grp1lp=zeros(numel(conc),numel(exposures));
grp2lp=zeros(numel(conc),numel(exposures));
grp3lp=zeros(numel(conc),numel(exposures));
grp4lp=zeros(numel(conc),numel(exposures));
grp5lp=zeros(numel(conc),numel(exposures));
grp6lp=zeros(numel(conc),numel(exposures));
grp7lp=zeros(numel(conc),numel(exposures));
grp8lp=zeros(numel(conc),numel(exposures));
%create matrices to store LP SD values
grp1lpsd=zeros(numel(conc),numel(exposures));
grp2lpsd=zeros(numel(conc),numel(exposures));
grp3lpsd=zeros(numel(conc),numel(exposures));
grp4lpsd=zeros(numel(conc),numel(exposures));
grp5lpsd=zeros(numel(conc),numel(exposures));
grp6lpsd=zeros(numel(conc),numel(exposures));
grp7lpsd=zeros(numel(conc),numel(exposures));
grp8lpsd=zeros(numel(conc),numel(exposures));
%create matrices to store LP CV values
grp1lpcv=zeros(numel(conc),numel(exposures));
grp2lpcv=zeros(numel(conc),numel(exposures));
grp3lpcv=zeros(numel(conc),numel(exposures));
grp4lpcv=zeros(numel(conc),numel(exposures));
grp5lpcv=zeros(numel(conc),numel(exposures));
grp6lpcv=zeros(numel(conc),numel(exposures));
grp7lpcv=zeros(numel(conc),numel(exposures));
grp8lpcv=zeros(numel(conc),numel(exposures));
%create matrices to store CAOI values
grp1caoi=zeros(numel(conc),numel(exposures));
grp2caoi=zeros(numel(conc),numel(exposures));
grp3caoi=zeros(numel(conc),numel(exposures));
grp4caoi=zeros(numel(conc),numel(exposures));
grp5caoi=zeros(numel(conc),numel(exposures));
grp6caoi=zeros(numel(conc),numel(exposures));
grp7caoi=zeros(numel(conc),numel(exposures));
grp8caoi=zeros(numel(conc),numel(exposures));
%create matrices to store CAOI SD values
grp1caoisd=zeros(numel(conc),numel(exposures));
grp2caoisd=zeros(numel(conc),numel(exposures));
grp3caoisd=zeros(numel(conc),numel(exposures));
grp4caoisd=zeros(numel(conc),numel(exposures));
grp5caoisd=zeros(numel(conc),numel(exposures));
grp6caoisd=zeros(numel(conc),numel(exposures));
grp7caoisd=zeros(numel(conc),numel(exposures));
grp8caoisd=zeros(numel(conc),numel(exposures));
%create matrices to store CAOI CV values
grp1caoicv=zeros(numel(conc),numel(exposures));
grp2caoicv=zeros(numel(conc),numel(exposures));
grp3caoicv=zeros(numel(conc),numel(exposures));
grp4caoicv=zeros(numel(conc),numel(exposures));
grp5caoicv=zeros(numel(conc),numel(exposures));
grp6caoicv=zeros(numel(conc),numel(exposures));
grp7caoicv=zeros(numel(conc),numel(exposures));
grp8caoicv=zeros(numel(conc),numel(exposures));

locofsumfiles=dir(namefolder);
% storelocations= cell(1,numel(locofsumfiles));

for r=1:numel(conc);
    if ispc
        testlc= sprintf('\\%1.1f ngperml\\Results\\',conc(r));
    end
    if ismac
        testlc= sprintf('//%1.1f ngperml//Results//',conc(r));
    end
    fpofname=strcat(namefolder,testlc);
    summaryfiles=dir(fullfile(fpofname,'*summary*.txt'));
    storedfiles=cell(1,numel(summaryfiles));
    for h = 1:numel(summaryfiles) 
        storedfiles{h} = summaryfiles(h).name;
    end
    
        for t=1:numel(summaryfiles)
            storedfilename=char(strcat(fpofname,storedfiles(t)));
            sumlines=textread(storedfilename,'%s','delimiter',' ');
            %store LP values
            grp1lp(r,t)=str2double(char(sumlines(11)));
            grp2lp(r,t)=str2double(char(sumlines(20)));
            grp3lp(r,t)=str2double(char(sumlines(29)));
            grp4lp(r,t)=str2double(char(sumlines(38)));
            grp5lp(r,t)=str2double(char(sumlines(47)));
            grp6lp(r,t)=str2double(char(sumlines(56)));
            grp7lp(r,t)=str2double(char(sumlines(65)));
            grp8lp(r,t)=str2double(char(sumlines(74)));
            %store LP SD values
            grp1lpsd(r,t)=str2double(char(sumlines(12)));
            grp2lpsd(r,t)=str2double(char(sumlines(21)));
            grp3lpsd(r,t)=str2double(char(sumlines(30)));
            grp4lpsd(r,t)=str2double(char(sumlines(39)));
            grp5lpsd(r,t)=str2double(char(sumlines(48)));
            grp6lpsd(r,t)=str2double(char(sumlines(57)));
            grp7lpsd(r,t)=str2double(char(sumlines(66)));
            grp8lpsd(r,t)=str2double(char(sumlines(75)));
            %store LP CV values
            grp1lpcv(r,t)=str2double(char(sumlines(13)));
            grp2lpcv(r,t)=str2double(char(sumlines(22)));
            grp3lpcv(r,t)=str2double(char(sumlines(31)));
            grp4lpcv(r,t)=str2double(char(sumlines(40)));
            grp5lpcv(r,t)=str2double(char(sumlines(49)));
            grp6lpcv(r,t)=str2double(char(sumlines(58)));
            grp7lpcv(r,t)=str2double(char(sumlines(67)));
            grp8lpcv(r,t)=str2double(char(sumlines(76)));
            %store CAOI values
            grp1caoi(r,t)=str2double(char(sumlines(14)));
            grp2caoi(r,t)=str2double(char(sumlines(23)));
            grp3caoi(r,t)=str2double(char(sumlines(32)));
            grp4caoi(r,t)=str2double(char(sumlines(41)));
            grp5caoi(r,t)=str2double(char(sumlines(50)));
            grp6caoi(r,t)=str2double(char(sumlines(59)));
            grp7caoi(r,t)=str2double(char(sumlines(68)));
            grp8caoi(r,t)=str2double(char(sumlines(77)));
            %store CAOI SD values
            grp1caoisd(r,t)=str2double(char(sumlines(15)));
            grp2caoisd(r,t)=str2double(char(sumlines(24)));
            grp3caoisd(r,t)=str2double(char(sumlines(33)));
            grp4caoisd(r,t)=str2double(char(sumlines(42)));
            grp5caoisd(r,t)=str2double(char(sumlines(51)));
            grp6caoisd(r,t)=str2double(char(sumlines(60)));
            grp7caoisd(r,t)=str2double(char(sumlines(69)));
            grp8caoisd(r,t)=str2double(char(sumlines(78)));
            %store CAOI CV values
            grp1caoicv(r,t)=str2double(char(sumlines(16)));
            grp2caoicv(r,t)=str2double(char(sumlines(25)));
            grp3caoicv(r,t)=str2double(char(sumlines(34)));
            grp4caoicv(r,t)=str2double(char(sumlines(43)));
            grp5caoicv(r,t)=str2double(char(sumlines(52)));
            grp6caoicv(r,t)=str2double(char(sumlines(61)));
            grp7caoicv(r,t)=str2double(char(sumlines(70)));
            grp8caoicv(r,t)=str2double(char(sumlines(79)));
       end
end

LP={grp1lp,grp2lp,grp3lp,grp4lp,grp5lp,grp6lp,grp7lp,grp8lp};
LPSD={grp1lpsd,grp2lpsd,grp3lpsd,grp4lpsd,grp5lpsd,grp6lpsd,grp7lpsd,grp8lpsd};
LPCV={grp1lpcv,grp2lpcv,grp3lpcv,grp4lpcv,grp5lpcv,grp6lpcv,grp7lpcv,grp8lpcv};
cAOI={grp1caoi,grp2caoi,grp3caoi,grp4caoi,grp5caoi,grp6caoi,grp7caoi,grp8caoi};
cAOISD={grp1caoisd,grp2caoisd,grp3caoisd,grp4caoisd,grp5caoisd,grp6caoisd,grp7caoisd,grp8caoisd};
cAOICV={grp1caoicv,grp2caoicv,grp3caoicv,grp4caoicv,grp5caoicv,grp6caoicv,grp7caoicv,grp8caoicv};

end

