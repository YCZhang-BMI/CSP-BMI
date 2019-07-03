if breakFlag ==0
    pause(0.1)
    D.queueOutputData(OutputSignal(3,:));
    D.startBackground();
%     taskFigure.Visible = 'off';
%     ERDFigure.Visible = 'off';
%     disp.Visible = 'on';
%     moji.String = 'Break';
%     drawnow;
    breakFlag = 1;
%     dataScore(trialCount)=score;
end