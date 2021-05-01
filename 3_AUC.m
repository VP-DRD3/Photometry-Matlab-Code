% Combined = matrix containing DFF signals for each nose poke epoch; epochs in separate columns; each epoch is 800 frames 

TotalEvents=size(Combined)                             
for n=1:TotalEvents(2)
    B=n*801-800 
    Combined_crop(:,n)=Combined(B+380:B+460);    % Extract from t=-1 to t=+3 sec and put into new matrix
    AUC_list(n)=trapz(Combined_crop(:,n));   % Obtain area under the curve (AUC) and record value in new variable
end
AUC_list=AUC_list';

