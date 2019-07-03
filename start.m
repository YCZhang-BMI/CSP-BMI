initial;
setNI;
setUDP;
D.queueOutputData(OutputSignal(5,:));
D.startBackground();
pause(1)
ti2              = ListenAmpserver;
getDataParameter;
initialFlag=0;
while(recordingTag==1)
     
    if trialCount < testEEG.trialNum + 1
        [testEEG,testFilt]=FiltInit(testEEG,testFilt,ti2);
        testEEG=getDataStruct(testEEG,ti2);
        [testEEG,testFilt]=filtNewData(testEEG,testFilt);
        startCalculate;
        
        label=labelT;
        
        startControl;
        count_sample=testEEG.sample-testEEG.rest(end);
        udpSending;
        
        if count_sample>0&&count_sample<5000
            if restFlag == 0
                pause(0);
                D.queueOutputData(OutputSignal(1,:));
                D.startBackground();
                restFlag =1;
            end
            
        end
        if count_sample>5000&&count_sample<10000
            if taskFlag == 0
                testEEG.task=[testEEG.task testEEG.sample];
                pause(0.1);
                D.queueOutputData(OutputSignal(2,:));
                D.startBackground();
                taskFlag = 1;
                
            end
        end
        if count_sample>10000&&count_sample<13000
            if breakFlag ==0
                
                testEEG.break=[testEEG.break testEEG.sample];
                pause(0.1)
                D.queueOutputData(OutputSignal(3,:));
                D.startBackground();
                breakFlag = 1;
            end
        end
        %         if count_sample>23000&&count_sample<25000
        %             startReady;
        %         end
        if count_sample>13000
            restFlag = 0;
            taskFlag = 0;
            readyFlag = 0;
            breakFlag = 0;
            %             ticFlag = 0;
            trialCount = trialCount +1
            
            testEEG.rest=[testEEG.rest testEEG.sample];
        end
    else
        break;
    end
end
% close figure 10 11 12;
testEEG.data=vertcat(testEEG.dataTrunk{:});
testEEG=rmfield(testEEG,'dataTrunk');
testEEG.dataf=vertcat(testEEG.datafTrunk{:});
testEEG=rmfield(testEEG,'datafTrunk');
fclose(ti2);
fclose(u);
stop(D);
mkdir result;
save(['./result/session',num2str(sessionCount)],'testEEG');
sessionCount = sessionCount+1;
sessionText.String = strcat('Session ',num2str(sessionCount));

