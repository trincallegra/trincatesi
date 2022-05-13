%% COMPARE QUALITY PERCEPTION FOR THE FOUR DRUGS
 % Load Data
   load WRANGLED.mat
    
 % Setup Colorscheme
   colors = lines(10); % provvisorio in attesa upgrade palette()
   
 % Setup Labels
   effect = {'sonnolenza','irritabilità','iperattività',...
             'allucinazioni','incoordinazione','cefalea',...
             'vertigini','calo appetito','nausea/vomito','dispnea'};
   score  = {'per niente','poco','abbastanza','molto'};

%% Comparison of boxplots for different side-effects
   for i = 1:10
       EFFECT = DATA.(LABEL{i+13});
       hax(i) = subplot(1,10,i); hold on
       hbx = boxplot(EFFECT,...
       'BoxFaceColor',colors(i,:),'MarkerColor',colors(i,:),...
       'MarkerStyle','*','MarkerSize',10,'Notch','on','LineWidth',1);
       xticklabels(effect{i}); set(gcf,'Color','White'); grid on 
       yticks([1 2 3 4]); yticklabels(score); daspect([2 1 1])
       if i>1
          hax(i).YAxis.Visible = 'off';
       end
   end
   
 % Normalize heights
   linkaxes([hax(1),hax(2),hax(3),hax(4),hax(5),hax(6),hax(7),...
             hax(8),hax(9),hax(10)],'y'); 
  
 % Fix aspect ratio
   fig = gcf; fig.Position(3:4) = [700, 420];        
         
 % Save Figure
   save_fig(fig,'../Figure/influenza-effetti');