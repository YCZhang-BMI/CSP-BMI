function dataClass=extractClassData(EEG)
load CSPgoodChan
ChannelLocation;
dataClass=cell(3,1);
for j = 1:length(EEG.task)
    
    for i =0:2
    if EEG.trialAssign(j) ==i
        dataClass{i+1} = [dataClass{i+1} ; EEG.dataf(EEG.task(j)+501:EEG.task(j)+3500,goodChan)]; %#ok<*AGROW>
    end
    end


end