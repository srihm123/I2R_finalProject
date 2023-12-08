% Define the initial and final positions for the removeOpponentPawn move (a3 to hellhole)
H_initial_removeOpponentPawn = [...];  % Replace with your actual H_initial for the removeOpponentPawn
H_final_removeOpponentPawn = [...];    % Replace with your actual H_final for the removeOpponentPawn

% Define the initial and final positions for the knight's move (b1 to a3)
H_initial_knight = [...];  % Replace with your actual H_initial for the knight
H_final_knight = [...];    % Replace with your actual H_final for the knight

% % Define the initial and final positions for the pawn's move (b2 to a3)
H_initial_pawn = [...];    % Replace with your actual H_initial for the pawn
H_final_pawn = [...];      % Replace with your actual H_final for the pawn
% 
% % Define the initial and final positions for the rook's move (a1 to a3)
H_initial_rook = [...];    % Replace with your actual H_initial for the rook
H_final_rook = [...];      % Replace with your actual H_final for the rook

% Define the robotic arm geometry (adjust as needed)
L1 = 9;  % Length of link 1
L2 = 22.5;  % Length of link 2

% Pause or perform other actions (e.g., opponent's move)

% Move for removing opponent pawn (a3 to hellhole)
moveRobot(H_initial_removeOpponentPawn, H_final_removeOpponentPawn, L1, L2);

% Move the knight from b1 to a3
moveRobot(H_initial_knight, H_final_knight, L1, L2);

% % Move the pawn from b2 to a3
moveRobot(H_initial_pawn, H_final_pawn, L1, L2);
% 
% % Move the pawn from a1 to a3
moveRobot(H_initial_rook, H_final_rook, L1, L2);



