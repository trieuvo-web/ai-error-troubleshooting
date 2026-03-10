# API Documentation

## Base URLs

```
Development: http://localhost:3001/api/v1
Production: https://api.your-domain.com/api/v1
```

## Authentication

API sử dụng JWT Bearer token.

```bash
Authorization: Bearer <your-jwt-token>
```

## Endpoints

### Floors

#### List all floors
```http
GET /floors
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "Tầng 1",
      "description": "Khu vực sản xuất chính",
      "created_at": "2026-03-10T10:00:00Z"
    }
  ]
}
```

#### Create floor
```http
POST /floors
Content-Type: application/json

{
  "name": "Tầng 5",
  "description": "Khu vực lắp ráp"
}
```

### Machines

#### List machines by floor
```http
GET /floors/{floor_id}/machines
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "floor_id": 5,
      "name": "Máy 1",
      "model": "PLC-S7-1500",
      "location": "Dãy A"
    }
  ]
}
```

#### Get machine details
```http
GET /machines/{machine_id}
```

### Errors

#### List errors by machine
```http
GET /machines/{machine_id}/errors
```

**Query Parameters:**
- `severity` - Filter by severity (low, medium, high, critical)
- `status` - Filter by status (active, resolved, all)

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "error_code": "ERR_INV_001",
      "error_name": "Lỗi biến tần",
      "description": "Biến tần không khởi động được",
      "severity": "critical",
      "symptoms": ["Không có điện ra", "Hiển thị lỗi E.OC"],
      "created_at": "2026-03-10T10:00:00Z"
    }
  ]
}
```

#### Create error
```http
POST /machines/{machine_id}/errors
Content-Type: application/json

{
  "error_code": "ERR_INV_001",
  "error_name": "Lỗi biến tần",
  "description": "Biến tần không khởi động được",
  "severity": "critical",
  "symptoms": ["Không có điện ra", "Hiển thị lỗi E.OC"]
}
```

#### Search errors
```http
GET /errors/search?q={query}
```

**Query Parameters:**
- `q` - Search query
- `floor_id` - Filter by floor
- `limit` - Results limit (default: 10)

### Solutions

#### Get solutions for error
```http
GET /errors/{error_id}/solutions
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "error_id": 1,
      "steps": [
        {
          "order": 1,
          "description": "Kiểm tra nguồn điện",
          "checklist": ["A. Đo điện áp 3 pha", "B. Kiểm tra aptomat"],
          "warning": "Ngắt nguồn trước khi kiểm tra"
        }
      ],
      "success_rate": 95.5,
      "estimated_time": 15,
      "is_ai_generated": false
    }
  ]
}
```

#### Create solution
```http
POST /errors/{error_id}/solutions
Content-Type: application/json

{
  "steps": [
    {
      "order": 1,
      "description": "Kiểm tra nguồn điện",
      "checklist": ["A. Đo điện áp", "B. Kiểm tra cầu chì"],
      "warning": "Ngắt nguồn trước khi kiểm tra"
    }
  ],
  "required_tools": ["Đồng hồ vạn năng", "Tua vít"],
  "estimated_time": 15
}
```

### AI Recommendations

#### Get AI recommendations
```http
POST /ai/recommend
Content-Type: application/json

{
  "error_id": 1,
  "context": {
    "floor": 5,
    "machine": "Máy 1",
    "symptoms": ["Biến tần không khởi động"]
  }
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "recommendations": [
      {
        "solution_id": 1,
        "similarity_score": 0.95,
        "confidence": 0.92,
        "reason": "Tương tự lỗi ERR_INV_001 trên Máy 2 Tầng 3"
      }
    ],
    "alternatives": [...]
  }
}
```

#### Find similar errors
```http
POST /ai/similar
Content-Type: application/json

{
  "error_id": 1,
  "threshold": 0.75
}
```

### Interactions (Feedback)

#### Record interaction
```http
POST /interactions
Content-Type: application/json

{
  "error_id": 1,
  "solution_id": 1,
  "applied_solution": true,
  "success": true,
  "actual_time": 20,
  "feedback": "Giải pháp hiệu quả, đã sửa được",
  "rating": 5
}
```

#### Get interaction history
```http
GET /errors/{error_id}/interactions
```

### Import/Export

#### Import from Excel
```http
POST /import/excel
Content-Type: multipart/form-data

file: <excel-file.xlsx>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "imported_errors": 50,
    "imported_solutions": 45,
    "errors": []
  }
}
```

#### Export to Excel
```http
GET /export/excel?floor_id={floor_id}
```

## Error Responses

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": {
      "error_code": "Error code is required"
    }
  }
}
```

## Status Codes

| Code | Description |
|------|-------------|
| 200 | OK |
| 201 | Created |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Internal Server Error |
