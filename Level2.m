% Main File: Level2.m
% Author: Naomi CS
% Date: 17 Feb 2016
% Trial 12

close all % closes all figures

quit = 0; 
levelTwoComplete = 0;
numStrokes = 0;
numWallHits = 0;
score2 = 0;
keypress = 0; %initialize keypress variable

% Setting up the graphics window
callstr = 'set(gcbf,''Userdata'',double(get(gcbf,''Currentcharacter''))) ; uiresume ' ;
fh = figure('keypressfcn',callstr,'userdata','timeout');

clf % clear current figure window
text(-1,0, 'Level 2: The Spiral','Color','blue','FontSize',14)
text(-1,-1, 'Hit Any Key to Continue')
axis([-2 2 -2 2])
axis square
pause(.1)
uiwait;

% Display Playing Instructions
clf
axis([-2 2 -2 2])
axis square
text(-1.75,1, 'How to Play:','Color','red','FontSize',12)
text(-1.75,0.5, '1) Avoid hitting the walls')
text(-1.75,0.25,'2) Use arrow keys to maneuver')
text(-1.75,0,'3) Use + key to increase size,')
text(-1.75,-.25,'     and - key to decrease size.')
text(-1,-.75, 'Hit Any Key to Continue')
pause(.1)
uiwait;

%Box and map data
Box = boxMe(11,11,1.5);
% Define start position
startpos = Box;

clf
axis([-.1 12.1 -.1 12.1])
axis off
axis square

map3 = [12 12 0 0 2 0 0 10 10 6 6 6 4 4 2 4 4 9 9 6 6 8 8;
    12 0 0 4 4 4 12 12 3 3 1.5 3 3 8 8 8 10 10 6 6 9 9 7];
map4 = [6.5 7 7.5 7 7.5 7 6.5;8.5 8 8.5 8 7.5 8 7.5]; %plots an X as the goal

hold on
plot(map3(1,:),map3(2,:),'b',map4(1,:),map4(2,:),'r') %blue maze
ho = plot(Box(1,:),Box(2,:),'m'); %magenta box

%Begin level 2 gameplay
tstart = tic;
while ~levelTwoComplete && ~quit
    %Drawing the box
    h = plot(Box(1,:),Box(2,:),'cyan');
    % Delete data from old graphics
    set(ho,'XData',[],'YData',[])
    ho = h; % update the previous graphics handle
    axis([-.1 12.1 -.1 12.1])
    axis off
    axis square
    xlabel('')
    title(['Your score: ' num2str(score2,'%15.0f')  '     Time: ' ...
            num2str(toc(tstart),'%8.2f')])
    
    %Maze logic
   % boxStatus = inf(1,4);   
    boxStatus = mazeLogic2(Box);
    
    % Hit wall
    if boxStatus(1)
        hw = plot(Box(1,:),Box(2,:),'r');
        Box = startpos;
        h = plot(Box(1,:),Box(2,:),'r');
        set(ho,'XData',[],'YData',[])
        ho = h;
        axis([-.1 12.1 -.1 12.1])
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
    plot(map3(1,:),map3(2,:),'*-k');
    %Box color changes to cyan
    ho = plot(Box(1,:),Box(2,:),'g');
    % Text: 'You win! press any key to continue'
    text (4,7, 'You Win!!!', 'Color', 'Magenta', 'Fontsize',24)
    text (3,5, ' Hit Any Key To Continue','Color','Magenta','Fontsize',12)
    axis([-.1 12.1 -.1 12.1])
    axis off
    axis square
    pause(.1)
    uiwait;
        levelTwoComplete = 1;
       
    end
    
    %Beginning boundary
    if boxStatus(3)
        Box = moveDown(Box);
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
    score2 = calcScore(numStrokes,numWallHits,telapsed);
    
end

% Display Final Score
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
text(-1,-2,num2str(score+score2),'Color','Blue','FontSize',22)

pause(1)
%
if levelTwoComplete
    clf
end


