%% IMPORT AND WRANGLING OF RAW DATA
 % Number of Queries
   nQ = 32;

 % Set up the Import Options and import the data
   opts = spreadsheetImportOptions('NumVariables', nQ);

 % Specify sheet and range
   opts.DataRange = 'A2:AF52';

 % Specify column names and types
   opts.VariableNames = {'CAMPIONE', 'REPARTI', 'ANNI', 'SEDAZIONIMESE',...
               'PROPOFOLQUALITA', 'KETAMINAQUALITA', 'MIDAZOLAMQUALITA',...
            'DEXMEDETOMIDINAQUALITA', 'COMBINAZIONI', 'PROPOFOLEFFETTI',...
        'KETAMINAEFFETTI', 'MIDAZOLAMEFFETTI', 'DEXMEDETOMIDINAEFFETTI',...
        'SONNOLENZA', 'IRRITABILITA', 'IPERATTIVITA', 'ALLUCINAZIONI',...
        'INCOORDINAZIONE', 'CEFALEA', 'VERTIGINI', 'APPETITO',...
        'NAUSEAVOMITO','DISPNEA', 'RESCUE', 'PROPOFOLSICUREZZA',...
        'KETAMINASICUREZZA', 'MIDAZOLAMSICUREZZA',...
        'DEXMEDETOMIDINASICUREZZA','VIADISOMMINISTRAZIONE',...
        'DISTRAZIONE','ACCESSOVENOSO','INFLUENZASODDISFAZIONE'};
   opts.VariableTypes =   {'double', 'double', 'double', 'categorical',...
                      'double', 'double', 'double', 'double', 'double',...
                      'string', 'string', 'string', 'string', 'double',...
                      'double', 'double', 'double', 'double', 'double',...
                      'double', 'double', 'double', 'double', 'string',...
                      'double', 'double', 'double', 'double', 'double',...
                      'double', 'double', 'string'};
   opts.VariableTypes{02} = 'categorical'; % Better for stratification
   opts.VariableTypes{30} = 'categorical'; % Data format has changed...

 % Specify variable properties
   opts = setvaropts(opts, {'PROPOFOLEFFETTI', 'KETAMINAEFFETTI',...
                         'MIDAZOLAMEFFETTI', 'DEXMEDETOMIDINAEFFETTI',...
                         'RESCUE', 'INFLUENZASODDISFAZIONE'},...
                         'WhitespaceRule', 'preserve');
   opts = setvaropts(opts, {'SEDAZIONIMESE', 'PROPOFOLEFFETTI',...
                         'KETAMINAEFFETTI', 'MIDAZOLAMEFFETTI',...
                         'DEXMEDETOMIDINAEFFETTI', 'RESCUE',...
                         'INFLUENZASODDISFAZIONE'},...
                         'EmptyFieldRule', 'auto');

 % Import the data
   DATA = readtable('RAW.xlsx',opts,'UseExcel',false);
   
 % Store the labels
   LABEL = opts.VariableNames;
   FARMACI = {'Propofol','Ketamina','Midazolam','Dexmedetomidina'};
   
 % Get rid of unwanted strings: convert to num-cells 
   to_convert = strfind(opts.VariableTypes,'string');
   for q = 1:nQ
       if to_convert{q}
          tmps = DATA.(LABEL{q});
          DATA.(LABEL{q}) = cellfun(@str2num,tmps,'UniformOutput',false); 
       end
   end

 % Readjust the Options to load the extended queries
   opts.DataRange = 'A53:AF53';
   opts.VariableTypes = replace(opts.VariableTypes,'double','string');
   opts.VariableTypes = replace(opts.VariableTypes,'categorical','string');

 % Import the questions
   QUERY = readtable('RAW.xlsx',opts,'UseExcel',false);

 % Final clean-up & save to mat
   clear opts tmps to_convert q
   save  TIDY
