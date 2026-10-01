#!/usr/bin/env bash
# ==============================================================================
# Lizarbe Dotfiles - Repositorio Paraguas para Omarchy OS
# Orquestador de configuración para usuario general en Omarchy / Arch Linux
# ==============================================================================
set -e

# Reconectar stdin a la terminal si el script se ejecuta mediante tubería (curl ... | bash)
if [ ! -t 0 ] && [ -e /dev/tty ]; then
    exec < /dev/tty
fi

# Colores y formato
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

info() { echo -e "${BLUE}${BOLD}::${NC} $1"; }
success() { echo -e "${GREEN}${BOLD}✔${NC} $1"; }
warn() { echo -e "${YELLOW}${BOLD}⚠${NC} $1"; }
error() { echo -e "${RED}${BOLD}✖${NC} $1"; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || true)"

# Banner de bienvenida
echo -e "${RED}${BOLD}"
cat << 'BANNER'
  ██╗     ██╗███████╗ █████╗ ██████╗ ██████╗ ███████╗
  ██║     ██║╚══███╔╝██╔══██╗██╔══██╗██╔══██╗██╔════╝
  ██║     ██║  ███╔╝ ███████║██████╔╝██████╔╝█████╗  
  ██║     ██║ ███╔╝  ██╔══██║██╔══██╗██╔══██╗██╔══╝  
  ███████╗██║███████╗██║  ██║██║  ██║██████╔╝███████╗
  ╚══════╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝
    Configuración Integral para Omarchy (Hyprland + Suites)
BANNER
echo -e "${NC}"

# Si se ejecuta mediante curl/pipe o fuera de la carpeta del proyecto, clonar en ~/.local/share/Lizarbe-Dotfiles
TARGET_BASE="${XDG_DATA_HOME:-$HOME/.local/share}/Lizarbe-Dotfiles"
if [[ ! -f "$SCRIPT_DIR/install.sh" || ! -d "$SCRIPT_DIR/modules" ]]; then
    info "Descargando repositorio paraguas en $TARGET_BASE..."
    if [[ -d "$TARGET_BASE/.git" ]]; then
        git -C "$TARGET_BASE" pull --recurse-submodules --ff-only || true
    else
        mkdir -p "$(dirname "$TARGET_BASE")"
        git clone --recurse-submodules https://github.com/lizarbe513/Lizarbe-Dotfiles.git "$TARGET_BASE"
    fi
    SCRIPT_DIR="$TARGET_BASE"
fi

# Inicializar y actualizar submódulos si no están descargados
if [[ -d "$SCRIPT_DIR/.git" ]]; then
    info "Verificando submódulos del repositorio paraguas..."
    git -C "$SCRIPT_DIR" submodule update --init --recursive || true
fi

MECA_DIR="$SCRIPT_DIR/modules/meca-hyprconfig"
CONFIG_DIR="$SCRIPT_DIR/modules/lizarbe-omarchy-config"

# Fallback si los submódulos no estuviesen presentes
if [[ ! -f "$MECA_DIR/install.sh" ]]; then
    MECA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/meca-hyprconfig"
    if [[ ! -d "$MECA_DIR" ]]; then
        info "Clonando Meca-HyprConfig..."
        git clone https://github.com/lizarbe513/Meca-HyprConfig.git "$MECA_DIR"
    fi
fi

if [[ ! -f "$CONFIG_DIR/install.sh" ]]; then
    CONFIG_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/lizarbe-omarchy-config"
    if [[ ! -d "$CONFIG_DIR" ]]; then
        info "Clonando Lizarbe-Omarchy-Config..."
        git clone https://github.com/lizarbe513/Lizarbe-Omarchy-Config.git "$CONFIG_DIR"
    fi
fi

# Pasar argumentos (ej. --all, --no-3d, --core-only) a Lizarbe-Omarchy-Config
ARGS=("$@")

echo ""
info "Iniciando instalación del entorno completo..."
echo ""

# 1. Configuración de carpetas de usuario estándar (Plantillas / Templates)
info "Preparando carpetas base y plantillas de usuario..."
mkdir -p "$HOME/Templates"
touch "$HOME/Templates/New Document.txt"
if command -v xdg-user-dirs-update &>/dev/null; then
    xdg-user-dirs-update --set TEMPLATES "$HOME/Templates" 2>/dev/null || true
fi
success "Plantillas de usuario configuradas (~/Templates)."

# 2. Instalación de Lizarbe Omarchy Config (Tema, suites, fastfetch, iconos, etc.)
echo ""
info "------------------------------------------------------------"
info "Paso 1: Instalando Lizarbe-Omarchy-Config (Temas y Software)"
info "------------------------------------------------------------"
if [[ -f "$CONFIG_DIR/install.sh" ]]; then
    bash "$CONFIG_DIR/install.sh" "${ARGS[@]}"
else
    error "No se encontró el instalador de Lizarbe-Omarchy-Config en $CONFIG_DIR"
fi

# 3. Instalación de MECA (Panel TUI para Hyprland)
echo ""
info "------------------------------------------------------------"
info "Paso 2: Instalando MECA (Meca-HyprConfig)"
info "------------------------------------------------------------"
if [[ -f "$MECA_DIR/install.sh" ]]; then
    bash "$MECA_DIR/install.sh"
else
    error "No se encontró el instalador de Meca-HyprConfig en $MECA_DIR"
fi

echo ""
echo -e "${GREEN}${BOLD}=============================================================="
echo -e "       ¡SISTEMA OMARCHY CONFIGURADO SATISFACTORIAMENTE!        "
echo -e "==============================================================${NC}"
echo ""
echo -e "${CYAN}Comandos principales disponibles en tu terminal:${NC}"
echo -e "  • ${BOLD}lizarbe${NC}        -> Panel de control de temas, suites, apps y mantenimiento"
echo -e "  • ${BOLD}meca${NC}           -> Panel TUI de personalización de Hyprland (gaps, blur, binds)"
echo -e "  • ${BOLD}lizarbe status${NC} -> Ver estado de paquetes, temas y actualizaciones"
echo ""
echo -e "${YELLOW}Recomendación:${NC} Reinicia tu sesión de Hyprland o abre una nueva terminal para disfrutar de todos los cambios."
echo ""
