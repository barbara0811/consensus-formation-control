%postavljanje granicnih vrijednosti koordinata
xmax = 100;
xmin = -100;
ymax = 100;
ymin = -100;


%crtanje animacije
agents = [];
trajectories = [];
nametag = [];
colors = {[0.6,0.9,0.6],[0,0.7,1],[0.85, 0.6,0.85],[1,0.8,0],[0.9,0.6,0.5]};
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




    