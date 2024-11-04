# Guía para Dockerfile y Docker Compose

## ¿Qué es un `Dockerfile`?

El `Dockerfile` es un archivo de texto que contiene una serie de instrucciones para construir una **imagen de Docker**. Estas imágenes definen el entorno de ejecución para aplicaciones, incluyendo todo lo que la aplicación necesita para funcionar, como el sistema operativo, bibliotecas, dependencias y el propio código de la aplicación.

### ¿Para qué sirve un `Dockerfile`?

- **Automatiza la creación de imágenes**: Permite crear imágenes de forma reproducible y automática.
- **Define el entorno de la aplicación**: Contiene todo lo necesario para que tu aplicación se ejecute de manera consistente en cualquier máquina o servidor.
- **Evita la "dependencia del entorno"**: Garantiza que la aplicación funcionará igual independientemente del sistema en el que se ejecute (ya que el entorno está contenido en la imagen).

### Ejemplo básico de un `Dockerfile` para una aplicación Node.js

```Dockerfile
# 1. Usamos una imagen base de Node.js
FROM node:14

# 2. Creamos un directorio de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiamos el archivo package.json para instalar dependencias
COPY package.json .

# 4. Instalamos las dependencias
RUN npm install

# 5. Copiamos el código de la aplicación al contenedor
COPY . .

# 6. Exponemos el puerto en el que la aplicación va a correr
EXPOSE 3000

# 7. Definimos el comando por defecto para iniciar la aplicación
CMD ["npm", "start"]
```
### En este ejemplo:

Usamos una imagen de Node.js como base.
Creamos un directorio dentro del contenedor (/app) donde colocaremos la aplicación.
Copiamos los archivos y ejecutamos comandos (npm install y npm start).
Finalmente, se expone el puerto 3000 para que la aplicación sea accesible.

### ¿Qué es un archivo docker-compose.yml?
`docker-compose.yml` es un archivo que define y orquesta múltiples contenedores Docker para formar un sistema completo.
Es decir, si tu aplicación necesita múltiples servicios (como una base de datos, un servidor web, una caché, etc.), docker-compose te permite ejecutar y gestionar esos contenedores de forma conjunta.

### ¿Para qué sirve docker-compose?
- **Orquesta múltiples contenedores: Permite definir y ejecutar aplicaciones que dependen de varios servicios o contenedores.
- **Facilita el desarrollo local: Simplifica la ejecución de entornos completos de desarrollo, permitiéndote correr bases de datos, aplicaciones web y más con un solo comando.
- **Gestión simplificada: Con un solo archivo docker-compose.yml, puedes definir redes, volúmenes, dependencias entre servicios y más.

## Ejemplo básico de un archivo docker-compose.yml
Este archivo ejecuta un servidor web NGINX y una base de datos MariaDB como dos servicios separados pero conectados:
```
version: '3'

services:
  web:
    image: nginx:alpine
    ports:
      - "8080:80"  # Mapea el puerto 80 del contenedor al puerto 8080 del host

  db:
    image: mariadb:latest
    environment:
      MYSQL_ROOT_PASSWORD: ejemplo_root_password
      MYSQL_DATABASE: ejemplo_db
      MYSQL_USER: ejemplo_user
      MYSQL_PASSWORD: ejemplo_password

```

### En este ejemplo:

- **web: Define un contenedor para el servicio web usando NGINX.
          Se expone el puerto 80 dentro del contenedor y se mapea al puerto 8080 de la máquina local.
- **db: Define un contenedor para la base de datos MariaDB.
        Aquí configuramos algunas variables de entorno para establecer el usuario, la contraseña y el nombre de la base de datos.
  
Con un solo archivo docker-compose.yml, puedes lanzar estos dos contenedores con:
```
docker-compose up
```

## Dockerfile:

- Es utilizado para crear imágenes de Docker.
- Define el entorno específico y los pasos para construir la imagen de un contenedor individual.
- Se enfoca en un solo servicio (por ejemplo, tu aplicación web, servidor o base de datos).

## docker-compose.yml:

- Es utilizado para orquestar múltiples contenedores Docker.
- Permite definir varios servicios (contenedores) y cómo deben interactuar entre ellos (redes, volúmenes, etc.).
- Automatiza el despliegue de todo el entorno con un solo comando.

## ¿Cuándo usar cada uno?

- **Usas Dockerfile** cuando necesitas crear una imagen para un contenedor específico que será la base de tu servicio.
  - Ejemplo: Crear una imagen de tu aplicación personalizada con todas sus dependencias y configuraciones.
  
- **Usas docker-compose.yml** cuando tu aplicación depende de múltiples servicios que deben ejecutarse juntos.
  - Ejemplo: Si tu aplicación necesita un servidor web, una base de datos y un sistema de caché, puedes definirlos y ejecutarlos fácilmente con docker-compose.

## Ventajas de usar Docker Compose y Dockerfile juntos

- **Desarrollo simplificado**: Puedes definir tu aplicación con múltiples servicios y levantarlos con un solo comando.
- **Aislamiento**: Cada servicio corre en su propio contenedor, lo que evita conflictos entre dependencias o configuraciones de sistemas.
- **Escalabilidad**: Puedes definir cómo deben escalarse tus servicios. Por ejemplo, puedes tener varias instancias de un servicio ejecutándose simultáneamente.
- **Reproducibilidad**: Si alguien más quiere correr tu proyecto, sólo necesita ejecutar `docker-compose up`, y todo el entorno se levantará tal como lo definiste, sin necesidad de configuraciones adicionales.

## Conclusión

- Un **Dockerfile** sirve para crear imágenes de Docker que contienen todo lo necesario para ejecutar un servicio.
- Un **docker-compose.yml** orquesta múltiples servicios en contenedores para crear un entorno completo, listo para desarrollo o producción.
"""

# Crear el archivo README.md y guardar el contenido
with open("/mnt/data/README.md", "w") as file:
    file.write(readme_content)

"/mnt/data/README.md creado exitosamente"
