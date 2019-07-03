function [EEG,Filter]=filtNewData(EEG,Filter)
i=1;
i1=Filter.sample;
i2=EEG.sample;
if i1~=i2
    while i1>=size(EEG.dataTrunk{i},1)
        i1=i1-size(EEG.dataTrunk{i},1);
        i2=i2-size(EEG.dataTrunk{i},1);
        i=i+1;
    end
    
    data=EEG.dataTrunk{i}(i1+1:i2,:);
    
    [data,Filter]=allFilt(data,Filter);
    if size(EEG.datafTrunk{end},1)>1000*30
        EEG.datafTrunk{end+1}=[];
    end
    EEG.datafTrunk{end}=[EEG.datafTrunk{end};data];
end
Filter.sample=EEG.sample;

end