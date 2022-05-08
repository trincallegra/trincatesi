function varargout = boxplot(varargin)
% BOXPLOT wraps boxchart to avoid legacy plots  
    varargout{:} = boxchart(varargin{:});
end

