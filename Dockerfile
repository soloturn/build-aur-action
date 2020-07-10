FROM archlinux:latest AS arch
RUN pacman -Syu base-devel git --noconfirm && sed -i '/E_ROOT/d' /usr/bin/makepkg
RUN mv /usr/include/bits/stdlib.h /tmp
RUN perl -n -i -e 'print unless m-bits/stdlib.h-' /usr/include/stdlib.h
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

