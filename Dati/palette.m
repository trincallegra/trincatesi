function ncolors = palette(n,handle)
%% PALETTE defines a unified color-scheme for all plots
 % It defines some colors in the HEX space, as provided
 % by: < https://usbrandcolors.com/microsoft-colors/ >,
 %  < https://xkcd.com/color/rgb/ > and personal taste.
    assert(n <= 12,'Only 12 colors are defined.')
    % < https://github.com/bellomia/MATVERSE
    matverse.enter 
    % > access external library containing hex2rgb
    ncolors = [hex2rgb('#7FBA00') ; % gmicrosoft
               hex2rgb('#F25022') ; % rmicrosoft
               hex2rgb('#FFB900') ; % ymicrosoft
               hex2rgb('#00A4EF') ; % bmicrosoft
               hex2rgb('#CEA2FD') ; % xkcd-lilac
               hex2rgb('#8C564B') ; % chocotasty
               hex2rgb('#734CA5') ; % deep-viola
               hex2rgb('#E53087') ; % sharp-pink
               hex2rgb('#036E93') ; % blu-amalfi
               hex2rgb('#C1958E') ; % milk-choco
               hex2rgb('#AD1602') ; % cherry-red
               hex2rgb('#59750B')]; % tree-green
    ncolors = ncolors(1:n,:);
    if nargin < 2 % by default do not set anything.
        handle = [];
    else % if instead a handle is provided, set it.
        set(handle,'DefaultAxesColorOrder',ncolors);
    end
end