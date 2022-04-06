% EX1
format long;
x0=[0 ; 0.1]; 
op=optimset('tolfun',1e-1,'tolX',1e-2);
[x,fval,exitflag,output]=fsolve(@fun1,x0,op) 

%funcao
function F=fun1(x)
F(1)=-5.*x(1)+3.*sin(x(1))+cos(x(2));
F(2)=4.*cos(x(1)) + 2.*sin(x(2))-5.*x(2);
end
%% RESPOSTA
% a) x1*=0.2028684405, x2*=1.1497310590
% b) 2 iterações.
%----------------------------------------------------------
% EX2
format long;
x0= 0.04;
op=optimset('tolX',1e-1);
[x,fval,exitflag,output]=fsolve(@fun,x0,op)

function f = fun(x)
f = ((1-(1+x).^-12)./x) - ((315-91)./24);
end

%% RESPOSTA
% a) Sim. exitflag=1.
% b) 2 iterações.
% c) x* = 0.040954076659
%---------------------------------------------------------------
% EX3

%guardar 2 e penultimo pontos para estimar f’0 e f’n
xx = [1.5 2.2 3.0 4.0];
yy = [4.9 3.0 2.0 1.5];
f0 = -2;
fn = 3;
s_completa = spline(xx, [f0 yy fn])
s_completa.coefs
r = spline(xx, [f0 yy fn], 2.5)

%% RESPOSTA
% c) 2.5293935644
% b) -1.741513437057992(x-2.2)^3 + 2.553041018387553(x-2.2)^2 - 2.177864214992928(x-2.2) + 3.000000000000000
%----------------------------------------------------------------
x = [1.5 2.0 2.2 3.0 3.8 4.0];
f = [4.9 3.3 3.0 2.0 1.75 1.5];

[P2,S2] = polyfit(x,f,1)
SQR = S2.normr^2 
resistencia = polyval(P2,3.5)
%% RESPOSTA
% e) resistencia = 1.863271904300032
% f) -1.171193016488846 * x + 5.962447462010992
%---------------------------------------------------------------

x = [1.5 2.0 2.2 3.0 3.8 4.0];
f = [4.9 3.3 3.0 2.0 1.75 1.5];

[P2,S2] = polyfit(x,f,2)
SQR = S2.normr^2 
resistencia = polyval(P2,3.3)
%% RESPOSTA
% g) resistencia = 1.676549098769078
% h) 0.679977040926695* x^2 - 4.988231934396943* x + 10.732764506587280
% i) o polinómio correspondente à parábola é uma melhor aproximação face
% aos pontos apresentados na tabela visto que o valor dos seus resíduos é
% menor que os resíduos da reta
%---------------------------------------------------------------

x = [1.5 2.0 2.2 3.0 3.8 4.0];
f = [4.9 3.3 3.0 2.0 1.75 1.5];

[P1,S1] = polyfit(x,f,1)%->grau 1
SQR1 = S1.normr^2

[P2,S2] = polyfit(x,f,2)%->grau 2 
SQR2 = S2.normr^2

[c,resnorm] = lsqcurvefit(@functionn,[1,1,1],x,f)

novo_x = 1.5:0.05:4;
novo_P1 = polyval(P1,novo_x);
novo_P2 = polyval(P2,novo_x);
novo_m = functionn(c,novo_x);
plot(x,f,'o',novo_x,novo_P1,'r',novo_x,novo_P2,'k',novo_x,novo_m,'g')

function f = functionn(c,x)
f =  c(1).* cos(x) + c(2).* (1./x)+ c(3).*x ;
end
%% RESPOSTA
% j) 0.52620 * cos(x) + 7.09069 * (1/x) + 0.04431 * x
% k) Modelo não polinomial linear m(x) é a melhor aproximação com um
% resíduo de 0.04734
%-------------------------------------------------------------------

% EX4

x= [0 10 15 25 30 48 60 70 90];
y= [0 10 30 25 10 28 40 42 30];
trapz(x,f)

%% RESPOSTA
% comprimento = 2392.5 m


% EX5
integral(@funcao,0,10)

function f = funcao(x)
f = x.*(1-exp(-x)) + x.^3;
end
%% RESPOSTA
% I = 2549 

