FROM ghcr.io/catthehacker/ubuntu:runner-24.04
RUN dpkg -l | grep libc6
RUN sudo apt install -y apt-transport-https ca-certificates curl gpg
RUN sudo mkdir -p /etc/apt/keyrings/
RUN curl -fsSL https://download.opensuse.org/repositories/home:/kamiyadm/xUbuntu_24.04/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/linglong-apt-keyring.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/linglong-apt-keyring.gpg] https://download.opensuse.org/repositories/home:/kamiyadm/xUbuntu_24.04/ ./" | sudo tee /etc/apt/sources.list.d/linglong.list
RUN sudo HTTPS_PROXY=http://192.168.5.1:5809 HTTPS_PROXY=http://192.168.5.1:5809 apt update
RUN sudo HTTPS_PROXY=http://192.168.5.1:5809 HTTPS_PROXY=http://192.168.5.1:5809 apt install linglong-builder linglong-box linglong-bin xdg-utils -yf
