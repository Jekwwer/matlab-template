# Makefile: Automates common tasks for MATLAB project development and testing.

# Run the MATLAB proxy app.
serve:
	env MWI_ENABLE_TOKEN_AUTH=False matlab-proxy-app
