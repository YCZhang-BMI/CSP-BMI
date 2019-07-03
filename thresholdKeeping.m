thresholdSlider.Value=round(thresholdSlider.Value,4);
if thresholdERD ~= thresholdSlider.Value
    thresholdText.String = num2str(thresholdSlider.Value);
    % drawnow;
end
if thresholdERD ~= str2double(thresholdText.String)
    thresholdSlider.Value = str2double(thresholdText.String);
    dataThreshold = [dataThreshold [thresholdSlider.Value count_sample trialCount]'];
    %    drawnow;
end
drawnow;
%     disp(thresholdERD);%pause(0)
thresholdERD = thresholdSlider.Value;
