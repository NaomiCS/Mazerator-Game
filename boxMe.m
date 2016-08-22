%File Name     : boxMe.m
% Description : This function takes a point and creates a box
%               around it
% input param : x,y - x and y coordinates of the point
%             : s - size of the box
% output param: mybox – a 4X5 matrix containing the points 
%               defining the box. The bottom row is all ones for 
%               use with homogeneous transformations
% author: Naomi CS
% date: 2/11/2016
%EDIT #1
function [mybox] = boxMe(x,y,s)

xap = x+(s/2); %x right
xan = x-(s/2); %x left
yap = y+(s/2); % y top
yan = y-(s/2); %y bottom

mybox = [xan xap xap xan xan; yan yan yap yap yan; 0 0 0 0 0 ; 1 1 1 1 1];
%plot(mybox(1,:),mybox(2,:),'.-')
%axis square
%axis ([-4 4 -4 4])
end
