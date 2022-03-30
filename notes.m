%----------------------------------------------------------------------------------------------%
% especificar uma matriz ampliada A|b 
% c-> solucao coluna
% d-> determinante da matriz A
% M-> matriz inversa
  
A = [ 1 2 3; 4 5 6; 7.0 8.0 9.0];
b = [12.6;10.8;4.0];
c = A\b;
d = det(A);
M = inv(A);

%----------------------------------------------------------------------------------------------%
% CALCULO DA SECANTE 

format long
fplot(@volume,[0,4]); % plot(@function,intervalo no eixo dos xx)
grid;

function f = volume(x)
f = ((pi.*x.^2.*(3-x))./3)-0.5;
end

% aproximação inicial o intervalo [0.25, 0.5] 
% 1 passo
% 1a iteracao

x1= 0.25;
x2= 0.5;
fx1 = volume(0.25);
fx2 = volume(0.5);
x3 = x2-((x2-x1).*fx2)./(fx2-fx1);

% 2 passo-caso de paragem
fx3=volume(x3);
cp1x3 = abs(fx3);
cp2x3 = abs(x3-x2)./abs(x3);
% abs(fx3)<ε2 && (abs(x3-x2)/abs(x3))<ε1;

% caso de paragem
% 2a iteracao

x4 = x3-((x3-x2).*fx3)./(fx3-fx2);
%caso de paragem
fx4=volume(x4);
cp1x4 = abs(fx4);
cp2x4 = abs(x4-x3)./abs(x4);
% abs(fx4)<ε2 && (abs(x4-x3)./abs(x4))<ε1;
% ...
      
%----------------------------------------------------------------------------------------------%
% SPLINE COMPLETA 

x=[10 12 18 27 30 34];  
y=[20 18 15 9 12 10];

xx=[10 18 27 34];
yy=[20 15 9 10];


f_linha_0=(20-18)/(10-12);
f_linha_n=(12-10)/(30-34);

s_completa = spline(xx,[f_linha_0 yy f_linha_n]);

s.completa.coefs


%----------------------------------------------------------------------------------------------%
%RESOLUCAO DE SISTEMAS POR ITERACAO
% 2x1 − x2 − e−x1 = 0
% −x1 + 2x2 − e−x2 = 0
x0=[-1 ; -1]; % estimativas iniciais para x(1) e x(2)
options=optimset(’Display’,’iter’); % mostra a solu ̧c~ao em cada it.
[x,fval,exitflag,output]=fsolve(@fun1,x0,options) % resolve
%funcao
function F=fun1(x)
F(1)=2*x(1)-x(2)-exp(-x(1));
F(2)=-x(1)+2*x(2)-exp(-x(2));
end
%%%%%%%%%%%%%%%%%%%%%


%----------------------------------------------------------------------------------------------%
%---->spline cúbica completa<----------
% OMITIR SEMPRE 2º E PENULTIMO PONTOS
%tempo        0 2 3 4 5
%temperatura  0 20 35 60 110
%1º Calcular f ′0 = (0 − 20)./(0 − 2) = 10
%2º Calcular f ′n = (60 − 110)./(4 − 5) = 0.3333

xx = [0,3,5];
yy = [0,35,110];
s_completa = spline(xx, [10 yy 0.3333])
s_completa.coefs
% para t = 4.2s
temp = spline(xx, [10 yy 0.3333], 4.2)
% Solucao: temp = 71.9525s

%----------------------------------------------------------------------------------------------%
%%CALCULAR_RAIZES_DE_POLINOMIOS%%%%
%P(x)=x5+3x3+2x+4=0

%Resolucao
c = [1 0 3 0 2 4];
r = roots(c)

%----------------------------------------------------------------------------------------------%
%%Calcular zero de uma funcao num intervalo-->SOLUCAO TEM QUE EXISTIR

[x,fval,exitflag,output] = fzero('2.*cos(x)-2',[2.*pi,3.*pi])

%----------------------------------------------------------------------------------------------%
% MODELO POLINOMIAL- GRAU2 (quadrático), usando a técnica dos mínimos quadrados 
% P2 ->polinomio de 2º grau SQR->soma quadrado dos restos

x = [0 1.25 2.5 3.75]
f = [0.260 0.208 0.172 0.145]
[P2,S2] = polyfit(x,f,2)% ->GRAU 2
SQR = S2.normr^2

novo_x = 0:0.01:3.75;
novo_f = polyval(P2,novo_x);
plot(x,f,'o',novo_x,novo_f,'r')

%----------------------------------------------------------------------------------------------%
% MODELO POLINOMIAL(grau 1) + MODELO NÃO POLINOMIAL - mínimos quadrados
% modelo do exercicio M (x, c1, c2) = c1/x + c2x
% P1 e P2 são as funcoes aproximadas da funcao f

x = [1.5 2.0 3.0 4.0]
f = [4.9 3.3 2.0 1.5]
[P1,S1] = polyfit(x,f,1)%->grau 1
SQR1 = S1.normr^2

[P2,S2] = polyfit(x,f,2)%->grau 2 
SQR2 = S2.normr^2

[c,resnorm] = lsqcurvefit(@functionn,[1,1],x,f)
resnorm

novo_x = 1.5:0.05:4;
novo_P1 = polyval(P1,novo_x);
novo_P2 = polyval(P2,novo_x);
novo_m = functionn(c,novo_x);
plot(x,f,'o',novo_x,novo_P1,'r',novo_x,novo_P2,'k',novo_x,novo_m,'g')

function f = functionn(c,x)
f = c(1).*x + c(2).*sin(x);
end


%----------------------------------------------------------------------------------------------%
% DETERMINAR MODELO NÃO POLINOMIAL-determinar os coeficientes do modelo c(1) e c(2)
f=[122 188 270 160 120];
x=[1 3 6 10 12];


[c,resnorm] = lsqcurvefit(@functione,[1,1],x,f)

function f = functione(c,x)
f = c(1).*x + c(2).*sin(x);
end
%----------------------------------------------------------------------------------------------%
%tabela de pontos -> trapz

f=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.65 0.6 0.6 0.7 0.8]
x=[0 0.1 0.2 0.3 0.4 0.5 0.6 3.6 6.6 9.6 9.8 10]

trapz(x,f)

%funcao integrada -> integral

integral(@funcao,0,1,'AbsTol',0.005)%abstol=tolerancia do erro absoluto
% valor sup 1 valor inf 0 erro truncatura 0.005

function f = funcao(x)
f = x.^2 + 1./(x+1);
end








