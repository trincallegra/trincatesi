%% COMPARE SAFETY PERCEPTION FOR THE FOUR DRUGS
 % Load Data
   load WRANGLED.mat
  
 % Safety Axis: setup categorical ordering
   safety_order = {'N/A','per niente','poco','molto'};
                         
 % Setup Colorscheme
   colors = palette(length(safety_order));
  
 % Build the histograms
   for i = 1:length(FARMACI)
      hax(i) = subplot(2,2,i); hold on
      safety_score = categorical(DATA.(LABEL{24+i}), ...
                             [NaN,1,6,10],safety_order);
      histogram(safety_score,'FaceColor',colors(i,:),...
                'FaceAlpha',0.2,'EdgeColor',colors(i,:)); 
      ylabel(FARMACI{i}); set(hax(i),'Color','none'); grid on
   end
   
 % Normalize heights
   linkaxes([hax(1),hax(2),hax(3),hax(4)],'y');
   
 % Fix aspect ratio and set background color
   fig = gcf; fig.Position(3:4) = [700, 420]; set(fig,'Color','none'); 

 % Save figure
   save_fig(fig,'../Figure/sicurezza','native')