#!/bin/bash
# ==============================================================================
# Oxy OS - Scripts de Automação
# Copyright (c) 2026 Gabriel (Oxy OS)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ==============================================================================
# Automações de Desenvolvimento do Oxys OS
oxys-enter() {
    echo "==== Montando partições virtuais e entrando no Chroot ===="
    sudo mount --bind /dev oxys-debian-edition/dev
    sudo mount --bind /dev/pts oxys-debian-edition/dev/pts
    sudo mount --bind /proc oxys-debian-edition/proc
    sudo mount --bind /sys oxys-debian-edition/sys
    sudo chroot oxys-debian-edition
}

oxys-exit() {
    echo "==== Desmontando partições do Chroot com segurança ===="
    sudo umount -l oxys-debian-edition/dev/pts 2>/dev/null || true
    sudo umount -l oxys-debian-edition/dev     2>/dev/null || true
    sudo umount -l oxys-debian-edition/proc    2>/dev/null || true
    sudo umount -l oxys-debian-edition/sys     2>/dev/null || true
    echo "Desmontado!"
}

oxys-compiler() {
    echo "==== Iniciando Compilação da ISO do Oxys OS ===="
    # Garante que está tudo desmontado antes de compilar
    sudo umount -l oxys-debian-edition/dev/pts 2>/dev/null || true
    sudo umount -l oxys-debian-edition/dev     2>/dev/null || true
    sudo umount -l oxys-debian-edition/proc    2>/dev/null || true
    sudo umount -l oxys-debian-edition/sys     2>/dev/null || true

    echo "-> Removendo SquashFS antigo..."
    sudo rm -f iso_root/live/filesystem.squashfs

    echo "-> Compactando novo sistema de arquivos (SquashFS)..."
    sudo mksquashfs oxys-debian-edition iso_root/live/filesystem.squashfs -comp xz

    echo "-> Gerando imagem ISO híbrida com GRUB..."
    sudo grub2-mkrescue -o oxys-debian-edition.iso iso_root
    echo "==== Compilação Concluída com Sucesso! ===="
}
# Entrar no chroot do Ox Motchen OS
chain-enter() {
    echo "[$] Montando diretórios e entrando no chroot..."
    sudo mount --bind /dev /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot/dev
    sudo mount --bind /dev/pts /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot/dev/pts
    sudo mount --bind /proc /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot/proc
    sudo mount --bind /sys /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot/sys
    sudo cp /etc/resolv.conf /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot/etc/resolv.conf

    sudo chroot /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot /bin/bash
}

# Sair e desmontar tudo com segurança
chain-exit() {
    echo "[$] Desmontando diretórios do chroot com segurança..."
    sudo umount /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot/dev/pts
    sudo umount /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot/dev
    sudo umount /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot/proc
    sudo umount /home/gbriel/Documentos/b18-source-code/buildyeahtwo/chroot/sys
    echo "[$] Tudo pronto e limpo!"
}

