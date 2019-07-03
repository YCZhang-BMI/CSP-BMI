clear figure 10 figure 100
Fs   = 1000;
scrsz = get(groot,'ScreenSize');
% pos1    =   [1600,-180,950,1178];      % new set
pos1=[scrsz(3)+1 -400 975 2356];
disp    =   figure(10);
set(gcf,'color',[0 0 0],'position',pos1,'menu','none','toolbar','none');axis off;axis tight;
t       =   text(1,1,'Rest','fontsize',160,'color','y','FontWeight','bold','HorizontalAlignment','center');ylim([0 2]);xlim([0 2]);



% disp3   =   figure(101);%No100 is ERD FeedBack
% pos2=[scrsz(3)*2+1 -300 975 2356];
% set(gcf,'menu','none','toolbar','none','position',[scrsz(3)/2+1 1 scrsz(3)/2 scrsz(4)],'color',[0 0 0]) % new set

disp2   =   figure(100);%No100 is ERD FeedBack
hold on;
line0   =   line([1 5],[0 0],'color','r','LineWidth',4);
line1   =   line([1 2.5],[0 0],'color','g','LineWidth',4);
line2   =   line([3.5 5],[0 0],'color','g','LineWidth',4);
plot0   =   bar(3,0,'r','BarWidth',1,'LineStyle','none');
baseline_handle=get(plot0,'BaseLine');
set(baseline_handle,'LineStyle','none');
%set(gcf,'menu','none','toolbar','none','position',[900 100 683 768],'color',[0 0 0])

pos1=[scrsz(3)*3/2+1 -400 975 2356];
set(gcf,'menu','none','toolbar','none','position',[2250 -400 975 2356],'color',[0 0 0]) % new set

%set(gcf,'menu','none','toolbar','none','position',[2400,0,850,1038],'color',[0 0 0])
axis tight;
axis off
xlim([1 5])
ylim([-100 100])
hold off;

%% 1.Setpalameter
%     ch(1:6)                 =   [7 31 5 80 106 129];
%    CommonWithoutCh=[1 2 3 4 8 9 10 11 14 15 16 17 18 19 21 22 23 25 26 32 125 126 127 128];
%    ch=1:129;
%    ch(CommonWithoutCh)=[];
   
    ch(1:7)                =   [87 93 103 104 105 110 111];
%1.2 Frequency
    Freq_max               =   13;
    Freq_min               =   8;
%1.3 Trial Num
    Trial_num              =   ones(30,1);
            %1.7 ERD thlesold
            Th=get(UITh,'Value');
            if Th==1
                ValTh=5;
                Trial_num(1:30)        =   1;%TargetCode=1 Imagery 5%
            elseif Th==2
                ValTh=30;
                Trial_num(1:30)        =   2;%TargetCode=2 Imagery 15%
            elseif Th==3
                ValTh=0;
                Trial_num(1:30)        =   3;%TargetCode=3 Rest
            end
    NumOfTrial             =   20; %20回TMS打ったら終わり
    Trial_num_int=30;
    Trial_matrix=randperm(30);
    TargetCode(1:30)=Trial_num(Trial_matrix);
    %TargetCode=1 Imagery
    %TargetCode=2 Rest
    R=[0 1000 2000 3000];
    R_num=randperm(4);
    
%1.4 Filter
    Band                   =   [3 70];
    Wn                     =   [Band(1) Band(2)]/(Fs/2);
    [B,A]                  =    butter(3, Wn);
    
    EMG_Band                   =   [5 400];
    EMG_Wn                     =   [EMG_Band(1) EMG_Band(2)]/(Fs/2);
    [EMGB,EMGA]                =    butter(3, EMG_Wn);
    
%1.5 Band stop filter
    stopBand               =   [49 51];
    stopWn                 =   [stopBand(1) stopBand(2)]/(Fs/2);
    [stopB,stopA]          =   butter(3,stopWn,'stop');

%1.6 Difine buffering 
    eSample                =    zeros(2*Fs,129); %% リアルタイムで参照できるデータ配列を2*Fsの長さに変更
    stac                   =    zeros(11,1);



%2.1 setting&Initializetion
%2.1.1 makeFB figure
    Mov(1:10)       = 0;
    MovEMG(1:10)       = 0;
    r                   =    randi([10001 12000],1);
    count               =    1;
    countpl             =    1;
    count_sample        =    1;
    count_reset         =    300000;
    count_robot         =    0;
    precount_sample     =    1;
    RestStopper         =    0;
    ReadyStopper        =    0;
    TaskStopper         =    0;
    TMS_Stopper         =    0;
    BufferStopper       =    0;
    NumOfStim           =    0;
    RefferenceData      =    zeros(Fs,14);
    Fsample             =    zeros(Fs,14);
    trial_count         =    1;
    StimERD             =    zeros(20,1);
    if exist('SessionCount','var')==0
         SessionCount=1;
    end
    
    
    h=hanning(Fs);
    tSignal=zeros(NumOfTrial,2*Fs);
    refSignal=zeros(NumOfTrial,2*Fs);
    

    
