# 🚀 Git & GitHub Cheat Sheet: Paso a Paso

Esta guía cubre todo el proceso de subir un proyecto desde tu computadora a GitHub, asumiendo que partes desde cero.

---

## Fase 1: Preparación y Autenticación

Antes de usar Git, debes decirle quién eres y asegurarte de tener permiso para subir cosas a tu cuenta de GitHub.

### 1. Configurar tu identidad en Git (Se hace solo una vez)
Abre tu terminal y ejecuta estos comandos (con tus datos reales):
```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu_correo@ejemplo.com"
```
> [!TIP]
> Puedes verificar que se guardó correctamente escribiendo `git config --list`

### 2. Autenticarse con GitHub
Cuando intentes subir código por primera vez, GitHub te pedirá credenciales. Hoy en día no puedes usar la contraseña de tu cuenta directamente. Tienes dos opciones principales:

* **Opción Recomendada (GitHub CLI):** Instala [GitHub CLI](https://cli.github.com/) y ejecuta en la terminal:
  ```bash
  gh auth login
  ```
  Sigue las instrucciones en pantalla para autenticarte a través del navegador.
* **Opción Token (PAT):** Ve a GitHub.com > Settings > Developer settings > Personal access tokens. Genera un token, cópialo, y úsalo como si fuera tu "contraseña" cuando la terminal te lo pida.

---

## Fase 2: Crear el Repositorio en la Web

1. Entra a [GitHub.com](https://github.com) e inicia sesión.
2. Haz clic en el botón verde **"New"** (Nuevo) en la esquina superior izquierda o en el menú desplegable del "+" arriba a la derecha.
3. Rellena los datos:
   * **Repository name:** (Ej. `mi-proyecto-increible`)
   * **Description:** Opcional.
   * **Public / Private:** Elige si quieres que todos lo vean o solo tú.
4. **IMPORTANTE:** Si ya tienes código en tu computadora, **NO** marques las casillas de "Add a README" o "Add .gitignore". Déjalo totalmente vacío.
5. Haz clic en **"Create repository"**. 
6. Copia la URL que te aparece en la siguiente pantalla (ej. `https://github.com/TuUsuario/mi-proyecto.git`).

---

## Fase 3: Conectar tu PC con GitHub (Primera subida)

Ve a la carpeta de tu proyecto en la terminal. Si tu proyecto está en `Documentos/mi-proyecto`, asegúrate de estar ahí usando comandos como `cd`.

### 1. Inicializar Git en la carpeta
Convierte tu carpeta normal en un repositorio de Git:
```bash
git init
```

### 2. Agregar los archivos para prepararlos (Staging)
Le dice a Git "quiero guardar los cambios de todos estos archivos":
```bash
git add .
```
*(El punto `.` significa "absolutamente todo en esta carpeta")*

### 3. Crear el primer "punto de guardado" (Commit)
Crea una versión oficial de tus archivos:
```bash
git commit -m "Mi primer commit"
```
*(Puedes cambiar el texto entre comillas por algo descriptivo).*

### 4. Renombrar la rama principal a 'main'
Actualmente, GitHub prefiere que la rama principal se llame `main` en lugar de la antigua `master`:
```bash
git branch -M main
```

### 5. Vincular el repositorio local con la nube (Origin)
Pega el enlace que copiaste de GitHub en la Fase 2:
```bash
git remote add origin https://github.com/TuUsuario/mi-proyecto.git
```

### 6. Subir el código a GitHub (Push)
Envía todo el historial y los archivos a la nube:
```bash
git push -u origin main
```
> [!NOTE]
> El comando `-u` (o `--set-upstream`) vincula permanentemente tu rama local con la nube. Las próximas veces solo tendrás que escribir `git push`.

---

## 🔁 Fase 4: Flujo de Trabajo del Día a Día

Una vez hecho todo lo anterior, el proceso que harás **todos los días** que trabajes en tu código es mucho más corto.

Imagina que hiciste cambios, agregaste cosas o borraste otras. Para subir esto a GitHub repites el "Ciclo Sagrado de Git":

**Paso 1: Ver cómo van las cosas (opcional pero recomendado)**
```bash
git status
```
*Te muestra en rojo los archivos que han cambiado.*

**Paso 2: Preparar los cambios**
```bash
git add .
```

**Paso 3: Crear el punto de guardado**
```bash
git commit -m "Añadí la función de login y cambié colores"
```

**Paso 4: Subir a GitHub**
```bash
git push
```

---

## 🆘 Comandos Salvavidas

> [!WARNING]
> ¿Qué pasa si te equivocas? Aquí tienes cómo arreglar errores comunes.

* **Me equivoqué en el mensaje del último commit:**
  ```bash
  git commit --amend -m "Mensaje corregido"
  ```
* **Me equivoqué al agregar la URL del remote (El error que tuviste antes):**
  ```bash
  git remote set-url origin https://NUEVO_URL.git
  ```
* **Quiero descargar cambios que alguien más (o yo desde otra PC) subió a GitHub:**
  ```bash
  git pull origin main
  ```
* **No sé en qué estado está mi repositorio:**
  ```bash
  git status
  ```
