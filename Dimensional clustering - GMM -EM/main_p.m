clc, clear, close all
load threefourddata.txt;
Data=threefourddata;
s=size(Data);

k=s(2);
ans=0;
Data_r=[];
% labell = {'Sepal length','Sepal width','Petal Length','Petal width'};
n=input('Enter the no. of clusters');
% Data_r = [ Data_r  Data(:,1)];
for i=1:k
    Data_r = [ Data_r  Data(:,i)];
end
Data_r = [ Data_r randi(n,s(1),1)];
Param = make_initial_guess_p(Data_r,n,k);    
[Data_f, Param_f, ans] = EM_p(Data_r,Param,n,k,ans);
% ans=ans -(3+k+k*(k+1)/2)*(n/2)*log(s(1));
% scatter(n,ans,'filled');
% hold on;
g=1;
% for i=1:k
%     for m=1:k
%         subplot(k,k,g)
%         for j=1:n
%             Data_f1 = Data_f(Data_f(:,k+1)==j,1:k);
%             scatter(Data_f1(:,m), Data_f1(:,i),'filled');
%             hold on;
%         end
%         grid on; box on;
% %         xlabel(labell{m}); ylabel(labell{j});
%         g=g+1;
%         
%     end
% end 
% g=1;
% figure
% for i=k-23:(k-13)
%     for m=k-23:(k-13)
%         subplot(11,11,g)
%         for j=1:n
%             Data_f1 = Data_f(Data_f(:,k)==j, :);
%             scatter(Data_f1(:,m), Data_f1(:,i),'filled');
%             hold on;
%         end
%         grid on; box on;
% %         xlabel(labell{m}); ylabel(labell{j});
%         g=g+1;
%         
%     end
% end 

save Results.mat Data_f

