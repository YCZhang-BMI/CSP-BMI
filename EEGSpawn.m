function EEG=EEGSpawn()

EEG=struct;
EEG.sampleRate       = 1000;

EEG.trialNum         = 20;
EEG.data         = [];
EEG.dataf=[];
EEG.dataTrunk{1}=[];
EEG.datafTrunk{1}=[];
EEG.rest=[];
EEG.task=[];
EEG.break=[];
EEG.sample     = 0;
EEG.trialAssign = classAssign(2,EEG.trialNum);
end