
if count_sample>=0&&count_sample<5000
    taskStatus = 'c';
end

if count_sample>5000&&count_sample<8000
    taskStatus = 'b';
end



pmERDL= 0 ;
pmERDR= 0 ;
tcStatus = addDigit(num2str(trialCount),2);
elStatus = addDigit(num2str(round(abs(-max(min(200,0),-200)))),3);
erStatus = addDigit(num2str(round(abs(-max(min(200,0),-200)))),3);
ssStatus = addDigit(num2str(calSessionCount),2);
scoreStatus = addDigit(num2str(round(0)),3);
armStatus = addDigit(num2str(round(0)),2);


msg = [taskStatus,tcStatus,num2str(pmERDL),elStatus,num2str(pmERDR),erStatus,ssStatus,scoreStatus,armStatus,num2str(caliEEG.trialAssign(trialCount))];
fwrite(u,msg);