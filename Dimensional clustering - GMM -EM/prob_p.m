function p = prob_p(point, mu, sigma,lambda)

p=lambda*mvnpdf(point,mu,sigma);
end