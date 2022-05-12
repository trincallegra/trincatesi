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
   
   %colormap(palette(4));
   
   labels = {'sempre','solo in pazienti fragili'};
   slices = categorical(DATA.ACCESSOVENOSO,[0,1],labels);
   
   p = pie(slices);
  