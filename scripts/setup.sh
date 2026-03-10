#!/bin/bash

# Setup script for AI Industrial Error Troubleshooting System

echo "🚀 Setting up AI Industrial Error Troubleshooting System..."

# Check prerequisites
echo "📋 Checking prerequisites..."

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.9+ first."
    exit 1
fi

# Check Docker
if ! command -v docker &> /dev/null; then
    echo "⚠️  Docker is not installed. You'll need Docker for the database services."
fi

echo "✅ Prerequisites check passed!"

# Create environment files
echo "📝 Creating environment files..."

# Backend env
cat > backend/.env << EOF
NODE_ENV=development
PORT=3001
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=password
DB_NAME=ai_error_troubleshooting
REDIS_URL=redis://localhost:6379
CHROMA_URL=http://localhost:8000
JWT_SECRET=your-secret-key-change-in-production
LOG_LEVEL=debug
EOF

# Frontend env
cat > frontend/.env.local << EOF
NEXT_PUBLIC_API_URL=http://localhost:3001/api/v1
NEXT_PUBLIC_AI_URL=http://localhost:3002
NEXT_PUBLIC_APP_NAME="AI Error Troubleshooting"
EOF

# AI Service env
cat > ai-service/.env << EOF
PYTHONUNBUFFERED=1
CHROMA_URL=http://localhost:8000
MODEL_NAME=all-MiniLM-L6-v2
PORT=3002
DEBUG=True
EOF

echo "✅ Environment files created!"

# Install dependencies
echo "📦 Installing dependencies..."

# Root
npm install

# Backend
cd backend
npm install
cd ..

# Frontend
cd frontend
npm install
cd ..

# AI Service
cd ai-service
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cd ..

echo "✅ Dependencies installed!"

# Start Docker services
echo "🐳 Starting Docker services..."
docker-compose up -d postgres redis chromadb

echo "⏳ Waiting for services to be ready..."
sleep 10

# Run migrations
echo "🔄 Running database migrations..."
cd backend
npm run migrate
cd ..

# Seed data
echo "🌱 Seeding sample data..."
cd backend
npm run seed
cd ..

echo ""
echo "✅ Setup complete!"
echo ""
echo "🎉 You can now start development:"
echo ""
echo "  Start all services:"
echo "    npm run dev"
echo ""
echo "  Or start individually:"
echo "    npm run dev:backend   # Backend API at http://localhost:3001"
echo "    npm run dev:frontend  # Frontend at http://localhost:3000"
echo "    npm run dev:ai        # AI Service at http://localhost:3002"
echo ""
echo "  Docker services:"
echo "    PostgreSQL: localhost:5432"
echo "    Redis: localhost:6379"
echo "    ChromaDB: localhost:8000"
echo ""
