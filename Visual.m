%postavljanje granicnih vrijednosti koordinata
xmax = 100;
xmin = -100;
ymax = 100;
ymin = -100;


%crtanje animacije
agents = [];
trajectories = [];
nametag = [];
colors = {[0.6,0.9,0.6],[0,0.7,1],[0.85, 0.6,0.85],[1,0.8,0],[0.9,0.6,0.5],[0,0,1]};
for i = 1:x.signals.dimensions
    agents = cat(2,agents, animatedline('MaximumNumPoints',1,'Marker', 'o','Color', cell2mat(colors(i))));
    trajectories = cat(2,trajectories,animatedline('Color', cell2mat(colors(i))));
    nametag = cat(2,nametag, strcat(' a', int2str(i)));
end

axis([xmin,xmax,ymin,ymax]);
nametag = split(nametag, ' ');
nametag = cell2mat(nametag);
legend(agents, nametag);
xlabel('x')
ylabel('y')


for k = 1:length(x.signals.values)
    for j = 1:x.signals.dimensions
        addpoints(agents(j),x.signals.values(k,j),y.signals.values(k,j));
        addpoints(trajectories(j),x.signals.values(k,j),y.signals.values(k,j));
    end
    drawnow
end


%crtanje 9 vremenskih isjecaka
a = floor(length(x.signals.values)/9);
f2 = figure('Name','2');

for i= 1:9
    subplot(3,3,i)
        for j=1:x.signals.dimensions
            plot(x.signals.values(a*i,j),y.signals.values(a*i,j), 'o', 'Color',cell2mat(colors(j)));
            hold on;
        end
    axis([xmin,xmax,ymin,ymax]);
    title( [strcat('t = ', num2str(x.time(a*i))) 's'])
    if i~=1 && i~=4 && i~=7 && i~=8 && i~=9
        xticklabels({});
        yticklabels({});
        if i==3
            legend( nametag, 'Location','Northeast');
        end
    elseif i==1 || i ==4
        xticklabels({});
        if i==4
            ylabel('y');
        end
    elseif i==8 || i ==9
        yticklabels({}); 
        if i==8
            xlabel('x');
        end
    end   
end

%crtanje bitnih podataka
f3 = figure('Name','3');
subplot(2,2,1)
for i = 1:x.signals.dimensions
    plot(x.time(:), x.signals.values(:,i),'Color', cell2mat(colors(i)));
    hold on;
end
ylabel('x')

subplot(2,2,2)
for i = 1:y.signals.dimensions
    plot(y.time(:), y.signals.values(:,i), 'Color', cell2mat(colors(i)));
    hold on;
end
ylabel('y')
xlabel('t')

% subplot(2,2,3)
% for i = 1:x_vel.signals.dimensions
%     plot(x_vel.time(:), x_vel.signals.values(:,i),'Color', cell2mat(colors(i)));
%     hold on;
% end
% ylabel('x_velocity')
% legend(Nametag);
% 
% subplot(2,4,4)
% for i = 1:y_vel.signals.dimensions
%     plot(y_vel.time(:), y_vel.signals.values(:,i),'Color', cell2mat(colors(i)));
%     hold on;
% end 
% ylabel('x_velocity')
% xlabel('t')

% 
% f4 = figure('Name','4');
% 
% vel = sqrt(y_vel.signals.values.^2 + x_vel.signals.values.^2);
% 
% subplot(2,1,1);
% for i = 1:vel.signals.dimensions
%     plot(y_vel.time(:), y_vel.signals.values(:,i),'Color', cell2mat(colors(i)));
%     hold on;
% end 
% ylabel('velocity')
% legend(Nametag);

% subplot(2,1,2);
% for i = 1:f_c.signals.dimensions
%     plot(f_c.time(:), f_c.signals.values(:,i),'Color', cell2mat(colors(i)));
%     hold on;
% end 
% xlabel('t')
% ylabel('centar')

%crtanje trajektorija bez animacije
% f5 = figure('Name','5');
% xlabel('x')
% ylabel('y')
% axis([xmin,xmax,ymin,ymax]);
% legend(Nametag);

% for i = 1:vel.signals.dimensions
%     plot(x.signals.values(:,i), y.signals.values(:,i),'Color', cell2mat(colors(i)));
%     hold on;
% end 




    