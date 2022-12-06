folder=cd;
filename=[folder,'\','20221005_fabric_chemicals_IS_ANTd10.xlsx'];
% filename=[folder,'\','20221027_BBP_DINP_standard_curve_IS_ANTd10.xlsx'];
% 
% tabs={'0.1 ppm'
% '0.2 ppm'
% '0.5 ppm'
% '1 ppm'
% '2 ppm'
% '5 ppm'
% '10 ppm'};
tabs={'W2'}

%% anthracene-d10

for i=1:length(tabs)
    ant(:,1:3)=readmatrix(filename,'Sheet',tabs{i},'Range','E12389:G13108');    %m/z 188
    ant(:,4:6)=readmatrix(filename,'Sheet',tabs{i},'Range','E5109:G5828');   %m/z 94
    ant(:,7:9)=readmatrix(filename,'Sheet',tabs{i},'Range','E3653:G4372');   %m/z 80

    sig_col=[2,5,8];

    for j=1:3

        figure(i)
        plot(ant(:,1),ant(:,sig_col(j)))
        hold on

        index_start=find(ant(:,1)==10.73);
        index_end=find(ant(:,1)==11.045);

        plot(ant([index_start,index_end],1),ant([index_start,index_end],sig_col((j))),'r-')
        legend('m/z 188','int','m/z 94','int','m/z 80','int')

        baseline=(ant(index_start,sig_col(j))+ant(index_end,sig_col(j)))/2*(10.9-10.595);
        area_total=sum(ant(index_start:index_end,sig_col(j)))*0.005*(index_end-index_start);
        ant_area(i,j)=area_total-baseline;

    end

end

hold off

figure(i+1)
plot(ant_area(:,1))
ylimits=get(gca,'ylim');
ylimits=[0,ylimits(2)];
set(gca,'ylim',ylimits)
ylabel('anthracene-d_{10} peak area')
xlabel('Samples')


%% diisononyl phthalate
close all
for i=1:length(tabs)
    dinp(:,1:3)=readmatrix(filename,'Sheet',tabs{i},'Range','E7117:G7996');   %m/z 149
    dinp(:,4:6)=readmatrix(filename,'Sheet',tabs{i},'Range','E13:G892');    %m/z 43
    dinp(:,7:9)=readmatrix(filename,'Sheet',tabs{i},'Range','E3565:G4444');   %m/z 71

    sig_col=[2,5,8];

    for j=1:3

        figure(i)
        plot(dinp(:,1),dinp(:,sig_col(j)))
        hold on

        peak_time=[18.745,20.105];

        index_start=find(dinp(:,1)==peak_time(1));
        index_end=find(dinp(:,1)==peak_time(2));

        plot(dinp([index_start,index_end],1),dinp([index_start,index_end],sig_col((j))),'r-')

        baseline=(dinp(index_start,sig_col(j))+dinp(index_end,sig_col(j)))/2*(peak_time(2)-peak_time(1));
        area_total=sum(dinp(index_start:index_end,sig_col(j)))*0.005*(index_end-index_start);
        dinp_area(i,j)=area_total-baseline;

    end

end

hold off

figure(i+1)
plot([0.1,0.2,0.5,1,2,5,10],dinp_area(:,1)./ant_area(:,1))

%% benzylbutyl phthalate
close all
for i=1:length(tabs)
    bbp(:,1:3)=readmatrix(filename,'Sheet',tabs{i},'Range','I2553:K3052');   %m/z 149
    bbp(:,4:6)=readmatrix(filename,'Sheet',tabs{i},'Range','I1537:K2036');    %m/z 91
    bbp(:,7:9)=readmatrix(filename,'Sheet',tabs{i},'Range','I521:K1020');   %m/z 65

    sig_col=[2,5,8];

    for j=1:3

        figure(i)
        plot(bbp(:,1),bbp(:,sig_col(j)))
        hold on

        peak_time=[15.845,16.025];

        index_start=find(bbp(:,1)==peak_time(1));
        index_end=find(bbp(:,1)==peak_time(2));

        plot(bbp([index_start,index_end],1),bbp([index_start,index_end],sig_col((j))),'r-')

        baseline=(bbp(index_start,sig_col(j))+bbp(index_end,sig_col(j)))/2*(peak_time(2)-peak_time(1));
        area_total=sum(bbp(index_start:index_end,sig_col(j)))*0.005*(index_end-index_start);
        bbp_area(i,j)=area_total-baseline;

    end

end

hold off

figure(i+1)
plot([0.1,0.2,0.5,1,2,5,10],bbp_area(:,1)./ant_area(:,1))

