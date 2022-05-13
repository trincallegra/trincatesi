%% DISTRIBUTION OF RESCUE-DRUG SOMMINATRATION
 % Load Data
   load WRANGLED.mat
    
 % Setup Colorscheme
   colors = palette(length(FARMACI));

 % Handle multiple answers: count as multiple people!
   farmaci = cellfun(@transpose,DATA.RESCUE,...
                     'UniformOutput',false);
   farmaci = cell2mat(farmaci); % > unique column :)
   
 % Setup categories (with lower-case enforcing)
   farmaci = categorical(farmaci,[1 2 3 4],lower(FARMACI));
   
 % Manual build of a > multi-color < histogram (separate bars)
   hbar = bar(histcounts(farmaci),0.9,... % setting the width
              'FaceColor','flat','EdgeColor','flat');
   hbar.CData = colors; hbar.FaceAlpha = 0.2; grid on; box off
   
 % Fine-tune the axes to match histogram aesthetics
   xlim([0.5,4.5]); ylim([0,45]); set(gcf,'Color','none'); 
   
 % Engrave the categorical labels
   xticklabels(FARMACI);
   
 % Fix aspect ratio
   fig = gcf; fig.Position(3:4) = [525, 315];
   
 % Save figure
   save_fig(fig,'../Figure/rescue')