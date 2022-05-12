%% DISTRIBUTION OF MISDIRECTION TECHNIQUES
 % Load Data
   load WRANGLED.mat
   
 % Setup Ordering
   order = {'Per niente','Abbastanza','Molto','Moltissimo'};
   array = categorical(DATA.DISTRAZIONE,order,'Ordinal',true);
   
 % Setup Colorscheme
   colors = palette(length(order));

 % Build single histogram (unique color)
   histogram(array,'FaceColor',colors(4,:),...
            'EdgeColor',colors(4,:),'FaceAlpha',0.2); grid on
        
 % Enforce lower-case labels     
   xticklabels(lower(order)); 

 % Fix aspect ratio
   fig = gcf; fig.Position(3:4) = [350, 210];
   
 % Save figure
   export_fig(fig,'../Figure/distrazione')