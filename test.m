clc;
clear;
c_index = 10;
d_index = 30;

buyer = matfile('buyer.mat');
buyer = buyer.buyer;

charging  = matfile('charging.mat');
charging = charging.charging;

seller = matfile('seller.mat');
seller = seller.seller;


discharging  = matfile('discharging.mat');
discharging = discharging.discharging;

l1= 0.01;

% avgPayment(buyer);
% hold on;
% avgReward(seller,l1);

chargingConvergence(charging,15);
hold on;

dischargingConvergence(discharging,10);


% a = zeros(18);
% for i = 1:18
%     temp =cell2mat(buyer(i));
%     temp2 = cell2mat(charging(i));
%     temp3 = temp.*temp2;
% %     size(temp3)
%     for j = 1:35
%         a(i) = a(i) + sum(temp3(j,:));
%     end
%     a(i) = a(i)/35;
% end
% 
% plot(a)
% 
% 
% seller = matfile('seller.mat');
% seller = seller.seller;
% discharging  = matfile('discharging.mat');
% discharging = discharging.discharging;
% 
% b = zeros(18);
% for i = 1:18
%     temp =cell2mat(seller(i));
%     temp = temp.^2;
%     temp = temp/(0.04);
%     temp2 = cell2mat(discharging(i));
%     temp3 = temp.*temp2;
%     
%  
%     
% %     size(temp3)
%     for j = 1:45
%         b(i) = b(i) + sum(temp3(:,j));
%     end
%     b(i) = b(i)/45;
% end
% 
%  plot(b)
