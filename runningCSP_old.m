calDir = dir("./result/calSession*");
calRest = [];
calTask1 = [];
calTask0 = [];
load CSPgoodChan
ChannelLocation;
for i = 1:length(calDir)
    load([calDir(i).folder  '/'  calDir(i).name])
    for j = 1:length(dataRestFCal)
        calRest = [calRest ; dataRestFCal{j}(:,goodChan)];
    end
    for j = 1:length(dataTaskFCal)
        if trialAssign(j) ==1
            calTask1 = [calTask1 ; dataTaskFCal{j}(501:floor(length(dataTaskFCal{j})/1000)*1000,goodChan)];
        end
        if trialAssign(j) ==0
            calTask0 = [calTask0 ; dataTaskFCal{j}(501:floor(length(dataTaskFCal{j})/1000)*1000,goodChan)];
        end
    end
    
    
end

[CSPR1,LDAR1]=CSPBuild(calRest,calTask1);
[CSPR0,LDAR0]=CSPBuild(calRest,calTask0);
[CSPT,LDAT]=CSPBuild(calTask1,calTask0);