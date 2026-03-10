# Project Structure

```
ai-error-troubleshooting/
├── 📁 backend/                 # Backend API (Node.js)
│   ├── 📁 src/
│   │   ├── 📁 config/         # Configuration files
│   │   ├── 📁 controllers/    # API controllers
│   │   ├── 📁 models/         # Database models
│   │   ├── 📁 routes/         # API routes
│   │   ├── 📁 services/       # Business logic
│   │   ├── 📁 middleware/     # Express middleware
│   │   ├── 📁 utils/          # Utility functions
│   │   └── 📄 app.ts          # Main application
│   ├── 📁 tests/              # Test files
│   ├── 📄 package.json
│   └── 📄 tsconfig.json
│
├── 📁 frontend/               # Frontend (Next.js)
│   ├── 📁 src/
│   │   ├── 📁 app/            # Next.js app router
│   │   ├── 📁 components/     # React components
│   │   ├── 📁 hooks/          # Custom React hooks
│   │   ├── 📁 lib/            # Utility functions
│   │   ├── 📁 types/          # TypeScript types
│   │   └── 📁 styles/         # CSS/Tailwind
│   ├── 📁 public/             # Static assets
│   ├── 📄 package.json
│   └── 📄 next.config.js
│
├── 📁 ai-service/             # AI/ML Service (Python)
│   ├── 📁 src/
│   │   ├── 📁 embeddings/     # Text embedding models
│   │   ├── 📁 similarity/     # Similarity search
│   │   ├── 📁 training/       # Model training
│   │   └── 📄 main.py         # FastAPI app
│   ├── 📁 models/             # Trained models
│   ├── 📄 requirements.txt
│   └── 📄 Dockerfile
│
├── 📁 docs/                   # Documentation
│   ├── 📄 API.md
│   ├── 📄 DB_SCHEMA.md
│   └── 📄 DEPLOYMENT.md
│
├── 📁 scripts/                # Utility scripts
│   ├── 📄 setup.sh
│   └── 📄 seed-data.js
│
├── 📁 .github/                # GitHub Actions
│   └── 📁 workflows/
│       ├── 📄 ci.yml
│       └── 📄 deploy.yml
│
├── 📄 README.md
├── 📄 PRD.md
├── 📄 LICENSE
├── 📄 package.json
└── 📄 docker-compose.yml
```

## Data Flow

```
User Input → Frontend → Backend API → Database
                           ↓
                    AI Service (Vector Search)
                           ↓
              Similar Errors + Solutions
                           ↓
                    Frontend Display
```
