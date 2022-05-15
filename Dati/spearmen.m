%% LINEAR CORRELATION TEST FOR EXPERIENCE/SENIORITY vs SATISFACTION
 % Load Data
   load TIDY

   for i = 1:length(FARMACI)
       satisfaction(:,i) = DATA.(LABEL{i+4});
       seniority(:,i) = DATA.ANNI;
   end
   [p_sen,rho_sen] = corr(satisfaction,seniority,...
                       'type','Spearman','tail','both','rows','complete')
   %[p_exp(i),rho_exp(i)] = corr(satisfaction(:),DATA.SEDAZIONIMESE);

%% WE GET FREAKING NEGATIVE P-VALUES WHAT THE ACTAUL FUCK