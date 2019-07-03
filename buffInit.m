    if trialCount ==1&&initialFlag==0
        while (count_sample<4000)
        getDataBuffer;
        bufferFilt;
        end
        count_sample=0;
        initialFlag=1;
    end