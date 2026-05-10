# Backend - Gestión de Productos

API REST desarrollada con Node.js + Express + MySQL.

## Tecnologías
- Node.js 22
- Express
- MySQL 8.0
- Docker

## Endpoints
- GET /api/productos → Lista todos los productos
- POST /api/productos → Crea un producto
- DELETE /api/productos/:id → Elimina un producto

## Variables de entorno
- DB_HOST → Host de la base de datos
- DB_USER → Usuario de MySQL
- DB_PASSWORD → Contraseña de MySQL
- DB_NAME → Nombre de la base de datos

## Ejecutar localmente
```bash
docker-compose up -d
```

## Pipeline CI/CD
El pipeline se activa con push en la rama `deploy` y:
1. Construye la imagen Docker
2. Publica en Amazon ECR
3. Despliega en EC2