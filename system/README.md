# ⚙️ Ajustes Previos del Sistema (System Tweaks & ISO Provisioning)

Esta carpeta contiene los ajustes base y preconfiguraciones del sistema operativo **Omarchy**, separados de los módulos de software complementario.

Está diseñada tanto para:
1. **Configurar el sistema del usuario actual** durante la instalación de los dotfiles.
2. **Inyectar configuraciones base en la ISO de Omarchy** (archiso / `airootfs/etc/skel` o `configs/airootfs`), para que cualquier nueva instalación venga preconfigurada de fábrica.

---

## 📂 Contenido

```
system/
├── config/
│   └── hypr/
│       └── looknfeel.lua   # Reglas esenciales de Hyprland:
│                           #  - idle_inhibit = "fullscreen" (detección de video en navegadores)
│                           #  - idle_inhibit = "focus" (reproductores mpv/vlc)
│                           #  - Ventanas flotantes centradas (Lizarbe TUI, KDE Connect)
├── templates/
│   └── New Document.txt    # Plantillas de usuario predeterminadas (~/Templates)
└── apply.sh                # Script aplicador modular (acepta destino como argumento)
```

---

## 🚀 Uso Directo

### Para el usuario actual:
```bash
./system/apply.sh
```

### Para inyectar en la ISO (`omarchy-iso` / `/etc/skel`):
```bash
./system/apply.sh /ruta/a/omarchy-iso/configs/airootfs/etc/skel
```
