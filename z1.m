a=input('�����뵱�ؾ����õ��ۣ�');
b=input('�����뵱������ú���:');
c=input('�������۲�����');
A=xlsread('sheet1.xlsx')
format compact
system_earning=abs(A(:,2)-A(:,4)*(a+c)+A(:,4)*(b+c));
system_sum=sum(A(:,8))
xlswrite('D:\result.xlsx','sheet1')
