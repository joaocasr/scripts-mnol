
op = optimset('MaxIter',4);
[x,fval,exitflag,output] = fminsearch(@funcao,[1,1],op)
function [f] = funcao(x)
    f = max(abs(x(1)),abs(x(2)-1));
end
