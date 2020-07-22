function Param = make_initial_guess_p(Data,n,k)

Param = struct();
Param.mu = [ ];
Param.sigma = [ ];
Param.lambda = [ ];

for i=1:n
    D=[];
    M=[];
    S=[];
    D = Data(Data(:,k+1)==i, :);
    for j=1:k
       M = [M mean(D(:,j))];
       for m=1:k
           if(j==m)
               S(j,m)=1;
           else
               S(j,m)=0;
           end  
       end   
    end
    Param.mu = [ Param.mu ; M];
%      Param.mu = [ 0.184930164	0.726652583	0.163244648	0.708301774; 0.777685926	0.731012715	0.759189692	0.747187943; 0.229609798	0.191862009	0.194882785	0.207606941;0.796258522	0.177762883	0.721583181	0.171868151];
    Param.sigma = [ Param.sigma ; S];
    Param.lambda = [ Param.lambda ; 1/n]; 
end
end