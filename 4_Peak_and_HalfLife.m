% Combined = matrix containing DFF signals for each nose poke epoch; epochs in separate columns; each epoch is 4800 frames 

% Time to Peak
TotalEvents=size(Combined)                             
for n=1:TotalEvents(2)
    B=n*4801-4800 
    Combined_smoothed(:,n)=smooth(Combined(B:B+4800),200);           %Smooth (10 sec window)
    Combined_crop_smoothed(:,n)=Combined_smoothed(B+2400:B+4400);    % Extract and put into new matrix
    [MAX_list(n),MAX_index(n)]=max(Combined_crop_smoothed(:,n));
end
MAX_list=MAX_list';
MAX_index=MAX_index'./20;  % Flip axes and convert to seconds (20fps acquisition rate), get Time to Peak

% Half Life
TotalEvents=size(Combined)                             
for n=1:TotalEvents(2)
       B=n*4801-4800;
       C=n*1001-1000;
       MAX=MAX_list(n);        
       BASE=mean(Combined_smoothed(B+1800:B+2200));
       HALF_LIFE_value(n)=(MAX-BASE)./2+BASE;
       PostPeakSmoothed=(Combined_crop_smoothed(C+MAX_index(n)*20:C+1000))';
       HALFlifeTemp=find(PostPeakSmoothed<HALF_LIFE_value_Ctrl(n));
       HALF_LIFE_index(n)=HALFlifeTemp(1)./20;         %take the first instance of value less than half-life and convert to seconds
end
HALF_LIFE_value=HALF_LIFE_value';
HALF_LIFE_index=HALF_LIFE_index';     % Half Life

