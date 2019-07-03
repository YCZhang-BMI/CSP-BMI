count_sample = 1;
precountsample = 1;
taskFigure = figure(11);
pos1             = [1200 -200 1920 1200];
set(taskFigure,'color',[1 1 1],'position',pos1,'menu','none','toolbar','none');axis off;
alpha = 0:pi/20:2*pi;
R = 10;
status           = 0;
x=R*cos(alpha);
y=R*sin(alpha);
ball = plot(x,y,'-');
ball1=fill(x,y,'r');
axis off;
axis([-50 50 -50 50]);
ax = gca;
ti2              = ListenAmpserver;
setNI;
getDataParameterTask;
tic;
while(recordingTag==1)
    GetData_NA400ver164;
    startTask;
    startControl;
    statusFlag
end
close figure 11
fclose(ti2);
stop(D);