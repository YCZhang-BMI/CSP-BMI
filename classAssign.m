function [assign]=classAssign(n,trial)
a=trial/n;
temp=[];
for i =0:n-1
    temp=[temp,ones(1,a)*i];
end
assign=temp(randperm(trial));
end

