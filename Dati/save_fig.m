function save_fig(fig,name)
%% SAVE_FIG saves a MATLAB fig to PDF, EPS and PNG
 % Tries the celebrated external library if present.
 % Otherwise calls the native exportgraphics method.
    try
        % < https://github.com/bellomia/MATVERSE
        matverse.enter 
        % > get export_fig from external library
        export_fig(fig,name,'-pdf','-eps' )
        export_fig(fig,name,'-png','-r600')
    catch
        exportgraphics(fig,[name,'.pdf'])
        exportgraphics(fig,[name,'.eps'])
        exportgraphics(fig,[name,'.png'],...
                      'Resolution','600')
    end
end