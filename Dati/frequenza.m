%% DISTRIBUTION OF EXPERIENCE AND SENIORITY
 % Load Data
   load WRANGLED.mat
    
 % Setup Colorscheme
   colors = palette(4);
 
 % Seniority Axis: numerical values to be binned
   seniority_edges = [0.5 10 20 30 36];
   seniority_order = {'<10','10-20','21-30','>30'};
   seniority_array = discretize(DATA.ANNI,seniority_edges,...
                           'categorical',seniority_order);
   hax(2) = subplot(1,2,1);
   histogram(seniority_array,'FaceColor',colors(4,:),...
            'EdgeColor',colors(4,:),'FaceAlpha',0.2,'EdgeAlpha',0.7);
   subtitle('Anni di esperienza sul campo'); grid on; box off
   
 % Experience Axis: setup categorical ordering
   experience_order = {'<10','10-20','21-30','>30'};
   experience_array = categorical(DATA.SEDAZIONIMESE, ...
                                  experience_order,'Ordinal',true);
   hax(1) = subplot(1,2,2);
   histogram(experience_array,'FaceColor',colors(2,:),...
            'EdgeColor',colors(2,:),'FaceAlpha',0.2); 
   subtitle('Numero di sedazioni per mese'); grid on; box off
   
 % Normalize heights
   linkaxes([hax(1),hax(2)],'y');

 % Fix aspect ratio and set background color
   fig = gcf; fig.Position(3:4) = [700, 420]; set(fig,'Color','white'); 
   
 % Save figure
   save_fig(fig,'../Figure/esperienzaVSfrequenza')