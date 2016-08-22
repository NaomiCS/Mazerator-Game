% Description : Determines whether or not the box in the game 
%touches one of the walls or the box reaches the end of the maze % or tries to leave the maze.
% Input       : Box- a 4X5 matrix of points which defines the box
% Output    : boxStatus- a vector which is composed of three elements. The values of the elements can be either 1 or 0. If the first element has a value of 1 it means that the box has hit one of the walls. When the valued of the second element is set to 1 that means the box attempted to exit the maze. Lastly, when the third element is set to 1 this means that the player has reached the end of the maze.
% Author: Naomi CS
% Date: 18 Feb 2016
%%%TRIAL 8
function [boxStatus] = mazeLogic(Box)

boxStatus = [ 0 0 0];

%%%%%%%%%%%%%%%%%%%%%
%MoveRight
if Box(2,1) >= -2 && Box(2,1) <= 0
    %Bottom left Y from -2:0
    if Box(1,1) == -1
        boxStatus(3) = 1;
    end
end

if Box(2,4) >= 0 && Box(2,4) <=2
    %Top left Y from 0:2
    if Box(1,4) == -1
        boxStatus(3) = 1;
    end
end

%%%%%%%%%%%%%%%%%%%
%Wall Hits

if Box(1,1) >= -1 && Box(1,1) <= 2 
    % If bottom left X touches bottom of maze from -1:2
    if Box(2,1) == -2    % at a height of -2
        boxStatus(1) = 1;
    end
end
      
if Box(1,1) >= 2 && Box(1,1) <= 5.5
    % if bottom left X touches bottom of maze from 2:5.5
    if Box(2,1) == -2     % at a height of -2
        boxStatus(1) = 1;
    end
end

if Box(1,4) >= -1 && Box(1,4) <= 3 
    % if top left X touches top of maze from -1:3
    if Box(2,4) == 2    % at a height of 2
        boxStatus(1) = 1;
    end
end
    
if Box(2,2) >= -2 && Box(2,2) <= 5 
    %if bottom right Y touches right wall of maze from -2:5
    if Box(1,2) == 5.5   % at x = 5.5
        boxStatus(1) = 1;
    end
end
    
if Box(2,4) >= 2 && Box(2,4) <= 7 
    % top left Y touches left wall from 2:7
    if Box(1,4) == 3   % at x = 3
        boxStatus(1) = 1;
    end
end

if Box(1,4) >= 3 && Box(1,4) <= 6
    %top left X touches top of maze from 3:6
    if Box(2,4) == 7  % at height of 7
        boxStatus(1) = 1;
    end
end

if Box(1,3) >= 6 && Box(1,3) <= 9.5
    %top right X touches top of maze from 6:9.5
    if Box(2,3) == 7  % at height of 7
        boxStatus(1) = 1;
    end
end

if Box(1,2) >= 5.5 && Box(1,2) <= 8
    %bottom right X touches bottom of maze from 5.5:8
    if Box(2,2) == 5 % at height of 5
        boxStatus(1) = 1;
    end
end

if Box(2,3) >= 3 && Box(2,3) <= 7 
    %top left Y touches right wall from 3:7
    if Box(1,3) == 9.5 % at X = 9.5
        boxStatus(1) = 1;
    end
end

if Box(2,1) >= 1 && Box(2,1) <= 5
    %bottom left Y touches left wall from 1:5
    if Box(1,1) == 8 % at X = 8
        boxStatus(1) = 1;
    end
end

if Box(1,4) >= 9.5 && Box(1,4) <= 12
    %top left X touches top maze from 9.5:12
    if Box(2,4) == 3 % at height 3
        boxStatus(1) = 1;
    end
end

if Box(1,1) >= 8 && Box(1,1) <= 10
    %bottom left X touches bottom maze from 8:10
    if Box(2,1) == 1 % at height 1
        boxStatus(1) = 1;
    end
end

if Box(1,2) >=10 && Box(1,2) <=15
    %bottom right X touches bottom maze 10:15
    if Box(2,2) == 1 % at height of 1
        boxStatus(1) = 1;
    end
end

if Box(2,4) >= 3 && Box(2,4) <= 8
    %top left Y touches left maze from 3:8
    if Box(1,4) == 12 % at x = 12
        boxStatus(1) = 1;
    end
end

if Box(2,2) >= 1 && Box(2,2) <= 10
    %Bottom right Y touches right maze from 1:10
    if Box(1,2) == 15 % at x=15
        boxStatus(1) = 1;
    end
end
    
if Box(1,1) >= 8 && Box(1,1) <= 12
    %Bottom Left X touches bottom maze 8:12
    if Box(1,2) == 8 %at height 8
        boxStatus(1) = 1;
    end
end
    
if Box(1,3) >= 10 && Box(1,3) <= 15 %Map 2
    % top right X touches maze from 10:15
    if Box(2,3) == 10 % at height 10
        boxStatus(1) = 1;
    end
end

if Box(2,1) >=8 && Box(2,1) <= 12 % Map 1
    %Bottom Left Y touches left maze from 8:12
    if Box(1,1) == 8 % x = 8
        boxStatus(1) = 1;
    end
end

if Box(2,3) >= 10 && Box(2,3) <= 12 % Map 2
    %top right Y touches right maze from 10:12
    if Box(1,3) == 10 % x = 10
        boxStatus(1) = 1;
    end
end

if Box(1,1) >= 5 && Box(1,1) <= 8 %Map 1
    %Bottom left X touches bottom maze from 5:8
    if Box(1,2) == 12  % height  = 12
        boxStatus(1) = 1;
    end
end

if Box(1,3) >= 5 && Box(1,3) <=10 %map 2
    % Top right X touches top maze from 5:10
    if Box(2,3) == 13 %height of 13
        boxStatus(1) = 1;
    end
end

if Box(1,4) >=2 && Box(1,4) <=5 %map 2
    %top left X touches top maze from 2:5
    if Box(2,4) == 13 %height of 13
        boxStatus(1) = 1;
    end
end

if Box(2,4) >=11 && Box(2,4) <=13 %map 2
    %top left Y touches left maze from 11:13
    if Box(1,4) == 2 % X = 2
        boxStatus(1) = 1;
    end
end

if Box(2,2) >= 8 && Box(2,2) <= 12 %map 1
    %bottom right Y touches right maze from 8:12
    if Box(1,4) == 5 % X = 5
        boxStatus(1) = 1;
    end
end

if Box(1,4) >= -1 && Box(1,4) <= 2 %map 2
    %top left X touches top maze from -1:2
    if Box(2,4) == 11 % height is 11
        boxStatus(1) = 1;
    end
end

if Box(1,2) >= 2 && Box(1,2) <= 5 % map 1
    %bottom right X touches bottom maze from 2:5
    if Box(2,2) == 8 %height = 8
        boxStatus(1) = 1;
    end 
end

if Box(1,1) >= -1 && Box(1,1) <= 2 %map 1
    %bottom left x touches bottom maze from -1:2
    if Box(2,1) == 8 % height is 8
        boxStatus(1) = 1;
    end
end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%end of the maze

if Box(2,4) >= 9.5 && Box(2,4) <= 11
    %top left Y touches end from 9.5:11
    if Box(1,4) == -1 % x = -1
        boxStatus(2) = 1;
    end
end

if Box(2,1) >= 8 && Box(2,1) <= 9.5
    %bottom left Y touches end from 8:9.5
    if Box(1,1) == -1 % x = -1
        boxStatus(2) = 1;
    end
end

end
