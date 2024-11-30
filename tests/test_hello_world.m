% tests/test_hello_world.m: Tests for the hello_world function.

classdef test_hello_world < matlab.unittest.TestCase

    methods (Test)
        function testOutput(testCase)
            % Test if hello_world returns the correct output
            expectedOutput = "Hello, World!";
            actualOutput = hello_world();
            testCase.verifyEqual(actualOutput, expectedOutput);
        end
    end
end
