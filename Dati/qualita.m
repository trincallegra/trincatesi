%% COMPARE QUALITY PERCEPTION FOR THE FOUR DRUGS
 % Load Data
   load WRANGLED.mat
    
 % Setup Colorscheme
   colors = palette(length(FARMACI));
   
%% Comparison of boxplots along experience order
 % Build the boxplots one by one
   hbx = figure('Name','MultiBoxplot');
   for i = 1:length(FARMACI)
       QUALITY = DATA.(LABEL{i+4});
       hax(i) = subplot(1,4,i); hold on
       boxplot(QUALITY,...
       'BoxFaceColor',colors(i,:),'MarkerColor',colors(i,:),...
       'MarkerStyle','*','MarkerSize',10,'Notch','on','LineWidth',1);
       xticklabels(FARMACI{i}); set(hbx,'Color','white'); grid on 
       if i>1
          hax(i).YAxis.Visible = 'off';
       end
   end
   
 % Normalize heights
   linkaxes([hax(1),hax(2),hax(3),hax(4)],'y');
   
 % Fix aspect ratio
   hbx.Position(3:4) = [700, 420];
   
 % Save Figure
   save_fig (hbx,'../Figure/qualita-colorful')