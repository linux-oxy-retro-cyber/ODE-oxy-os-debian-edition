# Módulo de Automações — Oxy OS

Este diretório contém os scripts de automação do **Oxy OS**, desenvolvidos para simplificar e automatizar o ciclo de vida de construção e manutenção da distribuição.

## 🛠️ Funcionalidades dos Scripts

Os scripts inclusos nesta pasta são responsáveis por:
* **Entrar no chroot / ambiente de construção:** Preparação rápida e isolada do sistema base.
* **Montar diretórios virtuais:** Montagem automática de `/dev`, `/proc`, `/sys`, `/dev/pts` e pontos de montagem necessários.
* **Desmontar diretórios virtuais:** Desmontagem segura e limpa de todos os sistemas de arquivos virtuais.
* **Compactar a imagem:** Geração e compressão da imagem do sistema de arquivos (`squashfs`).
* **Gerar a ISO final:** Criação da imagem bootável da distribuição pronta para instalação e testes.

---

## 🧰 Ferramentas Necessárias

Para a execução correta destes scripts, certifique-se de ter as seguintes ferramentas instaladas no sistema host:

* `bash` — Shell padrão de execução.
* `squashfs-tools` — Para a criação da imagem do sistema de arquivos (`mksquashfs`).
* `xorriso` / `genisoimage` — Para a geração da estrutura da ISO bootável.
* `util-linux` — Utilitários de sistema para comandos de montagem e manipulação (`mount`, `umount`).
* `coreutils` — Ferramentas essenciais do sistema GNU/Linux.

---

## 📜 Licença

Este projeto e todos os seus scripts contidos nesta pasta são distribuídos sob a **Licença MIT**.

```text
Copyright (c) 2026 Gabriel (Oxy OS)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
