function [Box] = moveRight(Box)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main File    : moveRight.m
% Source Files : ME190GameSkeleton.m
% Description  : During the game, if a user tries to move the box
%               Out of the screen to the left of the starting point,
%               this function will be triggered by mazeLogic.m
%               (not required) to move the box back into the
%               field of play.
% input/output param  : Box:  THe Matrix containing the x,y coord
%               of points in the box in the game and their 
%               coresponding updated values
% Author       : Kyle W Kelly
% Date         : 2/16/2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Box(1,:) = Box(1,:) + .25;


end