  % Prepare Data 
    wrangler;
    
  % Setup Colorspace
    import plotDMFT.colorlab.*
    color_order = lines(4);
    set(0,'DefaultAxesColorOrder','default')
    
    
  % Quality vs Experience
    experience_order = {'<10','10-20','21-30','>30'};
    DATA.SEDAZIONIMESE = categorical(DATA.SEDAZIONIMESE, ...
                                        experience_order,'Ordinal',true);
                                    
    for i = 1:4
        subplot(2,2,i)
        hbx = boxplot(DATA.SEDAZIONIMESE,DATA.(LABEL{4+i}),...
            'BoxFaceColor',color_order(i,:),'MarkerColor',color_order(i,:),...
            'MarkerStyle','x','Notch','off','LineWidth',1);
        ylabel(FARMACI{i}); set(gca,'Color','None');
    end
    
    export_fig ../Figure/qualità-stratificata -transparent -pdf -svg
    export_fig ../Figure/qualità-stratificata -transparent -png -r600