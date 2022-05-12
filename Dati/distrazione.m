%% DISTRIBUTION OF 
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

 % Save figure
   export_fig(gcf,'../Figure/distrazione')