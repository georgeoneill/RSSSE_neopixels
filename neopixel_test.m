clear all
close all
clc

delete(instrfindall)
% [~, port] = IDSerialComs('Arduino Uno');
ard = initialize_serial_port('/dev/cu.usbmodem1421');

%%

t = linspace(0,1,3000);
r = cos(5*pi*t);
g = cos(5*pi*t - (2*pi)/3);
b = cos(5*pi*t - (4*pi)/3);
 for meh = 1:10
    for ii = 1:3000
%         meh = rand(1,3);
        R = sprintf('%03d',round(255*r(ii)^2));
        G = sprintf('%03d',round(255*g(ii)^2));
        B = sprintf('%03d',round(255*b(ii)^2));
        fprintf(ard,'%s',['0' R G B])
         pause(0.017)
% 
    end

 end
%     fprintf(ard,'%s','000000000')
%%
for ii = 1:11000
    id =  sprintf('%03d',round(255*rand),round(255*rand),round(255*rand));
    fprintf(ard,'%s',[id])
end

%%
delete(instrfindall)
