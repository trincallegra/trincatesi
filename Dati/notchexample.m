data{1} = rand(100,1);
data{2} = rand(100,1)+0.2;
name{1} = 'Gruppo A';
name{2} = 'Gruppo B';

colors = palette(length(data));

for i = 1:length(data)
    hax(i)  = subplot(1,2,i); hold on
    datavec = data{i};
    boxplot(datavec,...
       'BoxFaceColor',colors(i,:),'MarkerColor',colors(i,:),...
       'MarkerStyle','*','MarkerSize',10,'Notch','on','LineWidth',1); 
    xticklabels(name{i}); yticklabels(hax(i),[])
    set(hax(i),'Color','none'); grid on
    if i>1
       hax(i).YAxis.Visible = 'off';
    end
end

linkaxes([hax(1),hax(2)],'y');

export_fig ../Figure/esempio.pdf -pdf -transparent