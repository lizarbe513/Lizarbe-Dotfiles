# ☂️ Lizarbe Dotfiles — Repositorio Paraguas para Omarchy

> Repositorio paraguas (*meta-repositorio*) diseñado para preparar, personalizar y enriquecer una instalación completa del sistema operativo **Omarchy** (Arch Linux + Hyprland) para un usuario general y avanzado, así como proveer las preconfiguraciones para la generación de la **ISO oficial de Omarchy**.

Este proyecto orquesta tanto los ajustes base del sistema operativo como los componentes del ecosistema **Lizarbe**:
1. **[system/](file:///home/leonardo/Projects/lizarbe%20dotfiles/system)**: Ajustes previos y comportamiento del sistema (inhibición de suspensión en videos, plantillas de usuario, reglas de ventana).
2. **[Meca-HyprConfig](https://github.com/lizarbe513/Meca-HyprConfig)**: Panel TUI reactivo y flotante para gestionar la configuración de Hyprland (monitores, atajos, gaps, blur, autostart y teclado).
3. **[Lizarbe-Omarchy-Config](https://github.com/lizarbe513/Lizarbe-Omarchy-Config)**: Tema visual Lizarbe (Dark/Light), iconos `Lizarbe-Red`, tema GTK `Darky`, Starship prompt, Fastfetch personalizado y suites de software modulares (Ofimática, Desarrollo, 2D, 3D/CAD, Multimedia).

---

## ⚡ Instalación en una Sola Línea

Abre una terminal en tu sistema Omarchy y pega el siguiente comando:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/lizarbe513/Lizarbe-Dotfiles/main/install.sh)"
```

> **Alternativa con tubería directa:**
> ```bash
> curl -fsSL https://raw.githubusercontent.com/lizarbe513/Lizarbe-Dotfiles/main/install.sh | bash
> ```

---

## 📦 Estructura del Repositorio

```
Lizarbe-Dotfiles (Umbrella)
├── ⚙️ system/                  -> Ajustes previos del sistema y aprovisionamiento para ISO
│   ├── config/hypr/looknfeel.lua (idle_inhibit en videos, reglas base)
│   ├── templates/ (Plantillas base del sistema: ~/Templates)
│   └── apply.sh (Aplicador modular para $HOME o /etc/skel en la ISO)
│
├── 🎛️ modules/meca-hyprconfig -> Panel de control TUI para Hyprland
│   ├── Configuración de Monitores & Escala
│   ├── Personalización estética en vivo (gaps, bordes, sombras, blur)
│   ├── Grabador y gestor de atajos de teclado (Keybinds)
│   ├── Corrección de Bloq Mayús / Compose (Alt Gr)
│   └── Autostart de aplicaciones
│
└── 🎨 modules/lizarbe-omarchy-config -> Identidad visual, dotfiles y software
    ├── Tema Omarchy Lizarbe Red & Lizarbe Light
    ├── Tema GTK Darky & Iconos Lizarbe-Red
    ├── Fastfetch personalizado & Starship Prompt
    ├── Suite Creativa 2D (Krita, Inkscape, LibreSprite, Pinta)
    ├── Suite Creativa 3D & CAD (Blender, FreeCAD, Blockbench, Godot)
    ├── Suite Dev (VS Code, Git, Lazygit, Docker, Lazydocker)
    ├── Suite Ofimática & Notas (ONLYOFFICE, Obsidian, Xournal++)
    ├── Suite Multimedia (Kdenlive, OBS Studio, Audacity)
    └── Integración con KDE Connect & Navegador Zen
```

---

## 🛠️ Modos de Instalación

El comando de instalación por defecto abrirá el **modo interactivo**, permitiéndote elegir qué suites y componentes instalar según el hardware de tu máquina.

Si prefieres automatizar la instalación desatendida, puedes pasar argumentos al instalador:

| Comando | Descripción |
| :--- | :--- |
| `bash -c "$(curl -fsSL ...)" -- --all` | Instala todas las suites completas (incluyendo suites 3D/CAD). |
| `bash -c "$(curl -fsSL ...)" -- --no-3d` | **Recomendado para portátiles**: instala todo excepto herramientas 3D pesadas. |
| `bash -c "$(curl -fsSL ...)" -- --core-only` | Instala únicamente ajustes del sistema, tema visual, MECA y branding base. |

### Instalación Manual (Clonando el Repositorio)

```bash
git clone --recurse-submodules https://github.com/lizarbe513/Lizarbe-Dotfiles.git
cd Lizarbe-Dotfiles
./install.sh
```

---

## 🚀 Uso Post-Instalación

Una vez finalizado el proceso de instalación, dispondrás de los siguientes comandos y herramientas en tu sistema:

### 1. Panel del Sistema y Aplicaciones (`lizarbe`)
Abre el gestor integral de suites, temas y software:
```bash
lizarbe
```

### 2. Panel de Configuración de Hyprland (`meca`)
Ajusta la apariencia visual del escritorio, gaps, atajos de teclado y monitores en tiempo real:
```bash
meca
```

### 3. Consultar Estado y Actualizaciones
```bash
lizarbe status   # Comprueba la sincronización con los repositorios remotos
lizarbe update   # Actualiza los dotfiles y componentes a la última versión
```

---

## 📄 Licencia

MIT © [lizarbe513](https://github.com/lizarbe513)
