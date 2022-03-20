% especificar uma matriz ampliada A|b 
% c-> solucao coluna
% d-> determinante da matriz A
% M-> matriz inversa
  
A = [ 1 2 3; 4 5 6; 7.0 8.0 9.0];
b = [12.6;10.8;4.0];
c = A\b;
d = det(A);
M = inv(A);


% calcular secante 

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
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=[10 12 18 27 30 34];  
y=[20 18 15 9 12 10];

xx=[10 18 27 34];
yy=[20 15 9 10];


f_linha_0=(20-18)/(10-12);
f_linha_n=(12-10)/(30-34);

s_completa = spline(xx,[f_linha_0 yy f_linha_n]);

s.completa.coefs
