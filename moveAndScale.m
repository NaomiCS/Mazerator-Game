function [Box] = moveAndScale(keypressed,Box)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main File    : moveAndScale.m
% Source Files : ME190GameSkeleton.m; getKeyStroke.m
% Description  : This function allows for the movement and size
%                adjustment of the box 
%                in the ME-190 Group Project Game.
% input param  : keypressed:  The corresponding ASCII code to
%               a button on the keyboard entered by the user
%               and calculated by getKeyStroke.m
%               Box:  The 5x5 matrix containing the x and y 
%                   coordinates of each point of the box in
%               the ME-190 Project Game.
% output param : Updated values within Box to move or scale the
%                   Box for the game.
% Author       : Kyle W Kelly
% Date         : 2/16/2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
boxarea = (Box(1,2)-Box(1,1))^2;

kp = keypressed;  %reassignment of variable for ease of typing

if kp == 29  %move right arrow
    Box(1,:) = Box(1,:) + .25;
    
elseif kp == 28  %move left arrow
    Box(1,:) = Box(1,:) - .25;
    
elseif kp == 30  %move up arrow
    Box(2,:) = Box(2,:) + .25; 
    
elseif kp == 31 %move down arrow
    Box(2,:) = Box(2,:) - .25;
    
elseif kp == 61 && boxarea < 4 %Size UP
    %Bottom Left
    Box(1,1) = (Box(1,1)- 0.25); %Bottom Left X
    Box(2,1) = (Box(2,1)- 0.25); %Bottom Left Y
    Box(1,5) = (Box(1,5)- 0.25); %Bottom Left X
    Box(2,5) = (Box(2,5)- 0.25); %Bottom Left Y
    
    %Botttom Right
    Box(1,2) = (Box(1,2)+ 0.25); %Bottom Right X
    Box(2,2) = (Box(2,2)- 0.25); %Bottom Right Y
    
    %Top Right
    Box(1,3) = Box(1,3) + 0.25; %Top Right X
    Box(2,3) = Box(2,3) + 0.25; %Top Right Y
    
    %Top Left
    Box(1,4) = (Box(1,4) - 0.25); %Top Left X
    Box(2,4) = (Box(2,4) + 0.25) %Top Left Y
    
elseif kp == 45  && boxarea >.25 %Size DOWN
    
    %Bottom Left
    Box(1,1) = Box(1,1)+ 0.25; %Bottom Left X
    Box(2,1) = Box(2,1)+ 0.25; %Bottom Left Y
    Box(1,5) = Box(1,5)+ 0.25; %Bottom Left X
    Box(2,5) = Box(2,5)+ 0.25; %Bottom Left Y
     
    %Botttom Right
    Box(1,2) = Box(1,2)- 0.25; %Bottom Right X
    Box(2,2) = Box(2,2)+ 0.25; %Bottom Right Y
    
    %Top Right
    Box(1,3) = Box(1,3) - 0.25; %Top Right X
    Box(2,3) = Box(2,3) - 0.25; %Top Right Y
    
    %Top Left
    Box(1,4) = Box(1,4) + 0.25; %Top Left X
    Box(2,4) = Box(2,4) - 0.25; %Top Left Y

end   
end

   


% xap = 
% xan = 
% yap = 
% yan = 
% 
% 
% mybox = [xan xap xap xan xan;
%          yan yan yap yap yan;
%          0 0 0 0 0 ;
%          1 1 1 1 1];
%      
% mat=[x-(s/2) x+(s/2) x+(s/2) x-(s/2) x-(s/2) ; 
%      y-(s/2) y-(s/2) y+(s/2) y+(s/2) y-(s/2) ;
%      0        0       0       0       0      ;
%      1        1       1       1       1   ]  ;
%      
% % plot(mybox(1,:),mybox(2,:),'.-')
% % axis square
% % axis([-5 5 -5 5])


%end