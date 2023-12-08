% Function to move the robot from initial to final position
function moveRobot(H_initial, H_final, L1, L2)
    
    % Calculate joint angles using inverse kinematics
    theta_base_initial = abs(atan2(H_initial(2, 1), H_initial(1, 1)));
    theta_link1_initial = abs(acos((H_initial(1, 4)^2 + H_initial(2, 4)^2 + H_initial(3, 4)^2 - L1^2 - L2^2) / (2 * L1 * L2)));
    theta_link2_initial = abs(atan2(H_initial(2, 4), H_initial(1, 4)));
    
    theta_base_final = abs(atan2(H_final(2, 1), H_final(1, 1)));
    theta_link1_final = abs(acos((H_final(1, 4)^2 + H_final(2, 4)^2 + H_final(3, 4)^2 - L1^2 - L2^2) / (2 * L1 * L2)));
    theta_link2_final = abs(atan2(H_final(2, 4), H_final(1, 4)));
    
    % Convert joint angles to potentiometer values (adjust scaling factors)
    potValue_base_initial = map(theta_base_initial, -pi, pi, 0, 5);
    potValue_link1_initial = map(theta_link1_initial, 0, pi, 0, 5);
    potValue_link2_initial = map(theta_link2_initial, -pi, pi, 0, 5);
    
    potValue_base_final = map(theta_base_final, -pi, pi, 0, 5);
    potValue_link1_final = map(theta_link1_final, 0, pi, 0, 5);
    potValue_link2_final = map(theta_link2_final, -pi, pi, 0, 5);
    
    % Connect to Arduino and Adafruit Motor Shield
    a = arduino('COM5', 'MEGA2560', 'Libraries', 'Adafruit\MotorShieldV2');
    shield = addon(a, 'Adafruit\MotorShieldV2');

    % Define the potentiometer pins for each motor
    potentiometerPin_base = 'A0';  % Replace with the actual pin for the base motor
    potentiometerPin_link1 = 'A1';  % Replace with the actual pin for link1 motor
    potentiometerPin_link2 = 'A2';  % Replace with the actual pin for link2 motor
    
    %moveRobot(H_initial_knight, H_final_knight, L1, L2, a, potentiometerPin_base, potentiometerPin_link1, potentiometerPin_link2);

    
    % Create DC motors for the robotic arm (adjust motor numbers accordingly)
    dcm_base = dcmotor(shield, 1);
    dcm_link1 = dcmotor(shield, 2);
    dcm_link2 = dcmotor(shield, 3);

    
    dcm_base.Speed = 0.5;
    dcm_link1.Speed = 0.5;
    dcm_link2.Speed = 0.5;
    
    % Move the DC motors until desired potentiometer values are reached
    moveMotorUntilValueReached(dcm_base, a, potValue_base_initial, 0.5, potentiometerPin_base);
    moveMotorUntilValueReached(dcm_link1, a, potValue_link1_initial, 0.5, potentiometerPin_link1);
    moveMotorUntilValueReached(dcm_link2, a, potValue_link2_initial, 0.5, potentiometerPin_link2);
    
    % Pause for a moment (optional)
    pause(2);  % Adjust as needed
    
    moveMotorUntilValueReached(dcm_base, a, potValue_base_initial, 0.5, potentiometerPin_base);
    moveMotorUntilValueReached(dcm_link1, a, potValue_link1_initial, 0.5, potentiometerPin_link1);
    moveMotorUntilValueReached(dcm_link2, a, potValue_link2_initial, 0.5, potentiometerPin_link2);
    
    % Stop the motors
    stop(dcm_base);
    stop(dcm_link1);
    stop(dcm_link2);
    
    % Clear variables and disconnect Arduino
    clear dcm_base dcm_link1 dcm_link2 shield a;
end
