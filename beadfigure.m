function [ y sd ] = beadfigure(LP,cAOI,LPSD,cAOISD,zerolp,zerolpsd, zerocaoi,zerocaoisd,conc,exposures,groupselected,drtype)
% Created by Evan Brooks, evan.brooks@wpafb.af.mil
%
% Adaptation of scrollplotdemo by Steven Lord:
% -> Created by Steven Lord, slord@mathworks.com
% -> Uploaded to MATLAB Central
% -> http://www.mathworks.com/matlabcentral
% -> 7 May 2002
% ->
% -> Permission is granted to adapt this code for your own use.
% -> However, if it is reposted this message must be intact.
%

% create new figure window
f = figure;
set(f,'doublebuffer', 'on', 'resize', 'off')
exposures
% set columns of plots
cols = 2;
numberofexposures=exposures;
% create 5 data sets to plot
x=conc;
whichgroup=(groupselected-1);
raw= LP{whichgroup};
skipsize=length(raw);
neg=LP{2};
cal=LP{1};
maxcal=max(cal);
rawminneg=raw-neg;
rawminnegnorm=raw;
rawnorm=raw;
rawzerolp=zerolp(whichgroup,:);
negzerolp=zerolp(2,:);
calzerolp=zerolp(1,:);
rawzerominneg=rawzerolp-negzerolp;
rawzerominnegnorm=rawzerolp;
rawzerolpnorm=rawzerolp;
maxzerocal=max(calzerolp);
rawzerominnegnorm=(rawzerominneg.*calzerolp)/maxzerocal;
rawzerolpnorm=(rawzerolp.*calzerolp)/maxzerocal;
for i=1:skipsize
    rawminnegnorm(:,i)=(rawminneg(:,i).*cal(:,i))/maxcal(i);
    rawnorm(:,i)=(raw(:,i).*cal(:,i))/maxcal(i);

end



lodzerolpvalues=zerolp+3*zerolpsd;
lodzerocaoivalues=zerocaoi+3*zerocaoisd;
inputsamplevalue=lodzerolpvalues(whichgroup,:);
if drtype==2
    y=raw;
    lodzerolpvalues=zerolp+3*zerolpsd;
    figtitle='Raw Data Dose Response';
end
if drtype==3
    y=rawminneg;
    figtitle='Raw Data - Negative Dose Response';
end
if drtype==4
    y=rawminnegnorm;
    figtitle='Raw Data - Negative (Normalized) Dose Response';
end
if drtype==5
    y=rawnorm;
    figtitle='Normal (Normalized) Dose Response';
end
if drtype==6
    y=cvgraph;
    figtitle='CV Graph';
end
    
%determine raw - negative 
y
% determine required rows of plots
rows = ceil(length(y)/cols);

% increase figure width for additional axes
fpos = get(gcf, 'position');
scrnsz = get(0, 'screensize');
fwidth = min([fpos(3)*cols, scrnsz(3)-20]);
fheight = fwidth/cols*.75; % maintain aspect ratio
set(gcf, 'position', [10 fpos(2) fwidth fheight])

% setup all axes
buf = .15/cols; % buffer between axes & between left edge of figure and axes
awidth = (1-buf*cols-.08/cols)/cols; % width of all axes
aidx = 1;
rowidx = 0;
while aidx <= length(y)
    for i = 0:cols-1
        if aidx+i <= length(y)
            start = buf + buf*i + awidth*i;
            apos{aidx+i} = [start 1-rowidx-.92 awidth .85];
            a{aidx+i} = axes('position', apos{aidx+i});
        end
    end
    rowidx = rowidx + 1; % increment row
    aidx = aidx + cols;  % increment index of axes
end

% make plots

for s=1:skipsize
    num=num2str(numberofexposures(s));
    sptit=strcat('Exposures ',num,'sec');
    yval=y(:,s);
    yval=yval';
    axes(a{s});
    [beta_est mse conc_graph intensity_graph]=dose_response(x,yval);
    title(sptit), xlabel('Concentration'), ylabel('Intensity');
    hold on;
    [prediction_value] = prediction(beta_est,conc_graph,inputsamplevalue(s));
    plot(prediction_value,inputsamplevalue(s),'gd', 'markersize',10,'markeredgecolor','k','markerfacecolor','g');
    hold off;
end
suptitle(figtitle);
% axes(a{2}), plot(x,y{2}), title('cosine'), xlabel('x'), ylabel('cos(x)')
% axes(a{3}), plot(x,y{3}), title('tangent'), xlabel('x'), ylabel('tan(x)')
% axes(a{4}), plot(x,y{4}), title('x^2'), xlabel('x'), ylabel('x^2')
% axes(a{5}), plot(x,y{5}), title('x^3'), xlabel('x'), ylabel('x^3')

% determine the position of the scrollbar & its limits
swidth = max([.03/cols, 16/scrnsz(3)]);
ypos = [1-swidth 0 swidth 1];
ymax = 0;
ymin = -1*(rows-1);

% build the callback that will be executed on scrolling
clbk = '';
for i = 1:length(a)
    line = ['set(',num2str(a{i},'%.13f'),',''position'',[', ...
            num2str(apos{i}(1)),' ',num2str(apos{i}(2)),'-get(gcbo,''value'') ', num2str(apos{i}(3)), ...
            ' ', num2str(apos{i}(4)),'])'];
    if i ~= length(a)
        line = [line,','];
    end
    clbk = [clbk,line];
end

% create the slider
uicontrol('style','slider', ...
    'units','normalized','position',ypos, ...
    'callback',clbk,'min',ymin,'max',ymax,'value',0);
sd=0;









