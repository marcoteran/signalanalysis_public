function c_k = fouriercoeff(k)
%------
% Inputs:
% k - numero de armónico
% Outputs:
% c_k - coeficiente de Fourier número k
%----
if k==0
   c_k=33/14;
else
    c_k= (7/(2*pi*k)^2)*exp(-1j*(6*pi/7)*k)+...
    (1j*3/(2*pi*k))*exp(-1j*2*pi*k)-...
    7/(2*pi*k)^2;
end


end