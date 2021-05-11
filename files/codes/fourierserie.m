function x_f=fourierserie(T,t,Ntot)

w=2*pi/T;
x_f=zeros(1,length(t));
for k=-Ntot:Ntot
    c_k=fouriercoeff(k);
    x_f=x_f+c_k*exp(1j*w*k*t);
end

end