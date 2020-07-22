function d = calc_distance_p(Param, Param_,n)
d=0;
for i=1:n
    d=d+norm(Param.mu(i,:) - Param_.mu(i,:));
end

end