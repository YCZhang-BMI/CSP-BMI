if size(testEEG.datafTrunk{end},1)<1000
    temp=[testEEG.datafTrunk{end-1}(end-1000+1+size(testEEG.datafTrunk{end},1),goodChan);testEEG.datafTrunk{end}(:,goodChan)];
else
temp=testEEG.datafTrunk{end}(end-999:end,goodChan);
end

CSPfeatR1 = log(var(temp*CSPR1));
CSPfeatR2 = log(var(temp*CSPR2));
CSPfeatT = log(var(temp*CSPT));
testEEG.CSPfeat{trialCount} = [testEEG.CSPfeat{trialCount};[CSPfeatR1;CSPfeatR2;CSPfeatT]];

labelR1=predict(LDAR1,CSPfeatR1);
labelR2=predict(LDAR2,CSPfeatR2);
labelT=predict(LDAT,CSPfeatT);

testEEG.dataLabel = [testEEG.dataLabel,[labelR1;labelR2;labelT;testEEG.sample]];

