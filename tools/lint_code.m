% tools/lint_code.m: Lints MATLAB code using checkcode.

% Get the directory of the script itself
scriptDir = fileparts(mfilename('fullpath'));
projectRoot = fullfile(scriptDir, '..');  % Navigate to project root

% Add src, tests, and tools to directories to lint
directoriesToLint = {fullfile(projectRoot, 'src'), ...
                     fullfile(projectRoot, 'tests'), ...
                     fullfile(projectRoot, 'tools')};

% Loop through each directory and lint the MATLAB files
for i = 1:length(directoriesToLint)
    % Check if the directory exists
    if ~isfolder(directoriesToLint{i})
        fprintf('Directory not found: %s\n', directoriesToLint{i});
        continue;
    end

    % Get all .m files in the directory
    fileList = dir(fullfile(directoriesToLint{i}, '*.m'));

    for j = 1:length(fileList)
        % Construct the full path to the file
        fileName = fullfile(fileList(j).folder, fileList(j).name);
        fprintf('Running checkcode on %s\n', fileName);

        % Run checkcode and capture the results
        issues = checkcode(fileName);

        if isempty(issues)
            fprintf('No issues found in %s\n', fileName);
        else
            fprintf('Issues found in %s:\n', fileName);
            for k = 1:length(issues)
                fprintf('  Line %d, Column %d: %s\n', ...
                    issues(k).line, issues(k).column, issues(k).message);
                if ~isempty(issues(k).fix)
                    fprintf('    Suggested fix: %s\n', issues(k).fix);
                end
            end
        end
    end
end
