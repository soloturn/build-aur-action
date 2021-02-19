FROM archlinux:latest AS arch
RUN pacman -Syu base-devel git --noconfirm --overwrite '*' && sed -i '/E_ROOT/d' /usr/bin/makepkg
RUN useradd -m -G wheel -s /bin/bash build
RUN perl -i -pe 's/# (%wheel ALL=\(ALL\) NOPASSWD: ALL)/$1/' /etc/sudoers
USER build
#RUN cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
# https://bbs.archlinux.org/viewtopic.php?id=229027, eli schwartz
RUN cd /tmp && git clone https://aur.archlinux.org/paru.git
RUN cd paru && source PKGBUILD && pacman -Syu --noconfirm && pacman -S --noconfirm --needed --asdeps "${makedepends[@]}" "${depends[@]}"

USER root
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

