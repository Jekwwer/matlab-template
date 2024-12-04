% tests/test_hello_world.m: Tests for the hello_world function.

classdef test_hello_world < matlab.unittest.TestCase

    methods (TestMethodSetup)
        function addSrcToPath(~)
            % Add the src directory to the path dynamically
            srcDir = fullfile(fileparts(mfilename('fullpath')), '..', 'src');
            addpath(srcDir);
        end
    end

    methods (TestMethodTeardown)
        function removeSrcFromPath(~)
            % Remove the src directory from the path after tests
            srcDir = fullfile(fileparts(mfilename('fullpath')), '..', 'src');
            rmpath(srcDir);
        end
    end

    methods (Test)
        function testOutput(testCase)
            % Test if hello_world returns the correct output
            expectedOutput = "Hello, World!";
            actualOutput = hello_world();
            testCase.verifyEqual(actualOutput, expectedOutput);
        end
    end
end
