#!/usr/bin/env bash
# PortalMaster — Script de instalação
# Instala o PortalMaster em qualquer sistema Linux

set -euo pipefail

APP="PortalMaster"
SCRIPT_NAME="portalmaster"
WRAPPER_NAME="portalmaster_wrapper"
INSTALL_DIR="$HOME/.local/bin"
APPS_DIR="$HOME/.local/share/applications"
ICONS_DIR="$HOME/.local/share/icons/hicolor/512x512/apps"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$HOME/.venv"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[AVISO]${NC} $1"; }
log_error() { echo -e "${RED}[ERRO]${NC} $1"; }

check_dependencies() {
    log_info "Verificando dependências..."
    
    if ! command -v python3 &> /dev/null; then
        log_error "Python3 não encontrado. Instale: sudo apt install python3"
        exit 1
    fi
    
    if ! python3 -c "import tkinter" &> /dev/null; then
        log_error "Tkinter não encontrado. Instale: sudo apt install python3-tk"
        exit 1
    fi
    
    log_info "Dependências verificadas com sucesso!"
}

create_venv() {
    log_info "Configurando ambiente virtual..."
    
    if [ ! -d "$VENV_DIR" ]; then
        log_info "Criando ambiente virtual..."
        python3 -m venv "$VENV_DIR"
    fi
    
    log_info "Instalando dependências Python..."
    "$VENV_DIR/bin/pip" install --upgrade pip
    "$VENV_DIR/bin/pip" install qrcode[pil] Pillow
    
    log_info "Ambiente virtual configurado com sucesso!"
}

install_script() {
    log_info "Instalando script..."
    
    mkdir -p "$INSTALL_DIR"
    
    # Copia o script principal
    cp "$SCRIPT_DIR/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
    chmod 755 "$INSTALL_DIR/$SCRIPT_NAME"
    
    # Copia o wrapper
    cp "$SCRIPT_DIR/$WRAPPER_NAME" "$INSTALL_DIR/$WRAPPER_NAME"
    chmod 755 "$INSTALL_DIR/$WRAPPER_NAME"
    
    # Cria um symlink para o wrapper
    ln -sf "$INSTALL_DIR/$WRAPPER_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
    
    log_info "Script instalado em: $INSTALL_DIR/$SCRIPT_NAME"
}

install_desktop_file() {
    log_info "Instalando arquivo .desktop..."
    
    mkdir -p "$APPS_DIR"
    
    # Cria o arquivo .desktop com o caminho correto
    cat > "$APPS_DIR/$APP.desktop" << EOF
[Desktop Entry]
Type=Application
Name=$APP
Comment=Gerador de QR Code
Exec=$INSTALL_DIR/$WRAPPER_NAME
Icon=$APP
Terminal=false
Categories=Graphics;Utility;
StartupNotify=true
EOF
    
    chmod 644 "$APPS_DIR/$APP.desktop"
    
    # Atualiza o banco de dados de aplicações
    if command -v update-desktop-database &> /dev/null; then
        update-desktop-database "$APPS_DIR" 2>/dev/null || true
    fi
    
    log_info "Arquivo .desktop instalado em: $APPS_DIR/$APP.desktop"
}

install_icon() {
    log_info "Verificando ícone..."
    
    # Verifica se existe um ícone para instalar
    if [ -f "$SCRIPT_DIR/$APP.png" ]; then
        mkdir -p "$ICONS_DIR"
        cp "$SCRIPT_DIR/$APP.png" "$ICONS_DIR/$APP.png"
        chmod 644 "$ICONS_DIR/$APP.png"
        
        # Atualiza o cache de ícones
        if command -v gtk-update-icon-cache &> /dev/null; then
            gtk-update-icon-cache -f "$HOME/.local/share/icons/hicolor" 2>/dev/null || true
        fi
        
        log_info "Ícone instalado em: $ICONS_DIR/$APP.png"
    else
        log_warn "Ícone não encontrado. Você pode adicionar manualmente:"
        log_warn "  Copie um PNG 512x512 para: $ICONS_DIR/$APP.png"
    fi
}

create_directories() {
    log_info "Criando diretórios necessários..."
    
    mkdir -p "$HOME/.local/share/portalmaster"
    
    log_info "Diretórios criados"
}

print_usage() {
    echo ""
    echo "Uso: $0 [opções]"
    echo ""
    echo "Opções:"
    echo "  --help, -h     Mostra esta ajuda"
    echo "  --uninstall    Desinstala o PortalMaster"
    echo "  --check        Verifica dependências"
    echo ""
    echo "Exemplos:"
    echo "  $0              # Instala o PortalMaster"
    echo "  $0 --uninstall  # Desinstala o PortalMaster"
    echo "  $0 --check      # Verifica dependências"
    echo ""
}

uninstall() {
    log_info "Desinstalando $APP..."
    
    # Remove o script
    if [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
        rm "$INSTALL_DIR/$SCRIPT_NAME"
        log_info "Script removido: $INSTALL_DIR/$SCRIPT_NAME"
    fi
    
    # Remove o wrapper
    if [ -f "$INSTALL_DIR/$WRAPPER_NAME" ]; then
        rm "$INSTALL_DIR/$WRAPPER_NAME"
        log_info "Wrapper removido: $INSTALL_DIR/$WRAPPER_NAME"
    fi
    
    # Remove o arquivo .desktop
    if [ -f "$APPS_DIR/$APP.desktop" ]; then
        rm "$APPS_DIR/$APP.desktop"
        log_info "Arquivo .desktop removido: $APPS_DIR/$APP.desktop"
    fi
    
    # Remove o ícone
    if [ -f "$ICONS_DIR/$APP.png" ]; then
        rm "$ICONS_DIR/$APP.png"
        log_info "Ícone removido: $ICONS_DIR/$APP.png"
    fi
    
    # Atualiza o banco de dados de aplicações
    if command -v update-desktop-database &> /dev/null; then
        update-desktop-database "$APPS_DIR" 2>/dev/null || true
    fi
    
    # Atualiza o cache de ícones
    if command -v gtk-update-icon-cache &> /dev/null; then
        gtk-update-icon-cache -f "$HOME/.local/share/icons/hicolor" 2>/dev/null || true
    fi
    
    log_info "$APP desinstalado com sucesso!"
    log_warn "Os dados em ~/.local/share/portalmaster não foram removidos."
    log_warn "Para remover completamente, delete: rm -rf ~/.local/share/portalmaster"
    log_warn "Para remover o ambiente virtual, delete: rm -rf ~/.venv"
}

main() {
    case "${1:-}" in
        --help|-h)
            print_usage
            exit 0
            ;;
        --uninstall)
            uninstall
            exit 0
            ;;
        --check)
            check_dependencies
            exit 0
            ;;
        "")
            check_dependencies
            create_venv
            create_directories
            install_script
            install_desktop_file
            install_icon
            echo ""
            log_info "Instalação concluída!"
            log_info "Execute: $INSTALL_DIR/$SCRIPT_NAME"
            log_info "Ou procure $APP no menu de aplicações"
            ;;
        *)
            log_error "Opção desconhecida: $1"
            print_usage
            exit 1
            ;;
    esac
}

main "$@"