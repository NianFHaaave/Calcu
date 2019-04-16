a=input('请输入当地居民用电电价：');
b=input('请输入当地脱硫煤电价:');
c=input('请输入电价补贴：');
A=xlsread('sheet1.xlsx')
format compact
system_earning=abs(A(:,2)-A(:,4)*(a+c)+A(:,4)*(b+c));
system_sum=sum(A(:,8))
xlswrite('D:\result.xlsx','sheet1')
