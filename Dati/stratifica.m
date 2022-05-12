%% STRATIFY ANALYSIS ALONG EXPERIENCE CATEGORICAL AXIS
 % Load Data
   load WRANGLED.mat
   
 % Setup Colorscheme
   color_order = palette(length(FARMACI));
    
 % Seniority Axis: numerical values to be binned
   seniority_edges = [0.5 10 20 30 36];
   seniority_order = {'<10','10-20','21-30','>30'};
   seniority_array = discretize(DATA.ANNI,seniority_edges,...
                           'categorical',seniority_order);
   
 % Experience Axis: setup categorical ordering
   experience_order = {'<10','10-20','21-30','>30'};
   experience_array = categorical(DATA.SEDAZIONIMESE, ...
                                        experience_order,'Ordinal',true);
                                    
 % Comparison of quality boxplots along seniority axis
   hsen = figure('Name','Seniority');
   for i = 1:length(FARMACI)
       subplot(2,2,i)
       hbx = boxplot(seniority_array,DATA.(LABEL{4+i}),...
         'BoxFaceColor',color_order(i,:),'MarkerColor',color_order(i,:),...
         'MarkerStyle','*','MarkerSize',10,'Notch','on','LineWidth',0.5);
       ylabel(FARMACI{i}); set(gca,'Color','None'); grid on
   end                       
                                 
 % Comparison of quality boxplots along experience axis
   hexp = figure('Name','Experience');
   for i = 1:length(FARMACI)
       subplot(2,2,i)
       hbx = boxplot(experience_array,DATA.(LABEL{4+i}),...
         'BoxFaceColor',color_order(i,:),'MarkerColor',color_order(i,:),...
         'MarkerStyle','*','MarkerSize',10,'Notch','on','LineWidth',0.5);
       ylabel(FARMACI{i}); set(gca,'Color','None'); grid on
   end
   
 % Fix aspect ratio
   hsen.Position(3:4) = [700, 420];
   hexp.Position(3:4) = [700, 420];
    
 % Save figures
   export_fig(hsen,'../Figure/qualita-strat-esperienza')
   export_fig(hexp,'../Figure/qualita-strat-frequenza')