% tools/format.m: Formats MATLAB code using the MATLAB Editor API.

% Get the directory of the script itself
scriptDir = fileparts(mfilename('fullpath'));
projectRoot = fullfile(scriptDir, '..');  % Navigate to project root

% Add src, tests, and tools to directories to format
directoriesToFormat = {fullfile(projectRoot, 'src'), ...
                       fullfile(projectRoot, 'tests'), ...
                       fullfile(projectRoot, 'tools')};

for i = 1:length(directoriesToFormat)
    % Check if the directory exists
    if ~isfolder(directoriesToFormat{i})
        fprintf('Directory not found: %s\n', directoriesToFormat{i});
        continue;
    end

    % Get all .m files in the directory
    fileList = dir(fullfile(directoriesToFormat{i}, '*.m'));

    % Run format on each file
    for j = 1:length(fileList)
        fileName = fullfile(fileList(j).folder, fileList(j).name);
        fprintf('Formatting %s\n', fileName);

        try
            % Open and save the file to apply formatting
            editorDoc = matlab.desktop.editor.openDocument(fileName);
            editorDoc.save();
            editorDoc.close();
            fprintf('Formatted %s\n', fileName);
        catch ME
            fprintf('Failed to format %s: %s\n', fileName, ME.message);
        end
    end
end
