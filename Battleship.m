%A quick INTRODUCTION t%A quick INTRODUCTION to the game
clc;
fprintf('\t\t\t\t***********************************************\n');
fprintf('\t\t\t\t\t\tWelcome to Matlab BATTLESHIP!\n');
fprintf('\t\t\t\t***********************************************\n\n\n');
fprintf( ...
    ['\t\t\t                         ==^==\n' ...
    '\t\t\t                    _____/|#|//___:\n' ...
    '\t\t\t    ________|______/__0__/____0_0_|____/______\n' ...
    '\t\t\t   (     0      0   ,   0   ,   ````   0       )\n' ...
    '~~~~~~~`~~~~`~~`~~~`~~`~~`~~`~~`~~~`~~~~`~~`~`~~~~~~`~~`~~~~`~~~~~`~~`~~~~~~~~~\n\n']);
fprintf('Before you begin to play, here is a quick introduction on how to play the game....\n\n');
fprintf([ ...
    '* This is a single player game.\n* The computer randomly arranges ships on the board.\n' ...
    '* One ship occupy one slot on the board.\n* The player has to guess the position of the ships.\n' ...
    '* Guessing the position of a ship correctly scores you a point.\n' ...
    '* In the board - \n' ...
    ' \t\t# `0` represents slots that are not hit.\n' ...
    ' \t\t# `1` represents slots that are failed hit.\n' ...
    ' \t\t# `2` represents slots that are successful hit.\n' ...
    '* There are three levels you can choose from - \n' ...
    '\t\t1.EASY\n\t\t\t# It creates a 4x4 board with 6 ships.\n' ...
    '\t\t\t# The player gets 6 chances to guess the position of a ship.\n' ...
    '\t\t2.MODERATE\n\t\t\t# It creates a 6x6 board with 9 ships.\n' ...
    '\t\t\t# The player gets 9 chances to guess the position of a ship.\n' ...
    '\t\t3.DIFFICULT\n\t\t\t# It creates a 8x8 board with 7 ships.\n' ...
    '\t\t\t# The player gets 7 chances to guess the position of a ship.\n\n']);
fprintf(['\t\t\t\t\t\t####################################\n' ...
         '\t\t\t\t\t\t#                                  #\n' ...
         '\t\t\t\t\t\t#   Press ENTER to play the game   #\n' ...
         '\t\t\t\t\t\t#                                  #\n' ...
         '\t\t\t\t\t\t####################################\n']);

start = input(''); %Starts the game when the user presses any key
play_status = 1; %Checks if the user wants to keep playing or wants to quit

while play_status == 1
    clc;
    % Asks the user to choose a level based on difficulty
    level = 0;
    while (level ~= 1) && (level ~= 2) && (level ~= 3)
        clc;
        fprintf('Choose among the given levels of difficulty:\n');
        fprintf('Press 1 for EASY\n');
        fprintf('Press 2 for NORMAL\n');
        fprintf('Press 3 for DIFFICULT\n');
        level = input('Enter your choice: ');
        clc
    end

    %Determines the board size based on chosen level
    board_order = 0;
    if level == 1
        board_order = 4;
    elseif level == 2
        board_order = 6;
    elseif level == 3
        board_order = 8;
    end
    board = zeros(board_order);
       
    score = 0; %Keeps count of the user's score
    
    %When EASY level is chosen
    if level == 1

        %Decides the position of ships randomly
        for i = 1:6
            ship_row(i) = randi(board_order, 1); %random row
            ship_col(i) = randi(board_order, 1); %random column
        end

        %Prompts the user to take a guess of the ship's position
        for guess = 1:6
            board %Dispalys the board at the top of the screen
            fprintf('#############################################################################\n\n');
            guess_row = input('Guess the ROW of Battleship: ');
            guess_col = input('Guess the COLUMN of Battleship: ');
            if (guess_row > board_order) || (guess_col > board_order)
                fprintf('-----------------------------------------------------------');
                fprintf('\nOops! Your hit is out of board.\n\n');
                fprintf(' ###########################\n');
                fprintf(' # Press ENTER to continue #\n');
                fprintf(' ###########################\n');
                start = input('');
                clc;
                continue
            end

            %Decides if the hit is successful or not
            game_status = 1;
            for i = 1:6
                if (guess_row == ship_row(i)) && (guess_col == ship_col(i))
                    game_status = 2;            
                end
            end

            %Perform some actions based on the hit's result
            if game_status == 2
                board(guess_row,guess_col) = 2;
                score = score + 1;
                fprintf('-----------------------------------------------------------');
                fprintf('\n\nYou sunk a BATTLESHIP!\n\n');
                fprintf('-----------------------------------------------------------');
                score
                fprintf(' ###########################\n');
                fprintf(' # Press ENTER to continue #\n');
                fprintf(' ###########################\n');
                start = input('');
                clc;
            else
                board(guess_row,guess_col) = 1;
                fprintf('-----------------------------------------------------------');
                fprintf('\n\nYou missed. Try again!\n\n');
                fprintf('-----------------------------------------------------------');
                score
                fprintf(' ###########################\n');
                fprintf(' # Press ENTER to continue #\n');
                fprintf(' ###########################\n');
                start = input('');
                clc;
            end
        end

        %Asks the user if he/she wants to keep playing
        fprintf('Your FINAL SCORE is %d', score); %Displays the final score of the game
        fprintf('\n\n###########################################################\n\n');
        fprintf('Do you want to continue playing?\n');
        fprintf('Press 1 to CONTINUE\n');
        fprintf('Press 2 to QUIT\n');
        fprintf('Enter your choice: ')
        play_status = input('');
        while (play_status ~= 1) && (play_status ~= 2)
            fprintf('\n***********************************************************\n');
            fprintf(['\nPlease press a valid key!\n' ...
                'Enter your choice: ']);
            play_status = input('');
        end
        
    %When MODERATE level is chosen
    elseif level == 2

        %Decides the position of ships randomly
        for i = 1:9
            ship_row(i) = randi(board_order, 1); %random row
            ship_col(i) = randi(board_order, 1); %random column
        end
        
        %Prompts the user to take a guess of the ship's position 
        for guess = 1:9
            board %Displays the board at the top of the screen
            fprintf('#############################################################################\n\n');
            guess_row = input('Guess the ROW of Battleship: ');
            guess_col = input('Guess the COLUMN of Battleship: ');
            if guess_row > board_order || guess_col > board_order
                fprintf('-----------------------------------------------------------');
                fprintf('\nOops! Your hit is out of board.\n\n');
                fprintf(' ###########################\n');
                fprintf(' # Press ENTER to continue #\n');
                fprintf(' ###########################\n');
                start = input('');
                clc;
                continue
            end
               
            %Decides if the hit is successful or not
            game_status = 1;
            for i = 1:9
                if (guess_row == ship_row(i)) && (guess_col == ship_col(i))
                    game_status = 2;            
                end
            end
  
            %Perform some actions based on the hit's result
            if game_status == 2
                board(guess_row,guess_col) = 2;
                score = score + 1;
                fprintf('-----------------------------------------------------------');
                fprintf('\n\nYou sunk a BATTLESHIP!\n\n');
                fprintf('-----------------------------------------------------------');
                score
                fprintf(' ###########################\n');
                fprintf(' # Press ENTER to continue #\n');
                fprintf(' ###########################\n');
                start = input('');
                clc;
            else
                board(guess_row,guess_col) = 1;
                fprintf('-----------------------------------------------------------');
                fprintf('\n\nYou missed. Try again!\n\n');
                fprintf('-----------------------------------------------------------');
                score
                fprintf(' ###########################\n');
                fprintf(' # Press ENTER to continue #\n');
                fprintf(' ###########################\n');
                start = input('');
                clc;
            end
         end

        %Asks the user if he/she wants to keep playing
        fprintf('Your FINAL SCORE is %d', score); %Displays the final score of the game
        fprintf('\n\n###########################################################\n\n');
        fprintf('Do you want to continue playing?\n');
        fprintf('Press 1 to CONTINUE\n');
        fprintf('Press 2 to QUIT\n');
        fprintf('Enter your choice: ')
        play_status = input('');
        while (play_status ~= 1) && (play_status ~= 2)
            fprintf('\n***********************************************************\n');
            fprintf(['\nPlease press a valid key!\n' ...
                'Enter your choice: ']);
            play_status = input('');
        end

    %When DIFFICULT level is chosen     
    elseif level == 3

        %Decides the position of ships randomly
        for i = 1:7
            ship_row(i) = randi(board_order, 1); %random row
            ship_col(i) = randi(board_order, 1); %random column
        end

        %Prompts the user to take a guess of the ship's position
        for guess = 1:7
            board %Displays the board at the top of the screen
            fprintf('#############################################################################\n\n');
            guess_row = input('Guess the ROW of Battleship: ');
            guess_col = input('Guess the COLUMN of Battleship: ');
            if guess_row > board_order || guess_col > board_order
                fprintf('-----------------------------------------------------------');
                fprintf('\nOops! Your hit is out of board.\n\n');
                fprintf(' ###########################\n');
                fprintf(' # Press ENTER to continue #\n');
                fprintf(' ###########################\n');
                start = input('');
                clc;
                continue
            end
            
            %Decides if the hit is successful or not
            game_status = 1;
            for i = 1:7
                if (guess_row == ship_row(i)) && (guess_col == ship_col(i))
                    game_status = 2;            
                end
            end
            
            %Perform some actions based on the hit's result
            if game_status == 2
                board(guess_row,guess_col) = 2;
                score = score + 1;
                fprintf('-----------------------------------------------------------');
                fprintf('\n\nYou sunk a BATTLESHIP!\n\n');
                fprintf('-----------------------------------------------------------');
                score
                fprintf(' ###########################\n');
                fprintf(' # Press ENTER to continue #\n');
                fprintf(' ###########################\n');
                start = input('');
                clc;
            else
                board(guess_row,guess_col) = 1;
                fprintf('-----------------------------------------------------------');
                fprintf('\n\nYou missed. Try again!\n\n');
                fprintf('-----------------------------------------------------------');
                score
                fprintf(' ###########################\n');
                fprintf(' # Press ENTER to continue #\n');
                fprintf(' ###########################\n');
                start = input('');
                clc;
            end
        end

        %Asks the user if he/she wants to keep playing
        fprintf('Your FINAL SCORE is %d', score); %Displays the final score of the game
        fprintf('\n\n###########################################################\n\n');
        fprintf('Do you want to continue playing?\n');
        fprintf('Press 1 to CONTINUE\n');
        fprintf('Press 2 to QUIT\n');
        fprintf('Enter your choice: ')
        play_status = input('');
        while (play_status ~= 1) && (play_status ~= 2)
            fprintf('\n***********************************************************\n');
            fprintf(['\nPlease press a valid key!\n' ...
                     'Enter your choice: ']);
            play_status = input('');
        end
    end
end
