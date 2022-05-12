%%% FMINSEARCH


op = optimset('MaxIter',4);
[x,fval,exitflag,output] = fminsearch(@funcao,[1,1],op)
function [f] = funcao(x)
    f = max(abs(x(1)),abs(x(2)-1));
end

[x,fval,exitflag,output]=fminsearch(@NM1,[-1 1])
function [ f ] = NM1( x )
f=abs(x(1)*x(2))+x(2)^2;
end

%f(x1, x2) = max( (x(1) - 1).^2  ,  x(2).^2 + x(1) ,  4.*(x(2) - 1).^2)  )
%//funcao maximo com 3 parametros 
%. Inicie o processo com x(1) = (1, 0)T
[x,fval,exitflag,output]=fminsearch(@NM1,[-1, 0])
function [ f ] = NM1( x )
u=[(x(1)-1)^2 , x(2)^2+x(1) , 4*(x(2)-1)^2];
f=max(u);
end

%f(x1, x2) = max( (x(1) - 1).^2  ,  x(2).^2 + x(1) ,  4.*(x(2) - 1).^2)  )
%//funcao maximo com 3 parametros 
%. Inicie o processo com x(1) = (1, 0)T
% Use como tolerancias de paragem TolX = 10−6, TolFun = 10−8 e 100 como maximo de iteracoes.
op=optimset('TolX',1e-6,'TolFun',1e-8,'maxiter',100);
[x,fval,exitflag,output]=fminsearch(@NM1,[-1, 0],op)
function [ f ] = NM1( x )
u=[(x(1)-1)^2 , x(2)^2+x(1) , 4*(x(2)-1)^2];
f=max(u);
end


%%% FMINUNC

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
