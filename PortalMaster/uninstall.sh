#!/usr/bin/env bash
# PortalMaster — Script de desinstalação
# Remove o PortalMaster do sistema

set -euo pipefail

APP="PortalMaster"
SCRIPT_NAME="portalmaster"
INSTALL_DIR="$HOME/.local/bin"
APPS_DIR="$HOME/.local/share/applications"
ICONS_DIR="$HOME/.local/share/icons/hicolor/512x512/apps"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[AVISO]${NC} $1"; }
log_error() { echo -e "${RED}[ERRO]${NC} $1"; }

main() {
    echo ""
    log_info "Desinstalando $APP..."
    echo ""
    
    # Remove o script
    if [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
        rm "$INSTALL_DIR/$SCRIPT_NAME"
        log_info "Script removido: $INSTALL_DIR/$SCRIPT_NAME"
    else
        log_warn "Script não encontrado: $INSTALL_DIR/$SCRIPT_NAME"
    fi
    
    # Remove o arquivo .desktop
    if [ -f "$APPS_DIR/$APP.desktop" ]; then
        rm "$APPS_DIR/$APP.desktop"
        log_info "Arquivo .desktop removido: $APPS_DIR/$APP.desktop"
    else
        log_warn "Arquivo .desktop não encontrado: $APPS_DIR/$APP.desktop"
    fi
    
    # Remove o ícone
    if [ -f "$ICONS_DIR/$APP.png" ]; then
        rm "$ICONS_DIR/$APP.png"
        log_info "Ícone removido: $ICONS_DIR/$APP.png"
    else
        log_warn "Ícone não encontrado: $ICONS_DIR/$APP.png"
    fi
    
    # Atualiza o banco de dados de aplicações
    if command -v update-desktop-database &> /dev/null; then
        update-desktop-database "$APPS_DIR" 2>/dev/null || true
    fi
    
    # Atualiza o cache de ícones
    if command -v gtk-update-icon-cache &> /dev/null; then
        gtk-update-icon-cache -f "$HOME/.local/share/icons/hicolor" 2>/dev/null || true
    fi
    
    echo ""
    log_info "$APP desinstalado com sucesso!"
    echo ""
    log_warn "Os dados em ~/.local/share/portalmaster não foram removidos."
    log_warn "Para remover completamente, execute:"
    log_warn "  rm -rf ~/.local/share/portalmaster"
    echo ""
}

main "$@"