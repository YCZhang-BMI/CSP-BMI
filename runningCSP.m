calDir = dir("./result/calSession*");
calTask0 = [];
calTask1 = [];
calTask2 = [];
load CSPgoodChan
ChannelLocation;
for i = 1:length(calDir)
    load([calDir(i).folder  '/'  calDir(i).name])
    for j = 1:length(caliEEG.task)
        
        
        if caliEEG.trialAssign(j) ==0
            calTask0 = [calTask0 ; caliEEG.dataf(caliEEG.task(j)+1001:caliEEG.task(j)+4000,goodChan)]; %#ok<*AGROW>
        end
        if caliEEG.trialAssign(j) ==1
            calTask1 = [calTask1 ; caliEEG.dataf(caliEEG.task(j)+1001:caliEEG.task(j)+4000,goodChan)];
        end
        if caliEEG.trialAssign(j) ==2
            calTask2 = [calTask2 ; caliEEG.dataf(caliEEG.task(j)+1001:caliEEG.task(j)+4000,goodChan)];
        end
    end
    
    
end

[CSPR1,LDAR1]=CSPBuild(calTask0,calTask1,caliEEG.sampleRate,1);
[CSPR2,LDAR2]=CSPBuild(calTask0,calTask2,caliEEG.sampleRate,1);
[CSPT,LDAT]=CSPBuild(calTask1,calTask2,caliEEG.sampleRate,1);