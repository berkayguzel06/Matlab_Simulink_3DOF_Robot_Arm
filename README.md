# 3-DOF Robotic Arm Simulation and Control

![simulation](https://github.com/berkayguzel06/Matlab_Simulink_3DOF_Robot_Arm/assets/98205992/07dd5c7b-7859-444c-8d21-09e534a11e95)

This repository contains the code and documentation for modeling, simulating, and controlling a 3-DOF (Degrees of Freedom) robotic arm using MATLAB's Robotics Toolbox and Simulink.

## Table of Contents
- [Introduction](#introduction)
- [Overview](#overview)
- [Environment Setup](#environment-setup)
- [Robot Model](#robot-model)
- [Kinematics](#kinematics)
- [Integration with Simulink](#integration-with-simulink)
- [GUI Implementation](#gui-implementation)
- [Real-Time Simulation](#real-time-simulation)

## Introduction
This project aims to model, simulate, and control a 3-DOF robotic arm using MATLAB's Robotics Toolbox and Simulink. The project includes defining the kinematic model, creating a graphical user interface (GUI) for interaction, and implementing real-time simulations.

## Overview
The MATLAB Robotics Toolbox is a powerful collection of functions and classes for modeling and simulating robotic systems. It provides tools for manipulating rigid body trees, performing kinematic and dynamic analysis, and visualizing robotic systems. Integration with Simulink allows for real-time simulation and control system design.

## Environment Setup
### Software Requirements
- MATLAB R2021a or later
- Robotics System Toolbox
- Simulink

## Robot Model
### Defining the Robot
The robotic arm is defined using the `rigidBodyTree` class in MATLAB, specifying the links (rigid bodies) and joints of the robot.

### Kinematic Chain
The kinematic chain connects the links with joints, defining their motion capabilities (e.g., revolute joints). 

## Kinematics
### Forward Kinematics
Forward kinematics calculates the position and orientation of the end-effector based on given joint angles using transformation matrices.

### Inverse Kinematics
Inverse kinematics determines the required joint angles to achieve a desired end-effector position and orientation, involving the solution of nonlinear equations.

## Integration with Simulink
### Introduction to Simulink
Simulink is a graphical programming environment integrated with MATLAB for modeling, simulating, and analyzing multidomain dynamical systems.

### Integrating MATLAB and Simulink
The robotic arm model and its control algorithms are imported into Simulink for real-time simulation and control.

## GUI Implementation
### Purpose of the GUI
The GUI provides an interactive interface for controlling the robotic arm and visualizing its behavior. Users can input desired positions or joint angles and observe the corresponding movements.

### Design and Implementation
The GUI is designed using MATLAB App Designer and includes:
- Input fields for specifying end-effector positions or joint angles.
- Buttons to switch between forward and inverse kinematics modes.
- Real-time updates of joint angles and end-effector positions.

## Real-Time Simulation
### Real-Time Simulation Setup
The simulation runs in real-time using a fixed-step solver, with parameters made tunable for changes during simulation.

### Interaction with the GUI
The GUI updates parameters in real-time, displaying the results on the screen, allowing users to observe the immediate effects of input changes.
