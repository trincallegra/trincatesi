function save_fig(fig,name,native)
%% SAVE_FIG saves a MATLAB fig to PDF, EPS and PNG
 % Tries the celebrated external library if present.
 % Otherwise calls the native exportgraphics method.
    if nargin == 3
        % NATIVE EXPORT GRAPHICS
        exportgraphics(fig,[name,'.pdf'])
        exportgraphics(fig,[name,'.eps'])
        exportgraphics(fig,[name,'.png'],... 
                      'Resolution','600')
    else
        try % TRY WITH EXPORT-FIG from the MATVERSE
            % >https://github.com/bellomia/MATVERSE
            matverse.enter;
            export_fig(fig,name,'-transparent','-pdf','-eps' )
            export_fig(fig,name,'-transparent','-png','-r600')
            try fig2svg([name,'.svg'],fig); end % last chance
        catch
            % EXPORT-FIG NOT FOUND (OR GIVES ERROR)
            % >fall back to native exportgraphics()
            save_fig(fig,name,'native')
        end
    end
end