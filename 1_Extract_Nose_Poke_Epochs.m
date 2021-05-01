% Ranges = a two-column matrix containing the upper and lower frame number bounds for each relevant nose poke epoch; bounds for each nose poke listed in separate rows;
% DFF = photometry signal being analyzed;

TotalPokes=size(Ranges)                  % TotalPokes = number of nose pokes being analyzed;
for n=1:TotalPokes(2)
    Windows(:,n)=DFF(Ranges(n):Ranges(n,2));  % Extract from DFF signal based on upper and lower frame bounds, and add to columns of "Windows" matrix;
end

% Quick plot
AvgRows=mean(Windows')';
SEM=std(Windows, [], 2)./ sqrt(size(Windows,2));  % Calculate SEM and then plot;
Avg_plus_SEM=AvgRows+SEM;
Avg_minus_SEM=AvgRows-SEM;
plot(AvgRows);
hold;
plot(Avg_plus_SEM);
plot(Avg_minus_SEM);

