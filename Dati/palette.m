function palette = palette(n,handle)

    assert(n <= 4,'Only 4 colors are defined.')
%{
    palette = [(rgb2hex([127,186,0])) ; % gmicrosoft
               (rgb2hex([242,80,34])) ; % rmicrosoft
               (rgb2hex([255,185,0])) ; % ymicrosoft
               (rgb2hex([0,164,239]))]; % bmicrosoft
                ^ external dependency -> better to avoid!
%} 
    palette = ['#7FBA00' ; % gmicrosoft
               '#F25022' ; % rmicrosoft
               '#FFB900' ; % ymicrosoft
               '#00A4EF']; % bmicrosoft


    palette = palette(1:n,:);

    if nargin < 2
        handle = [];
    end

    set(handle,'DefaultAxesColorOrder',palette);

end