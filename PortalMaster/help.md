# PortalMaster

Gerador de QR Code gratuito, sem contas, sem pagamentos e sem internet — tudo local.

## Porquê este script?

Os geradores de QR Code online pediam conta, tinham limites e alguns até eram pagos.
Então criei o **PortalMaster**: um gerador totalmente grátis que funciona 100% offline.

## Funcionalidades

- Conteúdo livre: texto ou URL
- Formatos de saída: PNG, JPG, BMP e ICO
- Tamanho em px (exato) ou escala de módulos
- Margem (quiet zone) ajustável com valor visível
- Nível de correção de erro: L, M, Q, H (dica: usa H com logo)
- Cores personalizáveis (QR e fundo) com seletor de cor
- Fundo transparente (PNG)
- Logo no centro (recorte circular com fundo branco)
- Preview ao vivo, redimensionável, com barra de estado (tamanho real)
- Histórico de gerações: janela própria dentro da app
  (ficheiro: `~/.local/share/portalmaster/historia.log`)
- Atalhos: **Ctrl+S** salvar • **Ctrl+N** novo • **Esc** sair
- Botão **Novo** para gerar outro QR rapidamente
- Proteções: pergunta antes de sobrescrever um ficheiro existente
  e mostra erro amigável se o conteúdo for demasiado longo
- Tooltips explicativos em cada opção
- Interface 100% em português, com tema visual e ícone próprios

## Dependências

### Linux (Ubuntu/Debian)

```bash
# Python3 e dependências básicas
sudo apt update
sudo apt install python3 python3-pip python3-tk

# Dependências Python
pip3 install qrcode[pil] Pillow
```

### Linux (Arch/Manjaro)

```bash
# Python3 e dependências básicas
sudo pacman -S python python-pip tk

# Dependências Python
pip3 install qrcode[pil] Pillow
```

### Linux (Fedora)

```bash
# Python3 e dependências básicas
sudo dnf install python3 python3-pip tkinter

# Dependências Python
pip3 install qrcode[pil] Pillow
```

## Instalação

### Instalação Rápida (Recomendado)

1. Clone ou baixe o repositório:
```bash
git clone https://github.com/GeraldoMulopo/Scripts.git
cd Scripts/PortalMaster
```

2. Execute o script de instalação:
```bash
chmod +x install.sh
./install.sh
```

O script de instalação irá:
- Verificar todas as dependências
- Instalar o script em `~/.local/bin/portalmaster`
- Criar o arquivo .desktop para o menu de aplicações
- Configurar o ícone (se disponível)

### Instalação Manual

Se preferir instalar manualmente:

1. Copie o script para o diretório de binários:
```bash
mkdir -p ~/.local/bin
cp portalmaster ~/.local/bin/portalmaster
chmod 755 ~/.local/bin/portalmaster
```

2. Instale o arquivo .desktop:
```bash
mkdir -p ~/.local/share/applications
cp PortalMaster.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications
```

3. (Opcional) Instale o ícone:
```bash
mkdir -p ~/.local/share/icons/hicolor/512x512/apps
cp PortalMaster.png ~/.local/share/icons/hicolor/512x512/apps/
gtk-update-icon-cache -f ~/.local/share/icons/hicolor
```

## Verificação da Instalação

Após instalar, verifique se tudo está correto:

```bash
# Verifique se o script está no caminho correto
which portalmaster

# Execute o script
portalmaster

# Ou procure no menu de aplicações
# Procure por "PortalMaster"
```

## Desinstalação

### Usando o Script de Desinstalação (Recomendado)

```bash
cd Scripts/PortalMaster
chmod +x uninstall.sh
./uninstall.sh
```

### Desinstalação Manual

```bash
# Remova o script
rm ~/.local/bin/portalmaster

# Remova o arquivo .desktop
rm ~/.local/share/applications/PortalMaster.desktop

# Remova o ícone
rm ~/.local/share/icons/hicolor/512x512/apps/PortalMaster.png

# Atualize os caches
update-desktop-database ~/.local/share/applications
gtk-update-icon-cache -f ~/.local/share/icons/hicolor

# (Opcional) Remova os dados
rm -rf ~/.local/share/portalmaster
```

## Uso

Depois de instalado, executa `portalmaster` no terminal
ou procura **PortalMaster** no menu de aplicações.

1. Escreve o conteúdo (texto ou URL)
2. Ajusta formato, tamanho, cores e opções (o preview atualiza ao vivo)
3. Carrega em **Salvar** (ou **Ctrl+S**) — se o ficheiro já existir, pergunta antes de substituir
4. Depois de salvar, podes escolher **abrir a pasta** com o QR
5. Para outro QR, usa **Novo** (ou **Ctrl+N**)
6. O histórico abre com o botão **Histórico** (ou em `~/.local/share/portalmaster/historia.log`)

## Estrutura do ficheiro

- `portalmaster` — script bash que lança a GUI Tk (Python embutido)
- `PortalMaster.desktop` — atalho para o menu de aplicações
- `install.sh` — script de instalação automática
- `uninstall.sh` -- script de desinstalação
- `help.md` — este ficheiro

## Solução de Problemas

### "portalmaster: comando não encontrado"

Verifique se `~/.local/bin` está no seu PATH:
```bash
echo $PATH | grep -q "$HOME/.local/bin" && echo "PATH OK" || echo "PATH não contém ~/.local/bin"
```

Se não estiver, adicione ao seu `~/.bashrc`:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

### "Tkinter não encontrado"

Instale o pacote tkinter:
```bash
# Ubuntu/Debian
sudo apt install python3-tk

# Arch
sudo pacman -S tk

# Fedora
sudo dnf install tkinter
```

### "Módulos Python não encontrados"

Instale as dependências Python:
```bash
pip3 install qrcode[pil] Pillow
```

### Ícone não aparece no menu

1. Verifique se o ícone está no local correto:
```bash
ls -la ~/.local/share/icons/hicolor/512x512/apps/PortalMaster.png
```

2. Atualize o cache de ícones:
```bash
gtk-update-icon-cache -f ~/.local/share/icons/hicolor
```

## Licença

Uso livre. Criado para nunca mais precisar de um gerador online.