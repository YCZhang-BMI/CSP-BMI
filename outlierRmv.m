function out = outlierRmv(in)
ref=mean(in(9:14,:),1,'omitnan');
while find((ref>mean(ref)+2*std(ref))|(ref<mean(ref)-2*std(ref)))
in=in(:,(~((ref>mean(ref)+2*std(ref))|(ref<mean(ref)-2*std(ref)))));
ref=mean(in(9:14,:),1,'omitnan');
end
out = in;


end