%% COMPARE QUALITY PERCEPTION FOR THE FOUR DRUGS
 % Load Data
   load TIDY
 % Setup Colorscheme
   colors = palette(length(FARMACI));
%% Comparison of boxplots for the four drugs
 % Build the boxplots one by one
   hbx = figure('Name','MultiBoxplot');
   for i = 1:length(FARMACI)
       QUALITY = DATA.(LABEL{i+4});
       hax(i) = subplot(1,4,i); hold on
       boxplot(QUALITY,...
       'BoxFaceColor',colors(i,:),'MarkerColor',colors(i,:),...
       'MarkerStyle','*','MarkerSize',10,'Notch','on','LineWidth',1);
       xticklabels(FARMACI{i}); set(hax(i),'Color','none'); grid on 
       if i>1
          hax(i).YAxis.Visible = 'off';
       end
   end
 % Normalize heights
   linkaxes([hax(1),hax(2),hax(3),hax(4)],'y');
 % Fix aspect ratio and background color
   hbx.Position(3:4) = [700, 420]; set(hbx,'Color','none');
 % Save Figure
   save_fig(hbx,'../Figure/qualita-colorful')
   
%% Explicit hypothesis testing
 % Build the suitable data structure for multiple comparison tests
   for i = 1:length(FARMACI)
       QUALITY_TABLE(:,i) = DATA.(LABEL{i+4});
   end
 % Kruskal-Wallis global test and downstream Bonferroni and Šidák tests
   [global_p_value,~,stats] = kruskalwallis(QUALITY_TABLE,FARMACI,'off');
   bonferroni = multcompare(stats,'CType','bonferroni');
   dunn_sidak = multcompare(stats,'CType','dunn-sidak');
   groupA = bonferroni(:,1); groupB = bonferroni(:,2);
   report = [groupA,groupB,bonferroni(:,end),dunn_sidak(:,end)];
   report = array2table(report,'VariableNames',...
       {'Group A','Group B','Bonferroni p-value','Šidák p-value'});
   report.('Group A') = categorical(report.('Group A'),[1,2,3,4],FARMACI); 
   report.('Group B') = categorical(report.('Group B'),[1,2,3,4],FARMACI);
   fprintf('\n\nGlobal Kruskal-Wallis p-value: %e\n\n',global_p_value); 
   disp(report); % display to screen detailed report of pair-wise tests