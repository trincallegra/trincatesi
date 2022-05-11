function ncolors = palette(n,handle)
%% PALETTE defines a unified color-scheme for all plots
 % It defines four colors in the HEX space, as provided
 % by: < https://usbrandcolors.com/microsoft-colors/ >.
    assert(n <= 4,'Only 4 colors are defined.')
    ncolors = ['#7FBA00' ; % gmicrosoft
               '#F25022' ; % rmicrosoft
               '#FFB900' ; % ymicrosoft
               '#00A4EF']; % bmicrosoft
    ncolors = ncolors(1:n,:);
    if nargin < 2 % by default do not set anything.
        handle = []; 
    else % if instead a handle is provided, set it.
        set(handle,'DefaultAxesColorOrder',ncolors);
    end
end