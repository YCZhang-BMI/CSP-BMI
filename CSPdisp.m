function CSPdisp(CSP)

ChannelLocation;
load CSPgoodChan goodChan;
figure;
for i = 1:6
    subplot(2,3,i)
    topography(CSP(:,i),loc(goodChan,:),3);
    axis equal
    caxis('auto')
end

end