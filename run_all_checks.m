% run_all_checks.m: Runs all checks - linting, formatting, testing, and code coverage.

% Get the directory of this script
scriptDir = fileparts(mfilename('fullpath'));
toolsDir = fullfile(scriptDir, 'tools'); % Path to the tools folder

% Add the tools folder to the MATLAB path
if ~isfolder(toolsDir)
    error('Tools folder not found: %s', toolsDir);
end
addpath(toolsDir);

% Function to print section headers
printHeader = @(stepName) fprintf('\n========== %s ==========\n', upper(stepName));

% Initialize step results
stepResults = {};

% 1. Linting
printHeader('Linting');
try
    lint_code; % Call the lint_code script
    printResult('Linting', true, '');
    stepResults = [stepResults; {'Linting', true}];
catch ME
    printResult('Linting', false, ME.message);
    stepResults = [stepResults; {'Linting', false}];
end

% 2. Formatting
printHeader('Formatting');
try
    format_code; % Call the format_code script
    printResult('Formatting', true, '');
    stepResults = [stepResults; {'Formatting', true}];
catch ME
    printResult('Formatting', false, ME.message);
    stepResults = [stepResults; {'Formatting', false}];
end

% 3. Unit Testing
printHeader('Unit Testing');
try
    run_tests; % Call the run_tests script
    printResult('Unit Testing', true, '');
    stepResults = [stepResults; {'Unit Testing', true}];
catch ME
    printResult('Unit Testing', false, ME.message);
    stepResults = [stepResults; {'Unit Testing', false}];
end

% 4. Code Coverage
printHeader('Code Coverage');
try
    run_tests_with_coverage;
    printResult('Code Coverage', true, '');
    stepResults = [stepResults; {'Code Coverage', true}];
catch ME
    printResult('Code Coverage', false, ME.message);
    stepResults = [stepResults; {'Code Coverage', false}];
end

% Final Summary
fprintf('\n========== CHECK SUMMARY ==========\n');
for i = 1:size(stepResults, 1)
    if stepResults{i, 2}
        fprintf('%s: SUCCESS\n', stepResults{i, 1});
    else
        fprintf('%s: FAILED\n', stepResults{i, 1});
    end
end

if all(cell2mat(stepResults(:, 2)))
    fprintf('\nAll checks completed successfully.\n');
else
    fprintf('\nSome checks failed. Please review the logs above.\n');
end

% Helper function: Print result of a step
function printResult(stepName, success, message)
    if success
        fprintf('%s: SUCCESS\n\n', stepName);
    else
        fprintf('%s: FAILED - %s\n\n', stepName, message);
    end
end
