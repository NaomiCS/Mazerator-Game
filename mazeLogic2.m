% Description : Determines whether or not the box in the game 
%touches one of the walls or the box reaches the end of the maze % or tries to leave the maze.
% Input       : Box- a 4X5 matrix of points which defines the box
% Output    : boxStatus- a vector which is composed of three elements. The values of the elements can be either 1 or 0. If the first element has a value of 1 it means that the box has hit one of the walls. When the valued of the second element is set to 1 that means the box attempted to exit the maze. Lastly, when the third element is set to 1 this means that the player has reached the end of the maze.
% Author: Naomi CS
% Date: 17 Feb 2016
%%%TRIAL 2

function [boxStatus] = mazeLogic2(Box)

boxStatus = [0 0 0];

%%%%%%%%%%%%%%%
%backing out of the maze
if Box(1,4) >= 10 && Box(1,4) <= 12
    %if top left X touches maze from 10:12
    if Box(2,4) == 12
        % if top left Y touches screen at 12
        boxStatus(3) = 1;
    end
end

%%%%%%%%%%%%%%%
%Wall Hits
if Box(2,3) >= 6 && Box(2,3) <= 12
    % top right Y touches right maze from 6:12
    if Box(1,3) == 12 % at x = 12
        boxStatus(1) = 1;
    end
end
%OK

if Box(2,4) >= 3 && Box(2,4) <= 12
    %top left Y touches left maze from 3:12
    if Box(1,4) == 10 % at x = 10
        boxStatus(1) = 1;
    end
end
%OK

if Box(2,2) >= 0 && Box(2,2) <= 6
    % bottom right Y touches right maze from 0:6
    if Box(1,2) == 12 % x = 12
        boxStatus(1) = 1;
    end
end
%OK

if Box(1,2) >= 6 && Box(1,2) <= 12
    % bottom right X touches bottom maze from 6:12
    if Box(2,2) == 0 % at y=0
        boxStatus(1) = 1;
    end
end
%OK

if Box(1,4) >= 6 && Box(1,4) <= 10
    %top left X touches top maze from 6:10
    if Box(2,4) == 3 % at y = 3
        boxStatus(1) = 1;
    end
end

if Box(2,4) >= 1.5 && Box(2,4) <= 3
    %top left Y touches left maze from 1.5:3
    if Box(1,4) == 6 %at x = 6
        boxStatus(1) = 1;
    end
end
%OK

if Box(1,1) >= 0 && Box(1,1) <= 6
    % bottom left x touches bottom maze 0:6
    if Box(1,1) == 0 % at x = 0
        boxStatus(1) = 1;
    end
end

if Box(1,3) >= 4 && Box(1,3) <= 6
    %top right x touches top maze 4:6
    if Box(2,3) == 3 % at y=3
        boxStatus(1) = 1;
    end
end

if Box(1,4) >= 0 && Box(1,4) <=2
    %Top left x touches left maze from 0:2
    if Box(2,4) == 4 % at y = 4
        boxStatus(1) = 1;
    end
end

if Box(1,4) >= 0 && Box(1,4) <=2
    % top left X touches top maze from 0:2
    if Box(2,4) == 4 % at height of 4
        boxStatus(1) = 1;
    end
end

if Box(2,3) >= 3 && Box(2,3) <= 8
    %top right Y touches right maze from 3:8
    if Box(1,3) == 4 % at x = 4
        boxStatus(1) = 1;
    end
end

if Box(2,1) >= 4 && Box(2,1) <= 8
    % bottom left Y touches left maze from 4:8
    if Box(1,1) == 0 % x = 0
        boxStatus(1) = 1;
    end
end

if Box(1,3) >= 2 && Box(1,3) <= 4
    % top right X touches top maze from 2:4
    if Box(2,3) == 8 % at y = 8
        boxStatus(1) = 1;
    end
end

if Box(2,4) >= 8 && Box(2,4) <= 12
    % top left Y touches left maze from 8:12
    if Box(1,4) == 0 %x = 0
        boxStatus(1) = 1;
    end
end

if Box(2,2) >= 8 && Box(2,2) <= 10
    % if bottom right y touches right maze from 8:10
    if Box(1,2) == 4 % x = 4
        boxStatus(1) = 1;
    end
end

if Box(1,4) >= 0 && Box(1,4) <= 6
    %top left x touches top maze from 0:6
    if Box(2,4) == 12 % y = 12
        boxStatus(1) = 1;
    end
end

if Box(1,3) >= 6 && Box(1,3) <= 10
    %top right x touches top maze from 6:10
    if Box(2,3) == 12 % y = 12
        boxStatus(1) = 1;
    end
end

if Box(2,3) >= 6 && Box(2,3) <= 12
    %top right Y touches right maze from 6:12
    if Box(1,3) == 10 % at x = 10
        boxStatus(1) = 1;
    end
end

if Box(2,2) >= 3 && Box(2,2) <= 6
    % bottom right Y touches right maze from 3:6
    if Box(1,2) == 10 % x = 10
        boxStatus(1) = 1;
    end
end

if Box(2,1) >= 6 && Box(2,1) <= 10
    % bottom Left Y touches left maze from 6:10
    if Box(1,1) == 9 % x = 9
        boxStatus(1) = 1;
    end
end

if Box(1,4) >= 6 && Box(1,4) <= 9
    % top left X touches top maze from 6:9
    if Box(2,4) == 6 % y = 6
        boxStatus(1) = 1;
    end
end

if Box(1,2) >= 7 && Box(1,2) <= 10
    % bottom right x touches bottom maze from 7:10
    if Box(2,2) == 3 % y = 3
        boxStatus(1) = 1;
    end
end

if Box(1,1) >= 4 && Box(1,1) <=7
    % bottom left x touches bottom maze from 4:7
    if Box(2,1) == 3 % y = 3
        boxStatus(1) = 1;
    end
end

if Box(2,1) >= 3 && Box(2,1) <=7
    % bottom left y touches left maze from 3:7
    if Box(1,1) == 4 % x = 4
        boxStatus(1) = 1;
    end
end

if Box(2,4) >= 7 && Box(2,4) <= 10
    % top left y touches left maze from 7:10
    if Box(1,4) == 4 % x = 4
        boxStatus(1) = 1;
    end
end

if Box(1,4) >= 4 && Box(1,4) <=6
    % top left X touches top maze from 4:6
    if Box(2,4) == 10 % y = 10
        boxStatus(1) = 1;
    end
end

if Box(1,3) >= 6 && Box(1,3) <=9
    %top right X touches top maze from 6:9
    if Box(2,3) == 10 % y = 10
        boxStatus(1) = 1;
    end
end

if Box(2,3) >= 8 && Box(2,3) <= 10
    %top right y touches right wall 8:10
    if Box(1,3) == 9 % x = 9
        boxStatus(1) = 1;
    end
end

if Box(2,2) >= 6 && Box(2,2) <= 8
    %bottom right y touches right wall from 6:8
    if Box(1,2) == 9 % x = 9
        boxStatus(1) = 1;
    end
end

if Box(1,2) >= 7 && Box(1,2) <=9
    % bottom right x touches bottom maze from 7:9
    if Box(2,2) == 6 % y = 6
        boxStatus(1) = 1;
    end
end

if Box(1,1) >= 6 && Box(1,1) <= 7
    % bottom left x touches bottom maze from 6:7
    if Box(2,1) == 6 % y = 6
        boxStatus(1) = 1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%
% Win Zone

if Box(1,4) >= 6 && Box(1,4) <= 8
    %top left X from 6:8
    if Box(2,4) >= 7.5 && Box(2,4) <= 9% Y from 7.5:9
        boxStatus(2) = 1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%




end
