clear all;
close all;
clc;

addpath('libCoppelia/');

disp('Program started');
vrep = remApi('remoteApi');
vrep.simxFinish(-1);
clientID = vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
if(clientID> -1)
    disp('Connected to the remote API server');
    vrep.simxAddStatusbarMessage(clientID,'Hello Coppelia Sim!',vrep.simx_opmode_oneshot);
else
    disp('Failed connecting to the remote API server');
    return;
end

[rtn, robot_id(1,1)] = vrep.simxGetObjectHandle(clientID, 'main_body',...
vrep.simx_opmode_oneshot_wait);
if(rtn ~= vrep.simx_return_ok)
    disp('Get test robot handle failed');
end

[rtn, robot_id(1,2)] = vrep.simxGetObjectHandle(clientID,'right_motor',...
    vrep.simx_opmode_oneshot_wait);
if(rtn~=vrep.simx_return_ok)
    disp('Get front right motor handle failed');
end

[rtn,robot_id(1,3)] = vrep.simxGetObjectHandle(clientID,'left_motor',...
    vrep.simx_opmode_oneshot_wait);
if(rtn~=vrep.simx_return_ok)
    disp('Get front left motor handle failed');
end

pause(1);
vrep.simxSetJointTargetVelocity(clientID,robot_id(1,2),0.2,vrep.simx_opmode_oneshot);
vrep.simxSetJointTargetVelocity(clientID,robot_id(1,3),-0.2,vrep.simx_opmode_oneshot);
