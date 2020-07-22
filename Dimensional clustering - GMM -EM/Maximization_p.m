function Param = Maximization_p(Data, Param,n,k)

for i=1:n
    S=[];
points_in_cluster = Data(Data(:,k+1) == i,:);
Param.lambda(1,i) = size(points_in_cluster,1) / size(Data,1);
S=cov(points_in_cluster(:,1:k));
   for j=1:k
      Param.mu(i,j) = mean(points_in_cluster(:,j));
      for m=1:k
         Param.sigma((i-1)*k +j,m)=S(j,m);
      end
   end
end
end