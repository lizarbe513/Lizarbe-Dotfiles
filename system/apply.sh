#!/usr/bin/env bash
# ==============================================================================
# Script de aplicación de ajustes previos del sistema (Lizarbe / Omarchy)
# Soporta aplicación en entorno de usuario ($HOME) o en raíz de ISO (/etc/skel)
# ==============================================================================
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || true)"

# Directorio destino: por defecto $HOME o el primer argumento
TARGET_USER_DIR="${1:-$HOME}"

echo ":: Aplicando ajustes previos del sistema en: $TARGET_USER_DIR"

# 1. Configurar plantillas de usuario (~/Templates)
TEMPLATES_DIR="$TARGET_USER_DIR/Templates"
mkdir -p "$TEMPLATES_DIR"
if [[ -f "$SCRIPT_DIR/templates/New Document.txt" ]]; then
    cp -n "$SCRIPT_DIR/templates/New Document.txt" "$TEMPLATES_DIR/" 2>/dev/null || true
fi

# Actualizar xdg-user-dirs solo si se aplica sobre el usuario actual
if [[ "$TARGET_USER_DIR" == "$HOME" ]] && command -v xdg-user-dirs-update &>/dev/null; then
    xdg-user-dirs-update --set TEMPLATES "$TEMPLATES_DIR" 2>/dev/null || true
fi

# 2. Configurar reglas de ventana y comportamiento en Hyprland (looknfeel.lua)
HYPR_CONFIG_DIR="$TARGET_USER_DIR/.config/hypr"
mkdir -p "$HYPR_CONFIG_DIR"
TARGET_LOOKNFEEL="$HYPR_CONFIG_DIR/looknfeel.lua"

if [[ ! -f "$TARGET_LOOKNFEEL" ]]; then
    cp "$SCRIPT_DIR/config/hypr/looknfeel.lua" "$TARGET_LOOKNFEEL"
else
    # Si ya existe, asegurar que contiene las reglas de idle_inhibit
    if ! grep -q "idle_inhibit = \"fullscreen\"" "$TARGET_LOOKNFEEL"; then
        echo "" >> "$TARGET_LOOKNFEEL"
        echo "-- Omarchy / Lizarbe: Inhibir suspensión (idle_inhibit) en reproducción de video" >> "$TARGET_LOOKNFEEL"
        echo 'o.window(".*", { idle_inhibit = "fullscreen" })' >> "$TARGET_LOOKNFEEL"
        echo 'o.window("^(mpv|vlc)$", { idle_inhibit = "focus" })' >> "$TARGET_LOOKNFEEL"
    fi
fi

# 3. Recargar Hyprland en caliente si el compositor está activo
if [[ "$TARGET_USER_DIR" == "$HOME" ]] && command -v hyprctl &>/dev/null; then
    hyprctl reload &>/dev/null || true
fi

echo "✔ Ajustes previos aplicados correctamente."
