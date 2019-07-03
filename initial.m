testEEG=EEGSpawn;
testFilt = filterSpawn(testEEG);
count_sample     = 0;
trialCount       = 1;


breakFlag        = 0;
restFlag         = 0;
initialFlag      = 0;
taskFlag         = 0;
readyFlag        = 0;
countFlag        = 0;
ticFlag          = 0;
speed            = 20;
% thresholdERD     = thresholdSlider.Value;

testEEG.CSPfeat      = cell(1,testEEG.trialNum);
testEEG.dataLabel = [];

status           = 0;
preStatus = 0;
preLabel = 0;



condFilt = 1-exp(-(1:10000)/500);
load CSPgoodChan