if taskFlag == 0
    pause(0.1);
    D.queueOutputData(OutputSignal(2,:));
    D.startBackground();
    precount_sample  = count_sample;
    dataRest{trialCount} = Buffer(1:BufferFreshRate,:);
    bufferFilt;
    dataRestF{trialCount} = BufferF(1:BufferFreshRate,:);
    taskFlag = 1;
%     coinStatus = -2900+5800*trialAssign(trialCount);
%     coin.XData = coinStatus - 256;
    
end