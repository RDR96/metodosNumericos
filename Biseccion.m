#{
pkg load symbolic;
a = 10;
syms x
 f = x * cos (x)
 df = diff (f)
 
 dfh = function_handle (df)
 dfh (a)
#}

a=input('Ingrese el valor del extremo izquierdo: ')
b=input('Ingrese el valor del extremo derecho: ');
tolerancia=input('Ingrese el valor de la torelancia : ');
f = (x*sin(x))-1;
fx = function_handle(f);

#{
if(fx(a)*fx(b) < 0)
 c=(b+a)/2;
 while(abs(fx(c)) > tolerancia)
  if(fx(a)*fx(c) < 0)
    b=c; 
    c=(a+b)/2;    
  else
    a=c;
    c=(a+b)/2;
  endif
 endwhile
else
  fprintf('El metodo no aplica');
endif

fprintf('Se tiene una raiz en C: %f',c);
#}

calculoIteraciones = ceil((log((b-a)/tolerancia))/log(2));
fprintf("El numero de iteracione que se harán %f",calculoIteraciones);
i = 0;
c = a + (b-a)/2;

while ( i < calculoIteraciones)
  if ( abs(fx(c)) <= tolerancia )
    break;
  endif
  
  if (fx(c)*fx(a) < 0)
    b = c;
  else
    a = c
  endif
  
  c = a + (b-a)/2;
  
  i++;
  
endwhile

if ( i == calculoIteraciones)
  fprintf("No se pudo encontrar la raiz");
else
  fprintf("El valor de la raiz es: %f",c);
endif



#{
function y = My_fun(x)
y=(x*sin(x))-1;
endfunction
#}

