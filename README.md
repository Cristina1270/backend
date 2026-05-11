# Backend - Gestión de Productos

API REST desarrollada con Node.js + Express + MySQL, desplegada en AWS EC2 mediante Docker y GitHub Actions.

## Tecnologías
- Node.js 22
- Express
- MySQL 8.0
- Docker (multi-stage build)
- AWS EC2 + ECR
- GitHub Actions (CI/CD)

## Arquitectura
EC2-Backend (Privada) → IP: 52.44.123.183
├── Docker: Node.js (puerto 3000)
└── Docker: MySQL (puerto 3306)
└── Volumen: mysql-data (persistencia)

## Estructura del proyecto
backend/
├── index.js          → API REST principal
├── init.sql          → Script inicialización MySQL
├── Dockerfile        → Multi-stage build
├── docker-compose.yml→ Backend + MySQL con volumen
├── .dockerignore     → Archivos ignorados por Docker
├── .env.example      → Variables de entorno de ejemplo
└── .github/
└── workflows/
└── cicd-backend.yml → Pipeline CI/CD

## Endpoints
| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | /api/productos | Lista todos los productos |
| POST | /api/productos | Crea un producto |
| DELETE | /api/productos/:id | Elimina un producto |

## Variables de entorno
| Variable | Descripción | Default |
|----------|-------------|---------|
| DB_HOST | Host de MySQL | db |
| DB_USER | Usuario MySQL | root |
| DB_PASSWORD | Contraseña MySQL | root |
| DB_NAME | Base de datos | tienda |

## Persistencia de datos
Se usa **named volume** (`mysql-data`) para garantizar que los datos no se pierdan al reiniciar los contenedores.

```yaml
volumes:
  mysql-data:
```

## Ejecutar localmente
```bash
docker-compose up -d
```

## Pipeline CI/CD
El pipeline se activa con push en la rama `deploy` y ejecuta:
1. **Build** → construye la imagen Docker
2. **Push** → publica en Amazon ECR con tag versionado
3. **Deploy** → se conecta por SSH a EC2 y actualiza el contenedor

## Secrets requeridos
| Secret | Descripción |
|--------|-------------|
| AWS_ACCESS_KEY_ID | Clave de acceso AWS |
| AWS_SECRET_ACCESS_KEY | Clave secreta AWS |
| AWS_SESSION_TOKEN | Token de sesión AWS |
| AWS_REGION | Región AWS (us-east-1) |
| AWS_ACCOUNT_ID | ID de cuenta AWS |
| EC2_HOST | IP pública de la EC2 |
| EC2_USER | Usuario EC2 (ec2-user) |
| EC2_SSH_KEY | Clave privada SSH (.pem) |