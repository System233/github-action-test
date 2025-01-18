FROM ghcr.io/catthehacker/ubuntu:runner-24.04
RUN dpkg -l | grep libc6
RUN sudo apt install -y apt-transport-https ca-certificates curl gpg
RUN sudo mkdir -p /etc/apt/keyrings/
RUN curl -fsSL https://download.opensuse.org/repositories/home:/kamiyadm/xUbuntu_24.04/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/linglong-apt-keyring.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/linglong-apt-keyring.gpg] https://download.opensuse.org/repositories/home:/kamiyadm/xUbuntu_24.04/ ./" | sudo tee /etc/apt/sources.list.d/linglong.list
RUN sudo apt update
RUN sudo apt install linglong-builder linglong-box linglong-bin xdg-utils -yf
RUN (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y