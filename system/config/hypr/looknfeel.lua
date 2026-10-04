-- ==============================================================================
-- Omarchy / Lizarbe - Look & Feel y Reglas del Sistema
-- Configuración previa del sistema para usuarios generales y generador de ISO
-- ==============================================================================

-- Regla de ventana para Lizarbe Theme & Suite (modo flotante y centrado)
o.window("org.omarchy.lizarbe", { float = true, center = true, size = { 680, 960 } })

-- Reglas de ventana para KDE Connect
o.window("org.kde.kdeconnect.app", { float = true, center = true, size = { 680, 960 } })
o.window("org.kde.kdeconnect-indicator", { float = true, center = true, size = { 680, 960 } })

-- Omarchy: Inhibición de suspensión (idle_inhibit) en reproducción de video
-- 1. Pantalla completa (YouTube en navegadores, reproductores, etc.)
o.window(".*", { idle_inhibit = "fullscreen" })

-- 2. Reproductores multimedia enfocados
o.window("^(mpv|vlc)$", { idle_inhibit = "focus" })
