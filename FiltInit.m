function [EEG,Filter]=FiltInit(EEG,Filter,ti2)
while EEG.sample<4000
    EEG=getDataStruct(EEG,ti2);
    [EEG,Filter]=filtNewData(EEG,Filter);     
    EEG.rest=EEG.sample;
end

end