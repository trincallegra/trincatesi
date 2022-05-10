%% STRATIFY ANALYSIS ALONG EXPERIENCE CATEGORICAL AXIS

  % Load Data
    load WRANGLED.mat
    
  % Setup Colorspace
    import colorlab.*
    set(0,'DefaultAxesColorOrder','default')
    color_order = lines(4);
    
  % Quality vs Experience
    experience_order = {'<10','10-20','21-30','>30'};
    DATA.SEDAZIONIMESE = categorical(DATA.SEDAZIONIMESE, ...
                                        experience_order,'Ordinal',true);
  % Comparison of boxplots along experience order
    for i = 1:4
        subplot(2,2,i)
        hbx = boxplot(DATA.SEDAZIONIMESE,DATA.(LABEL{4+i}),...
            'BoxFaceColor',color_order(i,:),'MarkerColor',color_order(i,:),...
            'MarkerStyle','x','Notch','off','LineWidth',1);
        ylabel(FARMACI{i}); set(gca,'Color','None');
    end
    
    export_fig ../Figure/qualita-stratificata -transparent -pdf -svg
    export_fig ../Figure/qualita-stratificata -transparent -png -r600