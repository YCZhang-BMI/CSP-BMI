portNum = 2001;
% try
%     echoudp('on',portNum);
% catch
% end
u = udp('127.0.0.1',portNum);
fopen(u);
fwrite(u,'R011000100001040451');
