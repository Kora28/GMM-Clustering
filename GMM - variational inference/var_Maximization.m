function Param = var_Maximization(Data, Param,init,n,k)
m=[]; 
for i=1:n
  summ= sum(Param.prob(:,i),1);
  m=sum(Param.prob(:,i)'*Data(:,1:k))./summ; 
  Param.beta(i) = init.beta(i) + summ; 
  Param.degree(i) = init.degree(i) +summ;
  Param.lambda(i) = init.lambda(i) + summ;
  Param.mu(i,:) = (init.beta(i).*init.mu(i,:) + m.*summ)./Param.beta(i);
  first_part=zeros(k,k);
  for j=1:size(Data,1)
      diff= Data(j,1:k)-m;
      diff1=m-Param.mu(i,:);
      ans_1 = diff'*diff;
      ans1 = diff1'*diff;
      first_part=first_part + Param.prob(j,i).*ans_1;
      second_part = (init.beta(i)*summ)*ans1./Param.beta(i);
  end
  
  Param.sigma(:,:,i) = init.sigma(:,:,i) + first_part +second_part;
end
end  