% Function to move the motor until the desired potentiometer value is reached
function moveMotorUntilValueReached(dcm, a, targetValue, speed, potentiometerPin)
    while true
%         start(dcm);
        currentPotValue = readVoltage(a, potentiometerPin);  % Adjust potentiometerPin
        if abs(currentPotValue - targetValue) < 0.1  % Adjust the tolerance as needed
            break;
        elseif currentPotValue < targetValue
            dcm.Speed = speed;
        else
            dcm.Speed = -speed;
        end
        pause(0.1);  % Adjust as needed
    end
    stop(dcm);
end