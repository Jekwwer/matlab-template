% tools/run_tests_with_coverage.m: Runs MATLAB Unit Tests with Code Coverage.

% Define paths
scriptDir = fileparts(mfilename('fullpath')); % Directory of this script
projectRoot = fullfile(scriptDir, '..');      % Project root
testFolder = fullfile(projectRoot, 'tests');  % Full path to the tests folder
srcFolder = fullfile(projectRoot, 'src');     % Full path to the source folder
coverageReportFile = fullfile(testFolder, 'coverage_report.xml'); % Coverage report file

% Check if test and source folders exist
if ~isfolder(testFolder)
    error('Test folder not found: %s', testFolder);
end
if ~isfolder(srcFolder)
    error('Source folder not found: %s', srcFolder);
end

% Create a test suite from the test folder
suite = matlab.unittest.TestSuite.fromFolder(testFolder, 'IncludeSubfolders', true);

% Create a TestRunner with text output
runner = matlab.unittest.TestRunner.withTextOutput('OutputDetail', 1);

% Add code coverage plugin with Cobertura report
runner.addPlugin(matlab.unittest.plugins.CodeCoveragePlugin.forFolder(srcFolder, ...
    'Producing', matlab.unittest.plugins.codecoverage.CoberturaFormat(coverageReportFile)));

fprintf('Running tests with code coverage from folder: %s\n', testFolder);
results = runner.run(suite);
disp(results);

if all([results.Passed])
    fprintf('\nAll tests passed successfully.\n');
else
    fprintf('\nSome tests failed. See the detailed results above.\n');
end

% Resolve the absolute path of the coverage report
absoluteCoverageReportFile = fullfile(pwd, coverageReportFile);
fprintf('\nCode coverage report generated at: %s\n', coverageReportFile);
