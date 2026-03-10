# Deployment Guide

## Production Deployment

### Prerequisites

- Docker & Docker Compose
- Domain name (optional but recommended)
- SSL certificate (Let's Encrypt recommended)

### Environment Setup

1. **Clone repository:**
```bash
git clone https://github.com/your-org/ai-error-troubleshooting.git
cd ai-error-troubleshooting
```

2. **Create production environment files:**

`backend/.env.production`:
```env
NODE_ENV=production
PORT=3001
DB_HOST=postgres
DB_PORT=5432
DB_USER=your_db_user
DB_PASSWORD=your_secure_password
DB_NAME=ai_error_troubleshooting
REDIS_URL=redis://redis:6379
CHROMA_URL=http://chromadb:8000
JWT_SECRET=your-super-secret-jwt-key
LOG_LEVEL=info
```

`frontend/.env.production`:
```env
NEXT_PUBLIC_API_URL=https://api.your-domain.com/api/v1
NEXT_PUBLIC_AI_URL=https://ai.your-domain.com
NEXT_PUBLIC_APP_NAME="AI Error Troubleshooting"
```

3. **Update docker-compose for production:**

Create `docker-compose.prod.yml`:
```yaml
version: '3.8'

services:
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf
      - ./nginx/ssl:/etc/nginx/ssl
    depends_on:
      - backend
      - frontend
    restart: always

  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_USER: ${DB_USER}
      POSTGRES_PASSWORD: ${DB_PASSWORD}
      POSTGRES_DB: ${DB_NAME}
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./backups:/backups
    restart: always

  backend:
    build:
      context: ./backend
      dockerfile: Dockerfile.prod
    environment:
      - NODE_ENV=production
      - DATABASE_URL=postgresql://${DB_USER}:${DB_PASSWORD}@postgres:5432/${DB_NAME}
    depends_on:
      - postgres
      - redis
    restart: always

  frontend:
    build:
      context: ./frontend
      dockerfile: Dockerfile.prod
    depends_on:
      - backend
    restart: always

  ai-service:
    build:
      context: ./ai-service
      dockerfile: Dockerfile
    environment:
      - CHROMA_URL=http://chromadb:8000
    restart: always

volumes:
  postgres_data:
```

4. **Deploy:**
```bash
docker-compose -f docker-compose.prod.yml up -d
```

### SSL with Let's Encrypt

```bash
# Install certbot
docker run -it --rm \
  -v "$(pwd)/nginx/ssl:/etc/letsencrypt" \
  -v "$(pwd)/nginx/www:/var/www/certbot" \
  certbot/certbot certonly \
  --standalone \
  -d your-domain.com
```

### Backup Strategy

**Automated daily backup:**
```bash
#!/bin/bash
BACKUP_DIR="/backups"
DATE=$(date +%Y%m%d_%H%M%S)
docker exec postgres pg_dump -U postgres ai_error_troubleshooting > $BACKUP_DIR/backup_$DATE.sql
gzip $BACKUP_DIR/backup_$DATE.sql
# Keep only last 7 days
find $BACKUP_DIR -name "backup_*.sql.gz" -mtime +7 -delete
```

Add to crontab:
```
0 2 * * * /path/to/backup.sh
```

### Monitoring

**Health check endpoint:**
```bash
curl https://api.your-domain.com/api/v1/health
```

**Logs:**
```bash
docker-compose logs -f backend
docker-compose logs -f ai-service
```

### Scaling

**Horizontal scaling with Docker Swarm:**
```bash
docker swarm init
docker stack deploy -c docker-compose.swarm.yml ai-error-troubleshooting
```

## Cloud Deployment Options

### AWS
- **ECS/Fargate** for containers
- **RDS** for PostgreSQL
- **ElastiCache** for Redis
- **Application Load Balancer**

### Google Cloud
- **Cloud Run** for backend/frontend
- **Cloud SQL** for PostgreSQL
- **Memorystore** for Redis

### Azure
- **Container Instances** or **AKS**
- **Azure Database for PostgreSQL**
- **Azure Cache for Redis**
