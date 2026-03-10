# Database Schema

## Overview

PostgreSQL database schema cho AI Industrial Error Troubleshooting System.

## Entity Relationship Diagram

```
┌─────────────┐       ┌─────────────┐       ┌─────────────┐
│    Floor    │       │   Machine   │       │    Error    │
├─────────────┤       ├─────────────┤       ├─────────────┤
│ id (PK)     │◄──────┤ id (PK)     │◄──────┤ id (PK)     │
│ name        │       │ floor_id(FK)│       │ machine_id  │
│ description │       │ name        │       │ error_code  │
│ created_at  │       │ model       │       │ error_name  │
└─────────────┘       │ location    │       │ description │
                      │ created_at  │       │ severity    │
                      └─────────────┘       │ symptoms    │
                                            │ created_at  │
                                            └──────┬──────┘
                                                   │
                          ┌────────────────────────┘
                          │
                   ┌──────▼──────┐
                   │   Solution  │
                   ├─────────────┤
                   │ id (PK)     │
                   │ error_id(FK)│
                   │ steps (JSON)│
                   │ tools       │
                   │ time_estimate
                   │ success_rate│
                   │ created_at  │
                   └──────┬──────┘
                          │
                   ┌──────▼──────┐
                   │ Interaction │
                   ├─────────────┤
                   │ id (PK)     │
                   │ error_id(FK)│
                   │ solution_id │
                   │ user_id(FK) │
                   │ success     │
                   │ feedback    │
                   │ duration    │
                   │ created_at  │
                   └─────────────┘
```

## Tables

### 1. floors

Lưu thông tin các tầng trong nhà máy.

```sql
CREATE TABLE floors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 2. machines

Lưu thông tin máy móc.

```sql
CREATE TABLE machines (
    id SERIAL PRIMARY KEY,
    floor_id INTEGER REFERENCES floors(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    model VARCHAR(100),
    manufacturer VARCHAR(100),
    location VARCHAR(200),
    specifications JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 3. errors

Lưu thông tin các loại lỗi.

```sql
CREATE TABLE errors (
    id SERIAL PRIMARY KEY,
    machine_id INTEGER REFERENCES machines(id) ON DELETE CASCADE,
    error_code VARCHAR(50) NOT NULL,
    error_name VARCHAR(200) NOT NULL,
    description TEXT,
    symptoms TEXT[],
    possible_causes TEXT[],
    severity VARCHAR(20) CHECK (severity IN ('low', 'medium', 'high', 'critical')),
    category VARCHAR(100),
    plc_code VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(machine_id, error_code)
);
```

### 4. solutions

Lưu các giải pháp xử lý lỗi.

```sql
CREATE TABLE solutions (
    id SERIAL PRIMARY KEY,
    error_id INTEGER REFERENCES errors(id) ON DELETE CASCADE,
    steps JSONB NOT NULL, -- [{order, description, checklist, warning}]
    required_tools TEXT[],
    estimated_time INTEGER, -- minutes
    difficulty_level VARCHAR(20) CHECK (difficulty_level IN ('easy', 'medium', 'hard')),
    safety_warnings TEXT[],
    success_rate DECIMAL(5,2) DEFAULT 0,
    applied_count INTEGER DEFAULT 0,
    is_ai_generated BOOLEAN DEFAULT FALSE,
    created_by INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 5. users

Lưu thông tin ngườidùng.

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(200) UNIQUE,
    password_hash VARCHAR(255),
    full_name VARCHAR(200),
    role VARCHAR(50) CHECK (role IN ('admin', 'engineer', 'operator', 'viewer')),
    department VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    last_login TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 6. interactions

Lưu lịch sử tương tác (khi user áp dụng giải pháp).

```sql
CREATE TABLE interactions (
    id SERIAL PRIMARY KEY,
    error_id INTEGER REFERENCES errors(id),
    solution_id INTEGER REFERENCES solutions(id),
    user_id INTEGER REFERENCES users(id),
    machine_id INTEGER REFERENCES machines(id),
    applied_solution BOOLEAN DEFAULT FALSE,
    success BOOLEAN,
    actual_time INTEGER, -- minutes
    feedback TEXT,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    issues_encountered TEXT[],
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 7. error_embeddings

Lưu vector embeddings cho similarity search (hoặc dùng ChromaDB riêng).

```sql
CREATE TABLE error_embeddings (
    id SERIAL PRIMARY KEY,
    error_id INTEGER REFERENCES errors(id) ON DELETE CASCADE,
    embedding VECTOR(384), -- pgvector extension
    model_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index cho vector similarity search
CREATE INDEX ON error_embeddings USING ivfflat (embedding vector_cosine_ops);
```

## Indexes

```sql
-- Performance indexes
CREATE INDEX idx_errors_machine_id ON errors(machine_id);
CREATE INDEX idx_errors_error_code ON errors(error_code);
CREATE INDEX idx_errors_severity ON errors(severity);
CREATE INDEX idx_solutions_error_id ON solutions(error_id);
CREATE INDEX idx_interactions_error_id ON interactions(error_id);
CREATE INDEX idx_interactions_user_id ON interactions(user_id);
CREATE INDEX idx_machines_floor_id ON machines(floor_id);

-- Full-text search indexes
CREATE INDEX idx_errors_search ON errors USING gin(to_tsvector('english', error_name || ' ' || COALESCE(description, '')));
```

## Migrations

Xem thư mục `backend/migrations/` cho các file migration cụ thể.

## Seeding

```sql
-- Sample data
INSERT INTO floors (name, description) VALUES
('Tầng 1', 'Khu vực sản xuất chính'),
('Tầng 3', 'Khu vực đóng gói'),
('Tầng 5', 'Khu vực lắp ráp');

INSERT INTO machines (floor_id, name, model, manufacturer, location) VALUES
(5, 'Máy 1', 'PLC-S7-1500', 'Siemens', 'Dãy A'),
(5, 'Máy 2', 'PLC-S7-1200', 'Siemens', 'Dãy B'),
(3, 'Máy 1', 'Mitsubishi FX5U', 'Mitsubishi', 'Khu đóng gói 1');
```
