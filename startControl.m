
if label ~= preLabel
    tic;
    preStatus=status;
    preLabel=label;
end

interval = min(floor(toc*1000),10000-1);
status = (label-preStatus)*condFilt(interval+1)+preStatus;