FROM skrallex/latexdevcontainer
ARG REMOTE_USER=vscode

# Install base dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        sudo \
        git \
        libfontconfig

# Install desired LaTex packages
RUN tlmgr update --self && \
    tlmgr install parskip etoolbox fontspec moresize

# Add a remote user for vscode so that VSCode can map the UID/GID to match your local user's
# this prevents permission issues when saving files. Ensure this use has sudo permissions
RUN groupadd latex \
    && useradd -ms /bin/zsh ${REMOTE_USER} \
    && usermod -aG sudo,latex ${REMOTE_USER} \
    && echo "${REMOTE_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && cp -R /root/.zshrc /root/.welcome.sh /root/.oh-my-zsh /root/.p10k.zsh /root/.zshrc-specific /home/${REMOTE_USER}/ \
    && sed -i "s/ZSH=\/root\//ZSH=\/home\/${REMOTE_USER}\//g" /home/${REMOTE_USER}/.zshrc \
    && chown -R ${REMOTE_USER}:${REMOTE_USER} /home/${REMOTE_USER} \
    && chmod -R +x /usr/local/bin
    # && chgrp -R latex /usr/local/texlive \
    # && chmod -R g+wrx /usr/local/texlive

USER ${REMOTE_USER}
