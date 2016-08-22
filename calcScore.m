% Description: Calculates the user’s score in the game based on 
% the number of moves taken, the number of times the walls were % hit, and the elapsed time.
% input param: moves – number of moves taken or key strokes used
%              wallHits – number of times the walls have been 
%              hit
%              etime- total elapsed time 
% output param: score – value of the score earned by the player
% Author: Naomi CarmeliShabtay
% Date: 2/16/2016
% Trial 4

function [BaseScore] = calcScore(numStrokes,wallHits,etime)
BaseScore = 5*min(numStrokes,250)-(100*wallHits); %base score from moves and wall hits

if etime >= 0 && etime <= 15 %for time 0:15 seconds, 1000 bonus points
    BaseScore = BaseScore + 1000;
elseif etime > 15 && etime<=25 %for time 15 to 25 seconds 500 bonus pts
    BaseScore = BaseScore + 500;
elseif etime>25 && etime<=35 %for time 25 to 30 sec, 250 bonus pts
    BaseScore = BaseScore + 250;
elseif etime>35 && etime<=45 %for time 35 to 45 sec, 125 bonus pts
    BaseScore = BaseScore + 125;
else
    BaseScore = BaseScore-10*(etime-45); %for time greater than 45 sec
end

end
