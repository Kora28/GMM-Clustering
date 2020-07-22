function [Data, ans] = expectation_p(Data, Param,n,k,ans)

for ii = 1: size(Data,1)
    x = Data(ii, 1:k);
    max=0;
    for i=1:n
      p_cluster = prob_p(x, Param.mu(i,:), Param.sigma(k*(i-1)+1 :k*i,1:k),Param.lambda(i,1));
      if(p_cluster>=max)
          max=p_cluster;
          Data(ii,k+1)=i;
      end
    end
    ans= ans+log(max);
end
end