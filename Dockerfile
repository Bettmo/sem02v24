FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update \
&& apt-get dist-upgrade -y \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& apt-get install -y \
sudo \
nano \
wget \
curl \
git \
build-essential \
gcc \
openjdk-21-jdk \
mono-complete \
python3 \
strace \
valgrind \
openssl #

# Create a new user with sudo privileges. Replace BRUKER and PASSWD with actual values.
# Note: Storing passwords in Dockerfiles is not recommended for production environments.
# Consider using Docker secrets or another secure mechanism for managing sensitive data.
RUN useradd -G sudo -m -d /home/Bettmo -s /bin/bash -p "$(openssl passwd -1 mysupersecretpassword)" Bettmo

# Switch to the newly created user
USER Bettmo
WORKDIR /home/Bettmo

# Download and set permissions for a script
RUN mkdir hacking \
    && cd hacking \
    && curl -SL https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v2/pawned.sh > pawned.sh \
    && chmod 764 pawned.sh \
    && cd ..

# Set up Git configuration. Replace placeholders with actual values.
RUN git config --global user.email "ericbbettmo@gmail.com" \
    && git config --global user.name "Eric Bettmo" \
    && git config --global url."https://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:@github.com/".insteadOf "https://github.com" \
    && mkdir -p github.com/Bettmo

# Switch back to the root user to install Go
USER root

# Download and install Go. Replace OS-ARCH with the actual OS and architecture, e.g., linux-amd64.
# This command might need adjustment based on the OS and architecture of the container.
RUN curl -SL "https://go.dev/dl/go1.21.7.linux-amd64.tar.gz" | tar xvz -C /usr/local

# Add Go to the PATH for all users
USER Bettmo
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/Bettmo/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"


RUN curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf \
| sh -s -- -y
ENV PATH="${PATH}:${HOME}/.cargo/bin"

