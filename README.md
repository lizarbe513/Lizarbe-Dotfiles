# ☂️ Lizarbe Dotfiles — Repositorio Paraguas para Omarchy

> Repositorio paraguas (*meta-repositorio*) diseñado para preparar, personalizar y enriquecer una instalación completa del sistema operativo **Omarchy** (Arch Linux + Hyprland) para un usuario general y avanzado.

Este proyecto orquesta e integra los componentes clave del ecosistema **Lizarbe** en una sola suite coordinada:
1. **[Meca-HyprConfig](https://github.com/lizarbe513/Meca-HyprConfig)**: Panel TUI reactivo y flotante para gestionar la configuración de Hyprland (monitores, atajos, gaps, blur, autostart y teclado).
2. **[Lizarbe-Omarchy-Config](https://github.com/lizarbe513/Lizarbe-Omarchy-Config)**: Tema visual Lizarbe (Dark/Light), iconos `Lizarbe-Red`, tema GTK `Darky`, Starship prompt, Fastfetch personalizado, reglas de ventanas y suites de software modulares (Ofimática, Desarrollo, 2D, 3D/CAD, Multimedia).

---

## ⚡ Instalación en una Sola Línea

Abre una terminal en tu sistema Omarchy y pega el siguiente comando:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/lizarbe513/lizarbe-dotfiles/main/install.sh)"
```

> **Alternativa con tubería directa:**
> ```bash
> curl -fsSL https://raw.githubusercontent.com/lizarbe513/lizarbe-dotfiles/main/install.sh | bash
> ```

---

## 📦 Componentes Incluidos

```
lizarbe-dotfiles (Umbrella)
├── 🎛️ Meca-HyprConfig         -> Panel de control TUI para Hyprland
│   ├── Configuración de Monitores & Escala
│   ├── Personalización estética en vivo (gaps, bordes, sombras, blur)
│   ├── Grabador y gestor de atajos de teclado (Keybinds)
│   ├── Corrección de Bloq Mayús / Compose (Alt Gr)
│   └── Autostart de aplicaciones
│
└── 🎨 Lizarbe-Omarchy-Config   -> Identidad visual, dotfiles y catálogo de software
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
| `bash -c "$(curl -fsSL ...)" -- --core-only` | Instala únicamente el tema visual, MECA, branding y dotfiles base. |

### Instalación Manual (Clonando el Repositorio)

```bash
git clone --recurse-submodules https://github.com/lizarbe513/lizarbe-dotfiles.git
cd lizarbe-dotfiles
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
O búscalo en el lanzador de aplicaciones (`Super + Espacio`) como **Lizarbe Theme & Suite**.

### 2. Panel de Configuración de Hyprland (`meca`)
Ajusta la apariencia visual del escritorio, gaps, atajos de teclado y monitores en tiempo real:
```bash
meca
```
O accede a través del menú de Omarchy (`Setup` ➔ `Config` ➔ `Meca`).

### 3. Consultar Estado y Actualizaciones
```bash
lizarbe status   # Comprueba la sincronización con los repositorios remotos
lizarbe update   # Actualiza los dotfiles y componentes a la última versión
```

---

## 📄 Licencia

MIT © [lizarbe513](https://github.com/lizarbe513)
