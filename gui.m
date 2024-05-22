classdef gui < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        InverseButton        matlab.ui.control.Button
        ForwardButton        matlab.ui.control.Button
        XEditFieldLabel      matlab.ui.control.Label
        XEditField           matlab.ui.control.NumericEditField
        YEditFieldLabel      matlab.ui.control.Label
        YEditField           matlab.ui.control.NumericEditField
        ZEditFieldLabel      matlab.ui.control.Label
        ZEditField           matlab.ui.control.NumericEditField
        Theta1EditFieldLabel matlab.ui.control.Label
        Theta1EditField      matlab.ui.control.NumericEditField
        Theta2EditFieldLabel matlab.ui.control.Label
        Theta2EditField      matlab.ui.control.NumericEditField
        Theta3EditFieldLabel matlab.ui.control.Label
        Theta3EditField      matlab.ui.control.NumericEditField
    end

    properties (Access = private)
        InverseBlockPath  % Path to the inverse kinematics block
        ForwardBlockPath  % Path to the forward kinematics block
        Timer             % Timer object for real-time updates
    end

    methods (Access = private)

        % Button pushed function: InverseButton
        function InverseButtonPushed(app, event)
            % Get the input values
            x = app.XEditField.Value;
            y = app.YEditField.Value;
            z = app.ZEditField.Value;

            % Send input data to Simulink model for inverse kinematics
            set_param(app.InverseBlockPath, 'x', num2str(x), 'y', num2str(y), 'z', num2str(z));
            simOut = sim('Robot_Drive');
        end

        % Button pushed function: ForwardButton
        function ForwardButtonPushed(app, event)
            % Get the input values
            theta1 = app.Theta1EditField.Value;
            theta2 = app.Theta2EditField.Value;
            theta3 = app.Theta3EditField.Value;

            % Send input data to Simulink model for forward kinematics
            set_param(app.ForwardBlockPath, 'theta1', num2str(theta1), 'theta2', num2str(theta2), 'theta3', num2str(theta3));
            simOut = sim('Robot_Drive');
        end

        % Timer callback function for real-time updates
        function TimerCallback(app, ~, ~)
            % This function can be used to update parameters or read outputs
            % periodically during the simulation.
            % For example, you can update the UI with current simulation data
            % or send periodic updates to the Simulink model.

            % Example: Reading data from the Simulink model (if needed)
            % simOut = get_param(app.InverseBlockPath, 'RuntimeObject');
            % disp(simOut.OutputPort(1).Data);

            % Example: Sending periodic updates to Simulink model
            % set_param(app.InverseBlockPath, 'x', num2str(app.XEditField.Value));
        end
    end

    % Component initialization
    methods (Access = private)

        % Create components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 400 300];
            app.UIFigure.Name = 'Kinematics Control';

            % Create InverseButton
            app.InverseButton = uibutton(app.UIFigure, 'push');
            app.InverseButton.ButtonPushedFcn = createCallbackFcn(app, @InverseButtonPushed, true);
            app.InverseButton.Position = [50 50 100 22];
            app.InverseButton.Text = 'Inverse Kinematics';

            % Create ForwardButton
            app.ForwardButton = uibutton(app.UIFigure, 'push');
            app.ForwardButton.ButtonPushedFcn = createCallbackFcn(app, @ForwardButtonPushed, true);
            app.ForwardButton.Position = [250 50 100 22];
            app.ForwardButton.Text = 'Forward Kinematics';

            % Create XEditFieldLabel
            app.XEditFieldLabel = uilabel(app.UIFigure);
            app.XEditFieldLabel.HorizontalAlignment = 'right';
            app.XEditFieldLabel.Position = [30 230 25 22];
            app.XEditFieldLabel.Text = 'X';

            % Create XEditField
            app.XEditField = uieditfield(app.UIFigure, 'numeric');
            app.XEditField.Position = [70 230 100 22];

            % Create YEditFieldLabel
            app.YEditFieldLabel = uilabel(app.UIFigure);
            app.YEditFieldLabel.HorizontalAlignment = 'right';
            app.YEditFieldLabel.Position = [30 190 25 22];
            app.YEditFieldLabel.Text = 'Y';

            % Create YEditField
            app.YEditField = uieditfield(app.UIFigure, 'numeric');
            app.YEditField.Position = [70 190 100 22];

            % Create ZEditFieldLabel
            app.ZEditFieldLabel = uilabel(app.UIFigure);
            app.ZEditFieldLabel.HorizontalAlignment = 'right';
            app.ZEditFieldLabel.Position = [30 150 25 22];
            app.ZEditFieldLabel.Text = 'Z';

            % Create ZEditField
            app.ZEditField = uieditfield(app.UIFigure, 'numeric');
            app.ZEditField.Position = [70 150 100 22];

            % Create Theta1EditFieldLabel
            app.Theta1EditFieldLabel = uilabel(app.UIFigure);
            app.Theta1EditFieldLabel.HorizontalAlignment = 'right';
            app.Theta1EditFieldLabel.Position = [220 230 45 22];
            app.Theta1EditFieldLabel.Text = 'Theta1';

            % Create Theta1EditField
            app.Theta1EditField = uieditfield(app.UIFigure, 'numeric');
            app.Theta1EditField.Position = [280 230 100 22];

            % Create Theta2EditFieldLabel
            app.Theta2EditFieldLabel = uilabel(app.UIFigure);
            app.Theta2EditFieldLabel.HorizontalAlignment = 'right';
            app.Theta2EditFieldLabel.Position = [220 190 45 22];
            app.Theta2EditFieldLabel.Text = 'Theta2';

            % Create Theta2EditField
            app.Theta2EditField = uieditfield(app.UIFigure, 'numeric');
            app.Theta2EditField.Position = [280 190 100 22];

            % Create Theta3EditFieldLabel
            app.Theta3EditFieldLabel = uilabel(app.UIFigure);
            app.Theta3EditFieldLabel.HorizontalAlignment = 'right';
            app.Theta3EditFieldLabel.Position = [220 150 45 22];
            app.Theta3EditFieldLabel.Text = 'Theta3';

            % Create Theta3EditField
            app.Theta3EditField = uieditfield(app.UIFigure, 'numeric');
            app.Theta3EditField.Position = [280 150 100 22];
        end
    end

    % App initialization and construction
    methods (Access = public)

        % Construct app
        function app = gui

            % Create and configure components
            createComponents(app)

            % Set the block paths
            app.InverseBlockPath = 'Robot_Drive/Position_Input';
            app.ForwardBlockPath = 'Robot_Drive/Angle_Input';

            % Open the model
            open_system('Robot_Drive');

            % Start the simulation
            set_param('Robot_Drive', 'SimulationCommand', 'start');

            % Create a timer for real-time updates
            app.Timer = timer('ExecutionMode', 'fixedRate', 'Period', 0.1, ...
                              'TimerFcn', @(~,~) app.TimerCallback);

            % Start the timer
            start(app.Timer);
        end

        % Code that executes before app deletion
        function delete(app)
            % Stop the simulation
            set_param('Robot_Drive', 'SimulationCommand', 'stop');

            % Stop and delete the timer
            stop(app.Timer);
            delete(app.Timer);
        end
    end
end
