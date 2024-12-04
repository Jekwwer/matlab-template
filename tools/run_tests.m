% tools/run_tests.m: Runs MATLAB Unit Tests using runtests.

% Define the test folder
scriptDir = fileparts(mfilename('fullpath')); % Get the directory of this script
projectRoot = fullfile(scriptDir, '..');      % Navigate to the project root
testFolder = fullfile(projectRoot, 'tests');  % Full path to the tests folder

% Check if the test folder exists
if ~isfolder(testFolder)
    error('Test folder not found: %s', testFolder);
end

% Run the tests
fprintf('Running tests from folder: %s\n', testFolder);
results = runtests(testFolder, 'IncludeSubfolders', true, 'OutputDetail', 1);

disp(results);

% Display summary of test results
if all([results.Passed])
    fprintf('\nAll tests passed successfully.\n');
else
    fprintf('\nSome tests failed. See the detailed results above.\n');
end
