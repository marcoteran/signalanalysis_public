function u = escalon(t_ini,t)

u=zeros(1,length(t));
t_index=find(t==t_ini);
u(t_index:end)=1;

end

