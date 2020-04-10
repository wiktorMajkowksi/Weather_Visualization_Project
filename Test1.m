classdef Test1 < matlab.unittest.TestCase
    %UNTITLED11 Summary of this class goes here
    %   Detailed explanation goes here
    methods (Test)
        function check_ncfiles(testCase)
            expect = dir('*.nc').name;
            actSolution = 'o3_surface_20180701000000.nc';
            testCase.assumeSubstring(actSolution,expect,'.nc');
        end
        function check_csvfiles(testCase)
            directory = dir('*.csv');
            for i=1 : size(directory)
                actSolution = directory(i).name;
                testCase.assumeNotEmpty(actSolution);
            end
        end
        function check_howmanyCSVs(testCase)
            actSolution = dir('24HR_CBE_*.csv');
            testCase.verifyNumElements(actSolution,25);
        end
        function check_Gui_loads(testCase)
            actSolution = gui;
            testCase.verifyClass(actSolution, 'matlab.ui.Figure');
            close(gui);
        end
%         function check_data_extraction(testCase)
%             testCase.
%         end
    end
end
