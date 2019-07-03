if count_sample>=0&&count_sample<5000
    taskStatus = 'r';
end
if count_sample>5000&&count_sample<6000
    taskStatus = 'R';
end
if count_sample>6000&&count_sample<12000
    taskStatus = 't';
end

if count_sample>12000&&count_sample<15000
    taskStatus = 'b';
end



pmERDL= labelR1 < 0 ;
pmERDR= labelR2 < 0 ;
tcStatus = addDigit(num2str(trialCount),2);
elStatus = addDigit(num2str(round(abs(-max(min(200,100),-200)))),3);
erStatus = addDigit(num2str(round(abs(-max(min(200,100),-200)))),3);
ssStatus = addDigit(num2str(sessionCount),2);
scoreStatus = addDigit(num2str(round(0)),3);
armStatus = addDigit(num2str(round(45*(-status)+45)),2);


msg = [taskStatus,tcStatus,num2str(pmERDL),elStatus,num2str(pmERDR),erStatus,ssStatus,scoreStatus,armStatus,num2str(testEEG.trialAssign(trialCount))];
fwrite(u,msg);