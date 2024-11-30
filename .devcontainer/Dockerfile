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
    apt-get install --no-install-recommends --yes \
    wget \
    ca-certificates \
    git \
    python3 \
    python3-pip \
    xvfb && \
    wget -q https://www.mathworks.com/mpm/glnxa64/mpm && chmod +x mpm && \
    ./mpm install --release=${MATLAB_RELEASE} \
    --destination=${MATLAB_INSTALL_LOCATION} \
    --products=${MATLAB_PRODUCT_LIST} && \
    ln -s ${MATLAB_INSTALL_LOCATION}/bin/matlab /usr/local/bin/matlab && \
    python3 -m pip install --upgrade matlab-proxy && \
    rm -rf mpm /tmp/mathworks_root.log /var/lib/apt/lists/*

# Set environment variables for MATLAB Proxy
ENV MWI_APP_PORT=8000

# Expose necessary ports (8000 for MATLAB Proxy)
EXPOSE 8000
