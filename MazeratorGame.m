%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main File   : MazeratorGame.m
% Source Files: boxMe.m, mazeLogic.m, mazeLogic2.m, moveRight.m, getKeyStroke.m, 
%               calcScore.m, moveandScale.m            
% Description : This game features two levels. The first level is a maze
% in which the purpose is to get to the end of the maze without hitting the
% walls. The second level is a game in which the purpose is to ...
% Author      : Dr. L.A. Rodriguez, Naomi CarmeliShabtay, Cayla Hawkins, Kyle Kelley
% Date        : 02/09/2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------------------------  Intro -----------------------------------%
clear all % clear all variables from work space
clc       % clear the screen
close all % close all figures

%INITIALIZE KEY PRESS VARIABLE
keypress = 0;

% Setting up the graphics window
callstr = 'set(gcbf,''Userdata'',double(get(gcbf,''Currentcharacter''))) ; uiresume ' ;
fh = figure('keypressfcn',callstr,'userdata','timeout');

% Show Introduction Images
for imageNum = 1 : 10
    filename = strcat('Capture', num2str(imageNum),'.PNG');
    PIC = imread(filename);
    imagesc([-10 10], [-10 10],flipud(PIC(:,:,1)));
    set(gca,'ydir','normal');
    axis square
    axis off
    pause(.2)
end

%---------------------------- First values -------------------------------%
%Starts game at level 1
quit = 0; 
levelOneComplete = 0;
levelTwoComplete = 0;
numStrokes = 0;
numWallHits = 0;
score = 0;

%------------------------------ Level 1 ----------------------------------%
% Explaining level 1
% Display Level Name
clf % clear current figure window
text(-1,0, 'Level 1: The Maze','Color','blue','FontSize',14)
text(-1,-1, 'Hit Any Key to Continue')
axis([-2 2 -2 2])
axis off
axis square
pause(.1)
uiwait;

% Display Playing Instructions

clf
axis([-2 2 -2 2])
axis off
axis square
text(-1.75,1, 'How to Play:','Color','red','FontSize',12)
text(-1.75,0.5, '1) Avoid hitting the walls')
text(-1.75,0.25,'2) Use arrow keys to maneuver')
text(-1.75,0,'3) Use + key to increase size,')
text(-1.75,-.25,'     and - key to decrease size.')
text(-1,-.75, 'Hit Any Key to Continue')
pause(.1)
uiwait;

clf

%Loading/plotting Level 1 background image
I = imread('abyss.jpg');
minx =-1.1;
maxx = 15.1;
miny = -2.1;
maxy = 13.1;
imagesc([minx maxx], [miny maxy],flipud(I(:,:,1)));
set(gca,'ydir','normal');

%Box and map data
Box = boxMe(0,0,1);
% Define start position
startpos = Box;

map1=[-1 3 3 9.5 9.5 12 12 8  8  5  5 -1;
       2 2 7 7   3   3  8  8  12 12 8  8];

map2=[-1 5.5 5.5 8 8 15 15 10 10 2  2  -1;
      -2 -2  5   5 1 1  10 10 13 13 11 11];
 
%Plotting map
hold on
plot(map1(1,:),map1(2,:),'y',map2(1,:),map2(2,:),'y');
ho = plot(Box(1,:),Box(2,:),'white');

%Beginning the level 1 game play
tstart = tic; %start clock
while ~levelOneComplete && ~quit
    
    %Drawing the box
    h = plot(Box(1,:),Box(2,:),'white');
    % Delete data from old graphics
    set(ho,'XData',[],'YData',[])
    ho = h; % update the previous graphics handle
    axis([-1.1 15.1 -2.1 13.1])
    axis off
    axis square
    xlabel('')
    title(['Your score: ' num2str(score,'%15.0f')  '     Time: ' ...
            num2str(toc(tstart),'%8.2f')])
    
    %Maze logic
    
    boxStatus = mazeLogic(Box);
    
    % Hit wall
    if boxStatus(1)
        hw = plot(Box(1,:),Box(2,:),'r');
        Box = startpos;
        h = plot(Box(1,:),Box(2,:),'r');
        set(ho,'XData',[],'YData',[])
        ho = h;
        axis([-1.1 15.1 -2.1 13.1])
        axis off
        axis square
        xlabel('Try again')
        boxStatus(1) = 0;
        pause(0.001)
        set(hw,'XData',[],'YData',[])
       numWallHits =numWallHits + 1;
    end
    
    % Win, Reach end of Maze
    if boxStatus(2)
    
    % Map boundaries change to red    
    plot(map1(1,:),map1(2,:),'r',map2(1,:),map2(2,:),'r');
    
    %Box color changes to green
    ho = plot(Box(1,:),Box(2,:),'green');
    
    % Text: 'You win! press any key to continue'
    text (4,6.5, 'You Win!!!', 'Color', 'White', 'Fontsize',24)
    text (3,4, ' Hit Any Key To Continue','Color','White','Fontsize',12)
    axis([-1.1 15.1 -2.1 12.1])
    axis off
    axis square
    pause(.1)
    uiwait;
        levelOneComplete = 1;
       
    end
    
    %Beginning boundary
    if boxStatus(3)
        Box = moveRight(Box);
    end

% Game ends if escape key is pressed
    keyPressed = getKeyStroke(1,fh); 
    if keyPressed == 27
        quit = 1;
        close all
    else
        Box = moveAndScale(keyPressed,Box);
    end
       
    %Key stroke counter
    numStrokes = numStrokes + 1;
    
    %Score calculator
    telapsed = toc(tstart);
    score = calcScore(numStrokes,numWallHits,telapsed);
end

% Display Final Score and celebratory message/animation
if levelOneComplete
    clf
    pnts = [ 0 0 1 1 0; 0 1 1 0 0 ; 0 0 0 0 0];
    theta = 45; % degrees
    for theta = 0:10:360
        c = cosd(theta);
        s = sind(theta);
        Rz = [c -s 0 0; s c 0 0; 0 0 1 0; 0 0 0 1];
        plot(pnts(1,:),pnts(2,:),'.-')
        axis square
        axis([-5 5 -5 5])
        newPnts = Rz*[pnts;ones(1,5)];
        hold on
        plot(pnts(1,:),pnts(2,:),'.-',newPnts(1,:),newPnts(2,:),'.-')
        axis square
        axis([-3 3 -3 3])
        axis off
        pause(.1)
        hold on
    end
    text(-1.5,2, 'Final score is:','Color','blue','FontSize',22)
    text(-.5,-2,num2str(score),'Color','Blue','FontSize',22)
    
elseif quit%quit message and image to prevent victory animation from playing
    I = imread('quitter.png');
    minx =-1.1;
    maxx = 15.1;
    miny = -2.1;
    maxy = 13.1;
    imagesc([minx maxx], [miny maxy],flipud(I(:,:,1)));
    set(gca,'ydir','normal');
end

    pause(1)

if levelOneComplete
    clf
end

%------------------------------- Level 2 ----------------------------------%
% Development of 2nd level goes HERE

if levelOneComplete
    run Level2
end

%------------------------------- Level 3 ----------------------------------%
if levelTwoComplete
    %run level3Test
end

%------------------------------- End game ----------------------------------%

clf
axis([-3 3 -3 3])
text(-1,1,'Game Over','Color','Blue','FontSize',22)
text(-1,0, 'Thanks for playing!','FontSize',14)

