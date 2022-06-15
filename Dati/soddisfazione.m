%% FACTORS INFLUENCING GLOBAL SATISFACTION
 % Load Data
   load TIDY
   
 % Setup Colorscheme
   colors = palette(9); 
   
 % Setup Categories
   factors = {'tipo di farmaco e via di somministrazione',...
              'reazioni durante la sedazione','reazioni dopo la sedazione',...
              'qualità del risveglio','tempi di risveglio',...
              'necessità di farmaci rescue','impegno infermieristico',...
              'soddisfazione dei genitori','soddisfazione del bambino'};
          
 % Handle multiple answers: count as multiple people!
   array = cellfun(@transpose,DATA.INFLUENZASODDISFAZIONE,...
                                   'UniformOutput',false);
   array = cell2mat(array); % > unique column :)
   
 % Setup categories
   array = categorical(array,[1:9],factors);
   
 % Manual build of a > multi-color < histogram (horizontal)
   hbar = barh(histcounts(array),0.9,... setting the width
              'FaceColor','flat','EdgeColor','flat');
   hbar.CData = colors; hbar.FaceAlpha = 0.2; grid on; box off
   
 % Fine-tune the axes to match histogram aesthetics
   ylim([0.5,9.5]); xlim([0,35]); %set(gcf,'Color','none'); 
   
 % Engrave the categorical labels
   yticklabels(upper(factors));
   
 % Fix aspect ratio
   fig = gcf; fig.Position(3:4) = [900, 400];
   
 % Save figure
   save_fig(fig,'../Figure/soddisfazione-globale')