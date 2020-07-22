function [Data_f, Param_f, ans] = EM_p(Data, Param,n,k,ans)
shift = 10000;  
iter = 0;       
epsilon = 0.0000001; 


while shift > epsilon
    iter = iter + 1;

    % E-step
    [Data_, ans] = expectation_p(Data, Param,n,k,ans);
    
    % M-step
    Param_ = Maximization_p(Data_, Param,n,k);
    
    % calculate the distance/error from the previous set of params
    shift = calc_distance_p(Param, Param_,n);
        

    Data = Data_;
    Param = Param_;
    fprintf("Shift is %f \n",shift);
    
    clear Data_ Param_
end
Data_f = Data;
Param_f = Param;

end