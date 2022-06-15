%% PEDESTRIAN SCRIPT TO GENERATE *DRAFTS* OF PIE-CHARTS 

 % Load Data
   load TIDY
  
   labels = {'EV','IN','OS+IN','IM'};
   slices = categorical(DATA.VIADISOMMINISTRAZIONE,[1 2 3 4],labels);
  
   p = pie(slices);
  
   for i = 1:length(labels)
       text = p(i*2);
       text.FontSize = 20;
   end

   hex = ['#502064'  ;
          '#8267BE'  ; 
          '#3FA796'  ;
          '#FFBD35'] ; 
   colormap(hex2rgb(hex));
   
   
   labels = {'sempre','solo in pazienti fragili'};
   slices = categorical(DATA.ACCESSOVENOSO,[0,1],labels);
   
   p = pie(slices);
   
   slices = [25 2 15 9];
   p = pie(slices,[],FARMACI);
   
   colormap(palette(4));
  