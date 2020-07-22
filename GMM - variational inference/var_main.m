clc, clear, close all
load sixddata.txt;
Data=sixddata;
s=size(Data);
k=s(2);
Data_r=[];
n=input('Enter the no. of clusters');
for i=1:k
    Data_r = [ Data_r  Data(:,i)];
    end
Data_r = [ Data_r randi(n,s(1),1)];
Param = var_initial_guess(Data_r,n,k);    
[Data_f, Param_f] = var_EM(Data_r,Param,n,k);
for i=1:size(Data_f,1)
    max=0;
    for j=1:n
        if(Param_f.prob(i,j)>=max)
            max=Param_f.prob(i,j);
            Data_f(i,k+1)=j;
        end
    end
end 
g=1;
figure
title('Variational Inference method');
for i=1:k
    for m=1:k
        subplot(k,k,g)
        for j=1:n
            Data_f1 = Data_f(Data_f(:,k+1)==j,1:k);
            scatter(Data_f1(:,m), Data_f1(:,i),'filled');
            hold on;
        end
        grid on; box on;
%          xlabel(labell{m}); ylabel(labell{j});
        g=g+1;
        
    end
end 
sgtitle('Variational Inference method');

