# MATLAB Template

This repository provides a streamlined template for MATLAB development using GitHub Codespaces.

## Usage

This repository is designed for use with GitHub Codespaces to streamline MATLAB development.

### Prerequisites

- Ensure you have access to GitHub Codespaces and a valid MATLAB license.
- MATLAB installation is managed within the Codespaces environment via the provided Dockerfile and devcontainer.

> This repository is configured for MATLAB usage via online sign-in only. It does not include a MATLAB license but can be configured to use a license server or a license file. Since the author does not have access to these, the current setup is designed for GUI-based MATLAB access only. Adding your own license or connecting to a license server will enable CLI access.

### Getting Started

1. **Open in GitHub Codespaces**:

   - Navigate to your repository on GitHub.
   - Click the **Code** button and select **Codespaces**.
   - Launch a new Codespace or resume an existing one.

2. **Start the MATLAB Environment**:

   - The `devcontainer` will initialize the environment with necessary tools and configurations.
   - Run the following command to start a development server or process:

     ```bash
     make serve
     ```

3. **Access MATLAB**:
   - Open `localhost:8000` in your browser and follow the instructions to authenticate and activate MATLAB.

### Running MATLAB Code

- Place your MATLAB scripts in the `src/` directory.
- Use MATLAB's graphical interface to execute scripts or run tests.

## Tools and Scripts

### Unified Workflow

- **`tools/run_all_checks.m`**: Automates linting, formatting, testing, and coverage reporting in a single command.

### Linting and Formatting

- **`tools/lint_code.m`**: Scans MATLAB files for potential issues using `checkcode`.
- **`tools/format_code.m`**: Ensures consistent coding style by applying MATLAB's built-in formatting.

### Testing

- **`tools/run_tests.m`**: Executes unit tests located in the `tests` folder.
- **`tools/run_tests_with_coverage.m`**: Runs tests and generates a Cobertura-style code coverage report.

## Licensing

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

### MATLAB Licensing

This repository provides tools (e.g., Dockerfile and devcontainer) and code for use with MATLAB. However:

- MATLAB is proprietary software and is **not included in this repository**.
- Users must have their own valid MATLAB license to use this project.
- Refer to [MathWorks Licensing](https://www.mathworks.com/help/install/license-overview.html) for more information.
