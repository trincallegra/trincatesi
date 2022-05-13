%% DIFFERENTIAL INCIDENCE OF ADVERSE EFFECTS
 % Load Data
   load WRANGLED.mat
   
 % Setup Colorscheme
   colors = palette(length(FARMACI));
   
 % Setup Categories
   effects = {'sonnolenza','irritabilità','iperattività' ,...
              'allucinazioni','incoordinazione','cefalea',...
              'vertigini','calo appetito','nausea/vomito',...
              'dispnea','altro','nessuno'};

   for i = 1:length(FARMACI)
       % Handle multiple answers: count as multiple people!
         array = cellfun(@transpose,DATA.(LABEL{9+i}),...
                               'UniformOutput',false);
         array = cell2mat(array); % > unique column :)
       % Build the histograms
         hax(i) = subplot(2,2,i); hold on
         binned = categorical(array,[0:10,NaN],effects);
         histogram(binned,'FaceColor',colors(i,:),...
                          'FaceAlpha',0.2,'EdgeColor',colors(i,:)); 
         ylabel(FARMACI{i}); set(hax(i),'Color','none'); grid on
   end

 % Normalize heights
   linkaxes([hax(1),hax(2),hax(3),hax(4)],'y');
   
 % Fix aspect ratio and set background color
   fig = gcf; fig.Position(3:4) = [700, 420]; set(fig,'Color','none'); 

 % Save figure
   save_fig(fig,'../Figure/effetti-avversi','native')