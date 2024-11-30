# .devcontainer/Dockerfile: Sets up the development container for the project.

# Base image
FROM mathworks/matlab-deps:R2024b

# Set environment variable to non-interactive mode for apt-get installations
ENV DEBIAN_FRONTEND=noninteractive

ARG HADOLINT_VERSION=v2.12.0
ARG MATLAB_RELEASE=R2024b
ARG MATLAB_INSTALL_LOCATION="/opt/matlab/${MATLAB_RELEASE}"
ARG MATLAB_PRODUCT_LIST="MATLAB Symbolic_Math_Toolbox"

# Install all dependencies, MATLAB, and matlab-proxy
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    git \
    python3 \
    python3-pip \
    python3-venv \
    xvfb && \
    wget -q https://www.mathworks.com/mpm/glnxa64/mpm && chmod +x mpm && \
    ./mpm install --release=${MATLAB_RELEASE} \
    --destination=${MATLAB_INSTALL_LOCATION} \
    --products=${MATLAB_PRODUCT_LIST} && \
    ln -s ${MATLAB_INSTALL_LOCATION}/bin/matlab /usr/local/bin/matlab && \
    python3 -m pip install --upgrade matlab-proxy && \
    rm -rf mpm /tmp/mathworks_root.log /var/lib/apt/lists/*

# Install additional packages and Hadolint
RUN wget --progress=dot:giga -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64 && \
    chmod +x /usr/local/bin/hadolint

# Set up a virtual environment specifically for pre-commit
RUN python3 -m venv /opt/precommit-env && \
    /opt/precommit-env/bin/pip install --upgrade pip && \
    /opt/precommit-env/bin/pip install pre-commit

# Set environment variables for MATLAB Proxy
ENV MWI_APP_PORT=8000

# Expose necessary ports (8000 for MATLAB Proxy)
EXPOSE 8000
