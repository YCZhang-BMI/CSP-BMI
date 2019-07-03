ti2              = ListenAmpserver;
setNI;
getDataParameter;

while(recordingTag==1)
    if trialCount < 3
        GetData_NA400ver164;
        if count_sample>1&&count_sample<5000
            startRest;
        end
        if count_sample>5000&&count_sample<10000
            startBreak;
        end
        if count_sample>10000&&count_sample<10500
            moji.String = 'Ready';
            drawnow;
        end
        if count_sample>11500
            count_sample = 0;
            restFlag = 0;
            breakFlag = 0;
            trialCount = trialCount +1
        end
    else
        break;
    end
end

restMeanFFTL = mean(restMeanFFTL,2,'omitnan');
restMeanFFTR = mean(restMeanFFTR,2,'omitnan');
close figure 10;
fclose(ti2);
stop(D);
save(['restsession',num2str(sessionCount)],'restMeanFFTL','restMeanFFTR');
sessionCount = sessionCount+1;
sessionText.String = strcat('Session ',num2str(sessionCount));
