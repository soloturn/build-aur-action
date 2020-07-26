FROM archlinux:latest AS arch
RUN pacman -Syu base-devel git --noconfirm && sed -i '/E_ROOT/d' /usr/bin/makepkg
RUN useradd -m -G wheel -s /bin/bash build
RUN perl -i -pe 's/# (%wheel ALL=\(ALL\) NOPASSWD: ALL)/$1/' /etc/sudoers
USER build
RUN cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
USER root
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

