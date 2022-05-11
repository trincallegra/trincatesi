function ncolors = palette(n,handle)
%% PALETTE defines a unified color-scheme for all plots
 % It defines four colors in the HEX space, as provided
 % by: < https://usbrandcolors.com/microsoft-colors/ >.
    assert(n <= 4,'Only 4 colors are defined.')
    % < https://github.com/bellomia/MATVERSE
    matverse.enter 
    % > access external library containing hex2rgb
    ncolors = [hex2rgb('#7FBA00') ; % gmicrosoft
               hex2rgb('#F25022') ; % rmicrosoft
               hex2rgb('#FFB900') ; % ymicrosoft
               hex2rgb('#00A4EF')]; % bmicrosoft
    ncolors = ncolors(1:n,:);
    if nargin < 2 % by default do not set anything.
        handle = []; 
    else % if instead a handle is provided, set it.
        set(handle,'DefaultAxesColorOrder',ncolors);
    end
end