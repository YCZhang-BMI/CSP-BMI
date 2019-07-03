Sampling_Rate = 1000;    % Sampling Rate = Date flow rate, "DON'T CHANGE"
count_sample  = 0;       % Please initialize it to 0 by each trial
preCountSampleB = 1;
sample_Num    = 0;
BufferFreshRate = 4000;
Buffer = zeros(BufferFreshRate,160);
BufferF = zeros(BufferFreshRate,160);
