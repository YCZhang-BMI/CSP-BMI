caliEEG=EEGSpawn;
caliEEG.trialNum=39;
caliEEG.trialAssign = classAssign(3,39);
caliFilt = filterSpawn(caliEEG);

trialCount       = 1;
count_sample = 0;

breakFlag        = 0;
restFlag         = 0;
taskFlag         = 0;
readyFlag        = 0;
countFlag        = 0;
ticFlag          = 0;
setNI;
setUDP;
D.queueOutputData(OutputSignal(5,:));
D.startBackground();
pause(1)
ti2              = ListenAmpserver;
getDataParameter;
while(recordingTag==1)
    if trialCount < caliEEG.trialNum + 1
        [caliEEG,caliFilt]=FiltInit(caliEEG,caliFilt,ti2);
        caliEEG=getDataStruct(caliEEG,ti2);
        [caliEEG,caliFilt]=filtNewData(caliEEG,caliFilt);
        
        
        count_sample=caliEEG.sample-caliEEG.rest(end);
        udpSendingCal;
        
        
        
        if count_sample>0&&count_sample<5000
            if taskFlag == 0
                caliEEG.task=[caliEEG.task caliEEG.sample];
                pause(0.1);
                D.queueOutputData(OutputSignal(2,:));
                D.startBackground();
                taskFlag = 1;
            end
        end
        
        if count_sample>5000&&count_sample<8000
            if breakFlag ==0
                caliEEG.break=[caliEEG.break caliEEG.sample];
                pause(0.1)
                D.queueOutputData(OutputSignal(3,:));
                D.startBackground();
                breakFlag = 1;
            end
        end
        %         if count_sample>23000&&count_sample<25000
        %             startReady;
        %         end
        if count_sample>8000
            restFlag = 0;
            taskFlag = 0;
            readyFlag = 0;
            breakFlag = 0;
            trialCount = trialCount +1
            caliEEG.rest=[caliEEG.rest caliEEG.sample];
        end
    else
        break;
    end
end
caliEEG.data=vertcat(caliEEG.dataTrunk{:});
caliEEG=rmfield(caliEEG,'dataTrunk');
caliEEG.dataf=vertcat(caliEEG.datafTrunk{:});
caliEEG=rmfield(caliEEG,'datafTrunk');
% close figure 10 11 12;
fclose(ti2);
fclose(u);
stop(D);
mkdir result;
save(['./result/calSession',num2str(calSessionCount)],'caliEEG');
calSessionCount = calSessionCount+1;
sessionText.String = strcat('Session ',num2str(calSessionCount));

