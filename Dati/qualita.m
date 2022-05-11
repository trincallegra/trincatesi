%% COMPARE QUALITY PERCEPTION FOR THE FOUR DRUGS
 % Load Data
   load WRANGLED.mat
    
 % Setup Colorscheme
   colors = palette(length(FARMACI));

%% Comparison of boxplots along experience order (loop formalism)
 % > pro: compliant with color-scheme (very flexible with colors)
 % > con: four different plots, forcefully linked (awkard grid
   for i = 1:length(FARMACI)
       QUALITY = DATA.(LABEL{i+4});
       hax(i) = subplot(1,4,i); hold on
       hbx = boxplot(QUALITY,...
       'BoxFaceColor',colors(i,:),'MarkerColor',colors(i,:),...
       'MarkerStyle','*','MarkerSize',10,'Notch','on','LineWidth',1);
       xticklabels(FARMACI{i}); set(gca,'Color','None'); grid on 
       if i>1
          hax(i).YAxis.Visible = 'off';
       end
   end
   linkaxes([hax(1),hax(2),hax(3),hax(4)],'y');
 % Save Figure
   export_fig (gcf,'../Figure/qualita-colorful'); close(gcf)

%% Comparison of boxplots along experience order (matrix formalism)
 % > pro: unique figure (natively)
 % > con: unique color (inevitable)
 % Setup data for multiple boxplot
   for i = 1:length(FARMACI)
       QUALITY(:,i) = DATA.(LABEL{i+4});
   end
 % Build all the boxplots all at once
   hbx = boxplot(QUALITY,...
        'BoxFaceColor',0.5*ones(1,3),'MarkerColor',0.5*ones(1,3),...
        'MarkerStyle','*','MarkerSize',10,'Notch','on','LineWidth',1);
   xticklabels(FARMACI); set(gca,'Color','None'); grid on
 % Save figure
   export_fig(gcf,'../Figure/qualita-connected'); close(gcf)