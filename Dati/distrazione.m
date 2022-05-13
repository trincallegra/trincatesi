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
            'EdgeColor',colors(4,:),'FaceAlpha',0.2); grid on; box off
        
 % Enforce lower-case labels     
   xticklabels(lower(order)); 

 % Fix aspect ratio and set background color
   fig = gcf; fig.Position(3:4) = [350, 210]; set(fig,'Color','white'); 
   
 % Save figure
   save_fig(fig,'../Figure/distrazione')