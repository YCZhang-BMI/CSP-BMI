setUDP;
scrsz   = get(0,'ScreenSize');
taskStatus = 't';
controlPanel=figure(1);
controlPanel.Name = 'Control Panel';
controlPanel.Position = [scrsz(3)/2-450,scrsz(4)*0.1,900,400];
controlPanel.MenuBar='none';
controlPanel.NumberTitle='off';
recordingTag = 1;
stopBotton         = uicontrol(controlPanel,'Style','Push','Position',[100 200 100 100],...
            'String','Stop','FontName','游ゴシック','FontSize',20,'CallBack','recordingTag=0;');
taskBotton         = uicontrol(controlPanel,'Style','Push','Position',[250 200 100 100],...
            'String','task','FontName','游ゴシック','FontSize',20,'CallBack','taskStatus = ''t'';');
readyBotton         = uicontrol(controlPanel,'Style','Push','Position',[400 200 100 100],...
            'String','ready','FontName','游ゴシック','FontSize',20,'CallBack','taskStatus = ''R'';');
restBotton         = uicontrol(controlPanel,'Style','Push','Position',[550 200 100 100],...
            'String','rest','FontName','游ゴシック','FontSize',20,'CallBack','taskStatus = ''r'';');
breakBotton         = uicontrol(controlPanel,'Style','Push','Position',[700 200 100 100],...
            'String','break','FontName','游ゴシック','FontSize',20,'CallBack','taskStatus = ''b'';');
resetBotton         = uicontrol(controlPanel,'Style','Push','Position',[400 300 100 100],...
            'String','reset','FontName','游ゴシック','FontSize',20,'CallBack','score = 0;');
calBotton         = uicontrol(controlPanel,'Style','Push','Position',[400 300 100 100],...
            'String','calibrate','FontName','游ゴシック','FontSize',20,'CallBack','taskStatus = ''c'';');     
leftBotton         = uicontrol(controlPanel,'Style','Push','Position',[250 300 100 100],...
            'String','left','FontName','游ゴシック','FontSize',20,'CallBack','trialAssign = 1;');         
rightBotton         = uicontrol(controlPanel,'Style','Push','Position',[100 300 100 100],...
            'String','right','FontName','游ゴシック','FontSize',20,'CallBack','trialAssign = 2;');      

thresholdSlider = uicontrol(controlPanel,'Style','slider','Min',0,'Max',90,'Value',45,'BackgroundColor', ...
[1 1 1],'Position',[100 50 700 100]);
pause(0);
score = 0;
trialAssign = 0;
tic
while recordingTag
pause(0.01);


status = thresholdSlider.Value;
interval = toc;
score = interval*status*0.2+score;
score = score*(score<999);
tic

pmERDL= 0 ;
pmERDR= 0 ;
tcStatus = addDigit(num2str(1),2);
elStatus = addDigit(num2str(round(abs(-max(min(200,0),-200)))),3);
erStatus = addDigit(num2str(round(abs(-max(min(200,0),-200)))),3);
ssStatus = addDigit(num2str(1),2);
scoreStatus = addDigit(num2str(round(score)),3);
armStatus = addDigit(num2str(round(status)),2);


msg = [taskStatus,tcStatus,num2str(pmERDL),elStatus,num2str(pmERDR),erStatus,ssStatus,scoreStatus,armStatus,num2str(trialAssign)];
fwrite(u,msg);
end


fclose(u);