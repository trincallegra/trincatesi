function varargout = boxplot(varargin)
%% BOXPLOT wraps boxchart so to avoid legacy plots 
 % Namely it overrides the boxplot() function provided
 % within the Statistics and Machine Learning Toolbox,
 % so to redirect to the visually superior boxchart().
    varargout{:} = boxchart(varargin{:});
end

