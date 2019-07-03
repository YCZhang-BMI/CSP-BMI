if restFlag == 0
%     disp.Visible = 'on';
%     moji.String = strcat('Rest     ',num2str(trialCount));
%     moji.Color  = [0.9294 0.6902 0.1294];
%     drawnow;
    pause(0);
    D.queueOutputData(OutputSignal(1,:));
    D.startBackground();
    %     dataDIN1 = [dataDIN1 count_sample];
    %     count_sample = 0;    
    restFlag =1;
end

