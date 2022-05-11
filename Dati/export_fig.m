function export_fig(fig,name)
%% EXPORT_FIG saves a MATLAB fig to PDF, EPS and PNG
 % It wraps an eponymous external library if present
 % otherwise calls the native exportgraphics method.
    try
        % < https://github.com/bellomia/MATVERSE
        matverse.enter 
        % > access external library containing export_fig
        export_fig(fig,name,'-transparent','-pdf','-eps' )
        export_fig(fig,name,'-transparent','-png','-r600')
    catch
        exportgraphics(fig,[name,'.pdf'])
        exportgraphics(fig,[name,'.eps'])
        exportgraphics(fig,[name,'.png'],...
                      'Resolution','600')
    end
end