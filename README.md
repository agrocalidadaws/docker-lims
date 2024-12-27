# Proyecto: Docker Lims

Este proyecto contiene la configuración Docker del proyecto LIMS.

---

## Descripción

Este sistema integra múltiples servicios como PHP, Nginx y Gotenberg para manejar flujos de trabajo automatizados, incluyendo la generación de PDF, tareas programadas y una arquitectura robusta para aplicaciones basadas en Laravel.

---

## Instalación

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   ```

2. Accede al directorio del proyecto:
   ```bash
   cd <NOMBRE_DEL_DIRECTORIO>
   ```

3. Crea el directorio `src` si aún no existe. Este será el lugar donde estará el código fuente de la aplicación:
   ```bash
   mkdir -p src
   ```

4. Construye y levanta los contenedores utilizando Docker Compose:
   ```bash
   docker-compose up -d --build
   ```

5. Asegúrate de que los servicios estén corriendo:
   ```bash
   docker ps
   ```

6. Accede a la aplicación desde tu navegador en `http://localhost` o la URL configurada en tu archivo Nginx.

---

