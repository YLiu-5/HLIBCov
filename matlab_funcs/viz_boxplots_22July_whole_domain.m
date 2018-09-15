clc;
clear;
format long
set(gca,'FontSize',18);
%ell2000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_2K_19April.txt', '-ascii');

d2000=load('~/hlibpro-2.6/examples/111res_29May_2K.txt', '-ascii');
d4000=load('~/hlibpro-2.6/examples/111res_29May_4K.txt', '-ascii');
d8000=load('~/hlibpro-2.6/examples/111res_29May_8K.txt', '-ascii');
d16000=load('~/hlibpro-2.6/examples/111res_29May_16K.txt', '-ascii');
%d2000=load('~/hlibpro-2.6/examples/111res_21July_2K.txt', '-ascii');
%d4000=load('~/hlibpro-2.6/examples/111res_21July_4K.txt', '-ascii');
%d8000=load('~/hlibpro-2.6/examples/111res_21July_8K.txt', '-ascii');
%d16000=load('~/hlibpro-2.6/examples/111res_21July_16K.txt', '-ascii');


%d32000=load('~/hlibpro-2.6/examples/111res_29May_32K.txt', '-ascii');
%d32000=load('~/hlibpro-2.6/examples//111res_Genton_11June_32K.txt', '-ascii');
%d64000=load('~/hlibpro-2.6/examples/111res_29May_64K.txt', '-ascii');
%d64000=load('~/hlibpro-2.6/examples/111res_Genton_11June_64K.txt', '-ascii');
%d128000=load('~/hlibpro-2.6/examples/111res_29May_128K.txt', '-ascii');
%d32000=load('~/hlibpro-2.6/examples/111res_Genton_11June_32K.txt', '-ascii');
d32000=load('~/hlibpro-2.6/examples/111res_21July_32K.txt', '-ascii');
%d64000=load('~/hlibpro-2.6/examples/111res_Genton_21June_64K.txt', '-ascii');
%d128000=load('~/hlibpro-2.6/examples/111res_Genton_21June_128K.txt', '-ascii');
d64000=load('~/hlibpro-2.6/examples/111res_21July_64K.txt', '-ascii');
d128000=load('~/hlibpro-2.6/examples//111res_21July_128K.txt', '-ascii');


ell2=d2000(:,4);
ell4=d4000(:,4);
ell8=d8000(:,4);
ell16=d16000(:,4);
ell32=d32000(:,4);
ell64=d64000(:,4);
ell128=d128000(:,4);
%ell128=d128000(:,3);

nu2=d2000(:,3);
nu4=d4000(:,3);
nu8=d8000(:,3);
nu16=d16000(:,3);
nu32=d32000(:,3);
nu64=d64000(:,3);
nu128=d128000(:,3);
%nu128=d128000(:,2);

sigma2=d2000(:,5);
sigma4=d4000(:,5);
sigma8=d8000(:,5);
sigma16=d16000(:,5);
sigma32=d32000(:,5);
sigma64=d64000(:,5);
sigma128=d128000(:,5);
%sigma128=d128000(:,4);


Nell2=size(ell2,1);
Nell4=size(ell4,1);
Nell8=size(ell8,1);
Nell16=size(ell16,1);
Nell32=size(ell32,1);
Nell64=size(ell64,1);
Nell128=size(ell128,1);
n=min([Nell2,Nell4,Nell8,Nell16,Nell32,Nell64,Nell128])

%approx=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank5_33_nu.txt', '-ascii');
%approx2=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank3_33.txt', '-ascii');
%s=min(min(size(d8000,1),size(d4000,1)), min(size(d32000,1), size(d16000,1)));
%approx3=approx3(1:s,:);
%approx7=approx7(1:s,:);
%approx9=approx9(1:s,:);

%approx8=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank8.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank16.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/111theta_case3_rank16_sigma2_4.txt', '-ascii');


%nu2=approx2000(:,1);
%nu4=approx4000(:,1);
%nu8=approx8000(:,1);
%nu16=approx16000(:,1);
%nu32=approx32000(:,1);
n=Nell2;
coeff2=sigma2(1:n)./power(ell2(1:n), 2*sigma2(1:n));
n=Nell4;
coeff4=sigma4(1:n)./power(ell4(1:n), 2*sigma4(1:n));
n=Nell8;
coeff8=sigma8(1:n)./power(ell8(1:n), 2*sigma8(1:n));
n=Nell16;
coeff16=sigma16(1:n)./power(ell16(1:n), 2*sigma16(1:n));
n=Nell32;
coeff32=sigma32(1:n)./power(ell32(1:n), 2*sigma32(1:n));
n=Nell64;
coeff64=sigma64(1:n)./power(ell64(1:n), 2*sigma64(1:n));
n=Nell128;
coeff128=sigma128(1:n)./power(ell128(1:n), 2*sigma128(1:n));



grp = [128000*ones(1,Nell128) 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
C = [ell128'  ell64' ell32' ell16' ell8' ell4' ell2'];
%C = [nu128'  nu64' nu32' nu16' nu8' nu4' nu2'];
%C = [sigma128'  sigma64' sigma32' sigma16' sigma8' sigma4' sigma2'];
%C = [coeff128'  coeff64' coeff32' coeff16' coeff8' coeff4' coeff2'];
%Qell = quantile(ell32,[.25 .50 .75]); % the quartiles of x

boxplot(C, grp, 'grouporder',{'128000','64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128','64','32','16','8','4','2'});

% hold all;
% x=0:1:6;
% y25=Qell(1)*ones(size(x));
% y75=Qell(3)*ones(size(x));
% hold all
% plot(x,y25,':g','LineWidth',2);
% hold all;
% plot(x,y75,':g','LineWidth',2);
% hold all
% 
%xlabel('$n$, samples in thousands','Interpreter','latex');
%ylabel('$\ell$','Interpreter','latex');
%ylabel('$\nu$','Interpreter','latex');
ylabel('$\sigma^2$','Interpreter','latex');
%ylabel('$\sigma^2/\ell^{2\nu}$','Interpreter','latex');

%save_figure(gcf, '25July_box_plots_ell_N_whole', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
%save_figure(gcf, '25July_box_plots_nu_N_whole', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
save_figure(gcf, '25July_box_plots_sigma2_N_whole', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
%save_figure(gcf, '25July_box_plots_coeff_N_whole', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )

% %save_figure(gcf, 'convergence_nu15_weak', 'figdir', '.', 'fontsize', 12)
% %           b     blue          .     point              -     solid
% %            g     green         o     circle             :     dotted
% %            r     red           x     x-mark             -.    dashdot 
% %            c     cyan          +     plus               --    dashed   
% %            m     magenta       *     star             (none)  no line
% %            y     yellow        s     square
% %            k     black         d     diamond
% %            w     white         v     triangle (down)
% %                                ^     triangle (up)
% %                                <     triangle (left)
% %                                >     triangle (right)
% %                                p     pentagram
% %                                h     hexagram
% %                           
% 
