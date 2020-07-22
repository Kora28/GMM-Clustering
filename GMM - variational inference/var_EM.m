function [Data_f, Param_f] = var_EM(Data, Param,n,k)
shift = 10000;  
iter = 0;       
epsilon = 0.0001; 
init=Param;
Param = var_Maximization(Data, Param,init,n,k);
while shift > epsilon

    % E-step
     Param1 = var_expectation(Data, Param,n,k);
    % M-step
    Param_ = var_Maximization(Data, Param1,init,n,k);
    
    % calculate the distance/error from the previous set of params
    shift = var_calc_distance(Param, Param_,n);
        
    
    Param = Param_;
     fprintf("Shift is %f \n",shift);
    
    clear Data_ Param_
end
Data_f = Data;
Param_f = Param;
end