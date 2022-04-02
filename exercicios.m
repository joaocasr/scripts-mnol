% EX11(METODO DA SECANTE)

x1= -1;
x2= 0;
fx1 = temperatura(-1);
fx2 = temperatura(0);
x3 = x2-(((x2-x1).*fx2)./(fx2-fx1))

% 1 caso de paragem
fx3=temperatura(x3);
cp1x3 = abs(fx3);
cp2x3 = abs(x3-x2)./abs(x3);

x4 = x3-((x3-x2).*fx3)./(fx3-fx2)

% 2 caso de paragem
fx4=temperatura(x4)
cp1x4 = abs(fx4)
cp2x4 = abs(x4-x3)./abs(x4)

x5 = x4-(((x4-x3).*fx4)./(fx4-fx3))

% 3 caso de paragem
fx5=temperatura(x5)
cp1x5 = abs(fx5)
cp2x5 = abs(x5-x4)./abs(x5)


function f = temperatura(x)
f = (exp(-0.5.*x))./((exp(exp(0.5.*x))+exp(exp(-0.5.*x)))./2)-sqrt(0.5.*0.088);
end

%--------------------------------------------------------------

% EX15(METODO DE NEWTON)

x0=5; 
options=optimset('Display','iter');
[x,fval,exitflag,output]=fsolve(@concentracao,x0,options)

function f = concentracao(t)
f = 70.*exp(-1.5.*t) + 25.*exp(-0.075.*t)-9;
end



%--------------------------------------------------------------


% EX16(METODO DE NEWTON)

x0=6;
options=optimset('Display','iter');
[x,fval,exitflag,output]=fsolve(@ex16,x0,options)

function f = ex16(x)
f=7*(2-0.9^(x))-10;
end


%--------------------------------------------------------------

% EX17(METODO DA SECANTE)

x1= 40;
x2= 45;
fx1 = velocidade(x1);
fx2 = velocidade(x2);
x3 = x2-(((x2-x1).*fx2)./(fx2-fx1))

% 1 caso de paragem
fx3=velocidade(x3);
cp1x3 = abs(fx3)
cp2x3 = abs(x3-x2)./abs(x3)
% abs(fx3)<ε2 && (abs(x3-x2)/abs(x3))<ε1;

% 2 caso de paragem

x4 = x3-((x3-x2).*fx3)./(fx3-fx2)
%caso de paragem
fx4=velocidade(x4);
cp1x4 = abs(fx4)
cp2x4 = abs(x4-x3)./abs(x4)

x5 = x4-(((x4-x3).*fx4)./(fx4-fx3))

% 3 caso de paragem
fx5=velocidade(x5);
cp1x5 = abs(fx5)
cp2x5 = abs(x5-x4)./abs(x5)

function f = velocidade(v)
f = (1 ./ (  (0.08^2) .*  32 ) ) .*  ( 527  .*   (527-470)  .*  log(  1  +  (  (  0.08 .*  v )./ (  527-470  )  )  ) - (527 .* 0.08 .* v)    ) + 300;
end


%--------------------------------------------------------------------


% EX 18(METODO DA SECANTE)

x1= 0.05;
x2= 0.15;
fx1 = liberal(x1);
fx2 = liberal(x2);
x3 = x2-(((x2-x1).*fx2)./(fx2-fx1));

% 1 caso de paragem
fx3=liberal(x3);
cp1x3 = abs(fx3)
cp2x3 = abs(x3-x2)./abs(x3)

x4 = x3-((x3-x2).*fx3)./(fx3-fx2);

% 2 caso de paragem
fx4=liberal(x4);
cp1x4 = abs(fx4)
cp2x4 = abs(x4-x3)./abs(x4)

x5 = x4-(((x4-x3).*fx4)./(fx4-fx3))

% 3 caso de paragem
fx5=liberal(x5)
cp1x5 = abs(fx5)
cp2x5 = abs(x5-x4)./abs(x5)


function f = liberal(i)
f = (20000.*((i.*(1+i)^6)./(((1+i)^6)-1)))-4000;
end

%--------------------------------------------------------------

% EX19(METODO DA SECANTE)

x1= 20;
x2= 30;
fx1 = velocidade(x1);
fx2 = velocidade(x2);
x3 = x2-(((x2-x1).*fx2)./(fx2-fx1))

% 1 caso de paragem
fx3=velocidade(x3);
cp1x3 = abs(fx3)
cp2x3 = abs(x3-x2)./abs(x3)
% abs(fx3)<ε2 && (abs(x3-x2)/abs(x3))<ε1;

x4 = x3-((x3-x2).*fx3)./(fx3-fx2);


% 2 caso de paragem
fx4=velocidade(x4)
cp1x4 = abs(fx4)
cp2x4 = abs(x4-x3)./abs(x4)
% abs(fx4)<ε2 && (abs(x4-x3)./abs(x4))<ε1;

x5 = x4-(((x4-x3).*fx4)./(fx4-fx3))

%3 caso de paragem
fx5=velocidade(x5)
cp1x5 = abs(fx5)
cp2x5 = abs(x5-x4)./abs(x5)


function f = velocidade(t)
f = 2200.*log((1.6.*10^5)./((1.6.*10^5)-(2680.*t)))- 9.8.*t - 1000;
end

%--------------------------------------------------------------

% EX20(Zeros de equações não lineares)

format long;

x0=[2 ; 0]; 
[x,fval,exitflag,output]=fsolve(@fun1,x0) 
%funcao
function F=fun1(x)
F(1)=x(1)^2-x(2)^2-9;
F(2)=x(1)+x(2)-1;
end

%--------------------------------------------------------------

% EX21(Zeros de equações não lineares)

format long;
x0=[1.5 ; 0.5]; 
[x,fval,exitflag,output]=fsolve(@fun1,x0) 
%funcao
function F=fun1(x)
F(1)=x(1)^2+x(2)^2-2;
F(2)=x(1)^2-x(2)^2-1;
end

%--------------------------------------------------------------

% EX22(Zeros de equações não lineares)

format long;
x0 = [1,-2];
[x,favl,exitflag,output] = fsolve(@fun1,x0)
%funcao
function F=fun1(x)
F(1)=-x(2)+2.*x(1)^2-4;
F(2)=-x(2)-x(2)^3-x(1)-8;
end

%--------------------------------------------------------------

% EX33(spline cúbica natural)


%---->spline cúbica natural<----------
% xi    −1  0  4  5
% f(xi) 0.4375  0  2  1.5625

xx = [-1,0,4,5];
yy = [0.4375,0,2,1.5625];
s = spline(xx,yy,2)

%--------------------------------------------------------------

% EX34(spline cúbica natural)

%---->spline cúbica natural<----------
% xi 1.5 2.0 2.2 3.0 3.8 4.0
% f(xi) 4.9 3.3 3.0 2.0 1.75 1.5

xx = [1.5, 2.0, 2.2, 3.0, 3.8, 4.0];
yy = [4.9, 3.3, 3.0, 2.0, 1.75, 1.5];
temp = spline(xx,yy,1.75)


%--------------------------------------------------------------

% EX35(spline cúbica completa)


%---->spline cúbica completa<----------
% OMITIR SEMPRE 2º E PENULTIMO PONTOS
%vel (Km/h)        15 20 25 30 40 50
%distância (m)     16 20 34 40 60 90

xx = [15,25,30,50];
yy = [16,34,40,90];
f0 = (16-20)./(15-20);
fn = (60-90)./(40-50);
s_completa = spline(xx, [f0 yy fn])
s_completa.coefs
% para v = 45kmh
dist = spline(xx, [f0 yy fn], 45)

%{ Verificar os coeficientes de cada segmento da spline 
xx = [1.5, 2.0, 2.2, 3.0, 3.8, 4.0];
yy = [4.9, 3.3, 3.0, 2.0, 1.75, 1.5];
s = spline(xx,yy)
s.coefs
%}


%--------------------------------------------------------------

% EX54(spline cúbica completa)

x = [0 1.25 2.5 3.75]
f = [0.260 0.208 0.172 0.145]
[P2,S2] = polyfit(x,f,2)
SQR = S2.normr^2

novo_x = 0:0.01:3.75;
novo_f = polyval(P2,novo_x);
plot(x,f,'o',novo_x,novo_f,'r')


