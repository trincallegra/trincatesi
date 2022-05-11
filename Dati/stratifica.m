%% STRATIFY ANALYSIS ALONG EXPERIENCE CATEGORICAL AXIS
 % Load Data
   load WRANGLED.mat
    
 % Experience Axis: setup categorical ordering
   experience_order = {'<10','10-20','21-30','>30'};
   experience_array = categorical(DATA.SEDAZIONIMESE, ...
                                        experience_order,'Ordinal',true);

 % Setup Colorscheme
   color_order = palette(length(experience_order));

 % Comparison of quality boxplots along experience axis
   for i = 1:4
       subplot(2,2,i)
       hbx = boxplot(experience_array,DATA.(LABEL{4+i}),...
         'BoxFaceColor',color_order(i,:),'MarkerColor',color_order(i,:),...
         'MarkerStyle','*','MarkerSize',10,'Notch','on','LineWidth',0.5);
       ylabel(FARMACI{i}); set(gca,'Color','None'); grid on
   end
    
 % Save figure
   export_fig(gcf,'../Figure/qualita-stratificata')