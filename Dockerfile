FROM samtebbs33/zig:0.9.1-x86_64

RUN apk update && \
    apk add xorriso grub qemu qemu-system-i386

RUN echo "export PATH=\"/deps/local/bin/zig:$PATH\"" >> /root/.profile
