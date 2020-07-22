function  Param = var_expectation(Data, Param,n,k)
step=[];
for i=1:n
step(i)= 0.5*(log(abs(det(Param.sigma(:,:,i)))) + k*log(2) + sum(psi(0,0.5*bsxfun(@minus,Param.degree(i)+1,(1:k)')),1) - k/Param.beta(i))+ psi(Param.lambda(i)) - psi(sum(Param.lambda));
end
for ii = 1: size(Data,1)
    x = Data(ii, 1:k);
    Param.prob(ii,:)= var_prob(x, Param.mu, Param.sigma,Param.lambda,Param.beta,Param.degree,step,n);
end
end