
op = optimset('MaxIter',4);
[x,fval,exitflag,output] = fminsearch(@funcao,[1,1],op)
function [f] = funcao(x)
    f = max(abs(x(1)),abs(x(2)-1));
end

%{
 metodo quasi-Newton e a formula de atualizacao da Hessiana
 BFGS->predefinido

bfgs - (default) aproxima a Hessiana pela f´ormula BFGS
lbfgs - aproxima a Hessiana pela Low-memory BFGS (problemas de grandes dimens˜oes)
dfp - aproxima a Hessiana pela f´ormula DFP

%}
op=optimset('hessupdate','dfp');
[x,fval,exitflag,output]=fminunc(@QN,[1,0],op)
function [ f ] = QN( x )
f=-(20.*x(1)+26.*x(2)+4.*x(1)*x(2)-4.*x(2));
end
