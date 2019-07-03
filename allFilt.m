function [data,Filter]=allFilt(data,Filter)



for i=1:Filter.num
        [data,Filter.z{i}]=filter(Filter.coeff.b{i},Filter.coeff.a{i},data,Filter.z{i},1);
end

end