# 🕵️ NetReaper

`NetReaper.ps1` es una herramienta de recolección de información para Red Team y pentesters, enfocada en entornos de Active Directory. Automatiza la enumeración de usuarios, equipos, grupos privilegiados y comparticiones SMB en redes corporativas Windows.

⚠️ **Solo para uso en entornos de pruebas, con permisos adecuados.**

---

## 📦 Características

- Detecta el dominio actual y sus controladores
- Enumera:
  - Usuarios del dominio
  - Equipos unidos al dominio
  - Miembros del grupo `Domain Admins`
  - Comparticiones de red (SMB)
- Basado en PowerShell, fácil de extender
- Ideal para laboratorios, simulacros de intrusión y aprendizaje de Red Team

---

## 🧰 Requisitos

- **Sistema operativo**: Windows 10/11 o Server (dentro de dominio)
- **PowerShell**: v5.1 o superior
- **Módulo RSAT de Active Directory** instalado

Instalación del módulo AD en Windows:

```powershell
# Para Windows Server
Add-WindowsFeature RSAT-AD-PowerShell

# Para Windows 10/11
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
```
---
## 🚀 Instalación y uso

📁 Clona este repositorio o descarga el archivo NetReaper.ps1:
```
git clone https://github.com/tuusuario/NetReaper.git
cd NetReaper
```
⚠️ Abre PowerShell como administrador.

🛡️ Permite la ejecución de scripts temporalmente:
```
Set-ExecutionPolicy RemoteSigned -Scope Process
```
▶️ Ejecuta el script:
```
.\NetReaper.ps1
```
💡 Ejemplo de salida
```
[*] Enumerando información del dominio...

Dominio actual: corp.local

Controladores de Dominio:
DC01     192.168.1.10

Usuarios del dominio (primeros 10):
- jsmith
- admin
...

Grupos privilegiados:
- Administrator
- ITSupport

Equipos del dominio:
- LAPTOP-002
- FILESRV-01

Enumerando comparticiones SMB de la red local:
[192.168.1.20] Comparticiones encontradas:
    Share name    Type
    -----------   ----
    Public        Disk
```
# 🛑 Advertencia legal
Esta herramienta es exclusivamente para uso educativo o en entornos controlados con permiso explícito.

# 🚫 No la utilices en redes ajenas sin autorización.
El uso indebido puede violar leyes locales e internacionales.
El autor no se hace responsable de acciones ilegales realizadas con este código.

# 📜 Licencia
MIT License — libre para usar, modificar y compartir.
Dale crédito si la mejoras 🤝

# 👤 Autor
Desarrollado por FaZeGabri00.
Si te mola el proyecto, ⭐ dale una estrellita o contribuye con mejoras.
