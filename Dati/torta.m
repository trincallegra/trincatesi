%% DRAFT... 

 % Load Data
   load WRANGLED.mat
  
   labels = {'EV','IN','OS+IN','IM'};
   slices = categorical(DATA.VIADISOMMINISTRAZIONE,[1 2 3 4],labels);
  
   p = pie(slices);
  
   for i = 1:length(labels)
       text = p(i*2);
       text.FontSize = 20;
   end
 %{
   hex = ['#502064'  ;
          '#8267BE'  ; 
          '#3FA796'  ;
          '#FFBD35'] ; 
 %}
   hex = ['#502064'  ;
          '#8267BE'  ; 
          '#3FA796'  ;
          '#FFBD35'] ; 
   colormap(hex2rgb(hex));
  
 % Save figures
   export_fig(gcf,'../Figure/somministrazione')
  