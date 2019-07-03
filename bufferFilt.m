if count_sample-filtCount>4000||filtCount>count_sample||count_sample == 1
    [temp,fz1]= filter(HB,HA,Buffer,[],1);
    [temp,fz2]= filter(stopB1,stopA1,temp,[],1);
    [temp,fz3]= filter(stopB2,stopA2,temp,[],1);
    [BufferF,fz4]= filter(B,A,temp,[],1);
else
    
    if count_sample-filtCount<4000
        [temp,fz1]= filter(HB,HA,Buffer(end-(count_sample-filtCount)+1:end,:),fz1,1);
        [temp,fz2]= filter(stopB1,stopA1,temp,fz2,1);
        [temp,fz3]= filter(stopB2,stopA2,temp,fz3,1);
        [temp,fz4]= filter(B,A,temp,fz4,1);
        BufferF(1:end-(count_sample-filtCount),:)=BufferF((count_sample-filtCount+1:end),:);
        BufferF(end-(count_sample-filtCount)+1:end,:)=temp;
    end
end
filtCount = count_sample;