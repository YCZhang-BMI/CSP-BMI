function EEG=getDataStruct(EEG,ti2)

[EEG.sample,temp]=getNewData(EEG.sample,ti2);
if size(EEG.dataTrunk{end},1)>1000*30
    EEG.dataTrunk{end+1}=[];
end
EEG.dataTrunk{end}=[EEG.dataTrunk{end};temp];
if size(EEG.dataTrunk{1},1)>EEG.sample
    EEG.dataTrunk{1}=EEG.dataTrunk{1}(end-EEG.sample+1:end,:);
end
end