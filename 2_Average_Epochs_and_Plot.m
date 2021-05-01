% Combined = matrix containing DFF signals for each nose poke epoch; epochs in separate columns; each epoch is 800 frames 

AvgRows=mean(Combined')';
SEM=std(Combined, [], 2)./ sqrt(size(Combined,2)); 
Avg_plus_SEM=AvgRows+SEM;
Avg_minus_SEM=AvgRows-SEM;
AvgRowsSmoothed=smooth(AvgRows,20); % 1 sec rolling window average 
Avg_minus_SEM_Smoothed=smooth(Avg_minus_SEM,20); % 1 sec rolling window average  
Avg_plus_SEM_Smoothed=smooth(Avg_plus_SEM,20); % 1 sec rolling window average 

% Plot with shaded error bars
X_up=(1:801);
X_down=flip(X_up);
X_up_down=[X_up X_down];
Flip_Avg_minus_SEM_Smoothed=flip(Avg_minus_SEM_Smoothed);
Y_plus_minus=[Avg_plus_SEM_Smoothed' Flip_Avg_minus_SEM_Smoothed'];
fill(X_up_down',Y_plus_minus,'r');
hold on
plot(AvgRowsSmoothed');