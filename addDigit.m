function str = addDigit(str,digit)
if length(str)<digit
    str = ['0',str];
    str = addDigit(str,digit);
end
end
