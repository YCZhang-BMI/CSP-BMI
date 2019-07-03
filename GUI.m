clear all
close all

monitorPosition = get(0, 'MonitorPositions');
scrsz   = monitorPosition(1,:);
controlPanel=figure(1);
controlPanel.Name = 'Control Panel';
controlPanel.Position = [scrsz(3)/2-450,scrsz(4)*0.1,900,650];
controlPanel.MenuBar='none';
controlPanel.NumberTitle='off';

startBotton         = uicontrol(controlPanel,'Style','Push','Position',[0 500 300 100],...
    'String','Start','FontName','游ゴシック','FontSize',20,'CallBack','recordingTag=1;start;');
caliBotton         = uicontrol(controlPanel,'Style','Push','Position',[0 350 300 100],...
    'String','Calibration','FontName','游ゴシック','FontSize',20,'CallBack','recordingTag=1;calibration;');
runCSPBotton         = uicontrol(controlPanel,'Style','Push','Position',[0 200 300 100],...
    'String','runCSP','FontName','游ゴシック','FontSize',20,'CallBack','runningCSP;');

thresholdSlider = uicontrol(controlPanel,'Style','slider','Min',1,'Max',200,'Value',40,'BackgroundColor', ...
    [1 1 1],'Position',[400 50 100 500]);
thresholdText = uicontrol(controlPanel,'Style','edit','Position',[400 570 100 50],...
    'string','40','FontSize',30,'FontName','游ゴシック');
stopBotton         = uicontrol(controlPanel,'Style','Push','Position',[600 30 300 100],...
    'String','Stop','FontName','游ゴシック','FontSize',20,'CallBack','recordingTag=0;');
sessionCount     = 1;
calSessionCount  = 1;