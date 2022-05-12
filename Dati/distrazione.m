%% DISTRIBUTION OF MISDIRECTION TECHNIQUES
 % Load Data
   load WRANGLED.mat
    
 % Setup Colorscheme
   colors = palette(4);
   
 % Setup Ordering
   order = {'Per niente','Abbastanza','Molto','Moltissimo'};
   array = categorical(DATA.DISTRAZIONE,order,'Ordinal',true);

   histogram(array,'FaceColor',colors(4,:),...
            'EdgeColor',colors(4,:),'FaceAlpha',0.2); grid on
        
   xticklabels(lower(order)); % lower-case enforcing

 % Fix screen ratio
   fig = gcf; set(fig,'Units','normalized') 
   fig.Position(3:4) = [0.1,0.15];   
   
 % Save figure
   export_fig(gcf,'../Figure/distrazione')