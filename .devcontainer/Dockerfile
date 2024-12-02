# .devcontainer/Dockerfile: Sets up the development container for the project.

# Base image
FROM mathworks/matlab-deps:R2024b

# Set environment variable to non-interactive mode for apt-get installations
ENV DEBIAN_FRONTEND=noninteractive

ARG HADOLINT_VERSION=v2.12.0
ARG MATLAB_RELEASE=R2024b
ARG MATLAB_INSTALL_LOCATION="/opt/matlab/${MATLAB_RELEASE}"
ARG MATLAB_PRODUCT_LIST="MATLAB Symbolic_Math_Toolbox"

ARG WGET_VERSION=1.21.2-2ubuntu1.1
ARG CA_CERTIFICATES_VERSION=20240203~22.04.1
ARG GIT_VERSION=1:2.34.1-1ubuntu1.11
ARG PYTHON3_VERSION=3.10.6-1~22.04.1
ARG PYTHON3_PIP_VERSION=22.0.2+dfsg-1ubuntu0.5
ARG XVFB_VERSION=2:21.1.4-2ubuntu1.7~22.04.12

ARG MATLAB_PROXY_VERSION=0.23.1

# Install all dependencies, MATLAB, and matlab-proxy
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget=${WGET_VERSION} \
    ca-certificates=${CA_CERTIFICATES_VERSION} \
    git=${GIT_VERSION} \
    python3=${PYTHON3_VERSION} \
    python3-pip=${PYTHON3_PIP_VERSION} \
    xvfb=${XVFB_VERSION} && \
    wget -q https://www.mathworks.com/mpm/glnxa64/mpm && chmod +x mpm && \
    ./mpm install --release=${MATLAB_RELEASE} \
    --destination=${MATLAB_INSTALL_LOCATION} \
    --products=${MATLAB_PRODUCT_LIST} && \
    ln -s ${MATLAB_INSTALL_LOCATION}/bin/matlab /usr/local/bin/matlab && \
    python3 -m pip install --no-cache-dir matlab-proxy==${MATLAB_PROXY_VERSION} && \
    rm -rf mpm /tmp/mathworks_root.log /var/lib/apt/lists/*

# Install additional packages and Hadolint
RUN wget --progress=dot:giga -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64 && \
    chmod +x /usr/local/bin/hadolint

# Set environment variables for MATLAB Proxy
ENV MWI_APP_PORT=8000

# Expose necessary ports (8000 for MATLAB Proxy)
EXPOSE 8000
