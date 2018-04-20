pkg load symbolic;

#f = (x*sin(x))-1;
syms f(x) df(x);
f(x) = (2*x^2) + ((2*x^2) - 3)/x^3;

df(x) = diff(f,x,1);
fx = function_handle(f);
fxd = function_handle(df);

tolerancia = input('Ingrese una tolerancia deseada: ');
pn = input('Ingrese el primer valor para iterar: ');
#calculoIteraciones = ceil((log((b-a)/tolerancia))/log(2));
calculoIteraciones = floor((3)/log10(2));
i = 0;

while ( i < calculoIteraciones)
  pn = pn - (fx(pn)/fxd(pn)) ;
  if( fx(pn) <= tolerancia )
    break;
  endif

  i++;
endwhile

if ( i == calculoIteraciones)
  fprintf("No se pudo encontrar la raiz");
else
  fprintf("El valor de la raiz es: %f",pn);
endif
