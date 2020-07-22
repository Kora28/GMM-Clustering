function Param = var_initial_guess(Data,n,k)

Param = struct();
Param.mu = [ ];
Param.sigma = [ ];
Param.lambda = [ ];
Param.beta =[];
Param.degree = [];
% Param.prob=ones(size(Data,1),n)/n;
 for i=1:size(Data,1)
     Param.prob(i,Data(i,k+1))=1;
 end

for i=1:n
    D=[];
    M=[];
    Si=[];
    trace=0;
    D = Data(Data(:,k+1)==i, :);
    sz=size(D);
    for j=1:k
       M = [M mean(D(:,j))];
       for m=1:k
           if(j==m)
               Si(j,m)=1000;
               trace =trace +Si(j,m);
           else
               Si(j,m)=1;
           end  
       end   
    end
     Param.mu = [ Param.mu ; M];
%     Param.mu= [1.865120471	1.865877822	1.865090153	1.865852167;2.288348162	2.288301533	2.288329683	2.288317693 ;2.435550158	2.435491534	2.435496225	2.435515986; 1.782317122	1.781808191	1.782255675	1.781803341];

    Param.sigma(:,:,i) = Si;
    Param.lambda = [ Param.lambda  sz(1)]; 
    Param.beta = [Param.beta  trace];
    Param.degree = [Param.degree  k];
    
end
end