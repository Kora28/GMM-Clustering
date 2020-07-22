function p = var_prob(point, mu, sigma,~,beta,degree,step,n)
p=[];
summ=0;
for i=1:n
diff=point - mu(i,:);
sig = beta(i).*inv(sigma(:,:,i));
ans1=diff*sig*diff';
p(i)=step(i) - 0.5*degree(i)*ans1;
p(i)=exp(p(i));
summ=summ+p(i);
end
p=p/summ;
end