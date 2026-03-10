# AI Industrial Error Troubleshooting System

## 📋 Product Requirements Document (PRD)

**Version:** 1.0  
**Date:** March 10, 2026  
**Status:** Draft  
**Author:** OpenCode Agent

---

## 1. Executive Summary

### 1.1 Product Vision
Xây dựng hệ thống AI thông minh giúp kỹ thuật viên/kỹ sư nhanh chóng tìm kiếm và xử lý lỗi máy móc trong môi trường công nghiệp. Hệ thống sử dụng Machine Learning để học từ các ca lỗi lịch sử và đề xuất giải pháp sửa chữa phù hợp.

### 1.2 Problem Statement
- Nhiều lỗi máy móc lặp lại nhưng kỹ thuật viên phải tìm kiếm thủ công trong tài liệu
- Kiến thức xử lý lỗi phân tán, không được tập trung hóa
- Thờigian downtime máy móc cao do quá trình troubleshooting kéo dài
- Khó theo dõi hiệu quả của các giải pháp đã áp dụng

### 1.3 Solution Overview
Hệ thống AI sẽ:
1. **Lưu trữ** thông tin lỗi theo cấu trúc: Tầng + Tên máy + Mã lỗi
2. **Tìm kiếm thông minh** các ca lỗi tương tự trong lịch sử
3. **Đề xuất** quy trình xử lý dựa trên AI/ML
4. **Học tập** từ phản hồi của kỹ thuật viên để cải thiện đề xuất
5. **Giao diện trực quan** cho việc tra cứu nhanh

---

## 2. User Stories

### 2.1 Primary Users

#### 👷 Kỹ thuật viên vận hành (Operator)
> "Tôi cần nhanh chóng tìm cách xử lý lỗi máy đang gặp phải"

**Acceptance Criteria:**
- [ ] Chọn tầng → chọn máy → xem danh sách lỗi hiện tại
- [ ] Xem chi tiết lỗi và các bước xử lý được đề xuất
- [ ] Đánh giá độ hiệu quả của giải pháp sau khi áp dụng

#### 🔧 Kỹ sư bảo trì (Maintenance Engineer)
> "Tôi muốn cập nhật và quản lý database các lỗi và giải pháp"

**Acceptance Criteria:**
- [ ] Thêm mới lỗi và cách xử lý vào hệ thống
- [ ] Import dữ liệu từ file Excel
- [ ] Xem báo cáo thống kê lỗi thường gặp

#### 🤖 AI System
> "Tôi cần học từ dữ liệu để cải thiện đề xuất"

**Acceptance Criteria:**
- [ ] Phân tích similarity giữa các ca lỗi
- [ ] Cập nhật model khi có dữ liệu mới
- [ ] Theo dõi độ chính xác của đề xuất

---

## 3. System Architecture

### 3.1 High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Frontend (Web/Mobile)                     │
├─────────────────────────────────────────────────────────────┤
│  Dashboard  │  Error Lookup  │  Admin Panel  │  Reports     │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                      Backend API (REST/GraphQL)              │
├─────────────────────────────────────────────────────────────┤
│  Auth Service  │  Error Service  │  AI Service  │  Search   │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                      Data Layer                              │
├─────────────────────────────────────────────────────────────┤
│  PostgreSQL  │  Vector DB (Pinecone/Chroma)  │  Redis Cache │
└─────────────────────────────────────────────────────────────┘
```

### 3.2 Core Components

#### 3.2.1 Error Management Module
| Feature | Description | Priority |
|---------|-------------|----------|
| Error CRUD | Thêm, sửa, xóa thông tin lỗi | P0 |
| Bulk Import | Import từ Excel/CSV | P0 |
| Error Classification | Phân loại lỗi theo loại máy, mức độ | P1 |

#### 3.2.2 AI/ML Module
| Feature | Description | Priority |
|---------|-------------|----------|
| Similarity Search | Tìm lỗi tương tự dựa trên embeddings | P0 |
| Solution Ranking | Xếp hạng giải pháp theo hiệu quả | P0 |
| Learning Loop | Cập nhật model từ feedback | P1 |
| Confidence Score | Hiển thị độ tin cậy của đề xuất | P1 |

#### 3.2.3 User Interface Module
| Feature | Description | Priority |
|---------|-------------|----------|
| Floor-Machine Selector | Dropdown chọn tầng và máy | P0 |
| Error List View | Danh sách lỗi với filter | P0 |
| Solution Display | Hiển thị bước xử lý chi tiết | P0 |
| Feedback Form | Đánh giá độ hiệu quả | P1 |

---

## 4. Data Model

### 4.1 Core Entities

#### Error (Lỗi)
```typescript
interface Error {
  id: string;
  floor: number;              // Tầng (1, 2, 3...)
  machineId: string;          // ID máy
  machineName: string;        // Tên máy
  errorCode: string;          // Mã lỗi (VD: ERR_INV_001)
  errorName: string;          // Tên lỗi (VD: "Lỗi biến tần")
  errorDescription: string;   // Mô tả chi tiết
  symptoms: string[];         // Triệu chứng
  severity: 'low' | 'medium' | 'high' | 'critical';
  createdAt: Date;
  updatedAt: Date;
}
```

#### Solution (Giải pháp)
```typescript
interface Solution {
  id: string;
  errorId: string;            // Liên kết đến Error
  steps: SolutionStep[];      // Các bước xử lý
  estimatedTime: number;      // Thờigian ước tính (phút)
  requiredTools: string[];    // Công cụ cần thiết
  successRate: number;        // Tỷ lệ thành công (%)
  appliedCount: number;       // Số lần áp dụng
  verifiedBy: string[];       // Ngườixác nhận
}

interface SolutionStep {
  order: number;
  description: string;
  checklist: string[];        // Các mục cần kiểm tra (A, B, C...)
  warning?: string;           // Cảnh báo nếu có
}
```

#### Interaction (Tương tác)
```typescript
interface Interaction {
  id: string;
  errorId: string;
  solutionId: string;
  operatorId: string;
  timestamp: Date;
  appliedSolution: boolean;   // Có áp dụng giải pháp không
  success: boolean;           // Có thành công không
  feedback?: string;          // Góp ý thêm
  duration?: number;          // Thờigian thực tế (phút)
}
```

### 4.2 AI Embeddings Schema

```typescript
interface ErrorEmbedding {
  errorId: string;
  embedding: number[];        // Vector embedding (384-1536 dims)
  metadata: {
    floor: number;
    machineType: string;
    errorCategory: string;
    keywords: string[];
  };
}
```

---

## 5. User Interface Design

### 5.1 Main Workflow

```
┌────────────────────────────────────────────────────────────┐
│  1. CHỌN VỊ TRÍ                                           │
│     ┌──────────────┐    ┌──────────────┐                   │
│     │   Tầng 5    │ →  │   Máy 1     │                   │
│     └──────────────┘    └──────────────┘                   │
├────────────────────────────────────────────────────────────┤
│  2. DANH SÁCH LỖI                                         │
│     ┌────────────────────────────────────────────────────┐ │
│     │ 🔴 ERR_INV_001 - Lỗi biến tần (Critical)          │ │
│     │ 🟡 ERR_MOT_003 - Lỗi động cơ (High)               │ │
│     │ 🟢 ERR_SEN_012 - Cảm biến nhiệt độ (Low)          │ │
│     └────────────────────────────────────────────────────┘ │
├────────────────────────────────────────────────────────────┤
│  3. CHI TIẾT & GIẢI PHÁP                                  │
│     ┌────────────────────────────────────────────────────┐ │
│     │ Lỗi: ERR_INV_001 - Lỗi biến tần                   │ │
│     │ Mô tả: Biến tần không khởi động được              │ │
│     │                                                      │ │
│     │ 💡 GIẢI PHÁP ĐỀ XUẤT (Độ tin cậy: 95%)            │ │
│     │                                                      │ │
│     │ Bước 1: Kiểm tra nguồn điện đầu vào               │ │
│     │   □ A. Đo điện áp 3 pha                           │ │
│     │   □ B. Kiểm tra aptomat                           │ │
│     │                                                      │ │
│     │ Bước 2: Kiểm tra kết nối                          │ │
│     │   □ C. Kiểm tra dây điều khiển                    │ │
│     └────────────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────────┘
```

### 5.2 Wireframes

#### 5.2.1 Error Lookup Page
```
┌────────────────────────────────────────────────────┐
│  🏭 HỆ THỐNG HỖ TRỢ XỬ LÝ LỖI AI      [👤 User]   │
├────────────────────────────────────────────────────┤
│                                                    │
│  ┌────────────────────────────────────────────┐   │
│  │  🔍 Tìm kiếm lỗi...                        │   │
│  └────────────────────────────────────────────┘   │
│                                                    │
│  Chọn vị trí:                                      │
│  ┌──────────┐   ┌──────────┐   ┌──────────┐      │
│  │ Tầng ▼   │   │ Máy ▼    │   │ [Tìm]    │      │
│  └──────────┘   └──────────┘   └──────────┘      │
│                                                    │
│  ┌────────────────────────────────────────────┐   │
│  │ 📋 Lỗi đang hoạt động tại Tầng 5 - Máy 1  │   │
│  ├────────────────────────────────────────────┤   │
│  │ 🔴 ERR_INV_001  Lỗi biến tần    [Chi tiết]│   │
│  │    Thờigian: 2 phút | Độ ưu tiên: Cao    │   │
│  ├────────────────────────────────────────────┤   │
│  │ 🟡 ERR_MOT_003  Lỗi động cơ     [Chi tiết]│   │
│  │    Thờigian: 15 phút | Độ ưu tiên: TB    │   │
│  └────────────────────────────────────────────┘   │
│                                                    │
└────────────────────────────────────────────────────┘
```

#### 5.2.2 Solution Detail Page
```
┌────────────────────────────────────────────────────┐
│  ← Quay lại                              ERR_INV_001│
├────────────────────────────────────────────────────┤
│                                                    │
│  🔴 Lỗi biến tần - Tầng 5, Máy 1                  │
│  Mô tả: Biến tần không khởi động, hiển thị lỗi E.OC│
│                                                    │
│  ┌────────────────────────────────────────────┐   │
│  │  🤖 GIẢI PHÁP ĐỀ XUẤT BỞI AI              │   │
│  │  Độ tin cậy: 95% | Đã áp dụng: 45 lần     │   │
│  ├────────────────────────────────────────────┤   │
│  │                                            │   │
│  │  BƯỚC 1: Kiểm tra nguồn điện              │   │
│  │  ⏱️ 5 phút                                │   │
│  │                                            │   │
│  │  □ A. Đo điện áp 3 pha (380V ±10%)       │   │
│  │  □ B. Kiểm tra aptomat main              │   │
│  │  □ C. Kiểm tra cầu chì                   │   │
│  │                                            │   │
│  │  ⚠️ Cảnh báo: Ngắt nguồn trước khi kiểm   │   │
│  │                                            │   │
│  ├────────────────────────────────────────────┤   │
│  │  BƯỚC 2: Kiểm tra kết nối                 │   │
│  │  ⏱️ 3 phút                                │   │
│  │                                            │   │
│  │  □ D. Kiểm tra dây điều khiển            │   │
│  │  □ E. Kiểm tra terminal                  │   │
│  │                                            │   │
│  └────────────────────────────────────────────┘   │
│                                                    │
│  [✅ Đã xử lý thành công]  [❌ Không hiệu quả]    │
│                                                    │
│  💬 Góp ý thêm:                                   │
│  ┌────────────────────────────────────────────┐   │
│  │                                            │   │
│  └────────────────────────────────────────────┘   │
│                                                    │
└────────────────────────────────────────────────────┘
```

---

## 6. Technical Requirements

### 6.1 Tech Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| Frontend | React/Next.js | Web UI |
| Mobile | React Native | Mobile app |
| Backend | Node.js/FastAPI | API server |
| Database | PostgreSQL | Primary data |
| Vector DB | ChromaDB/Pinecone | Similarity search |
| AI/ML | Python + scikit-learn/TensorFlow | ML models |
| Cache | Redis | Session & cache |
| Search | Elasticsearch | Full-text search |

### 6.2 AI/ML Specifications

#### 6.2.1 Similarity Algorithm
- **Embedding Model:** sentence-transformers/all-MiniLM-L6-v2 (384 dims)
- **Similarity Metric:** Cosine similarity
- **Threshold:** 0.75 (75% match để đề xuất)
- **Fallback:** Keyword matching khi không có đủ data

#### 6.2.2 Learning Algorithm
- **Feedback Loop:** Weighted rating dựa trên success rate
- **Update Frequency:** Real-time với exponential moving average
- **Cold Start:** Rule-based cho lỗi chưa có data

### 6.3 Performance Requirements

| Metric | Target | Notes |
|--------|--------|-------|
| Search Response | < 500ms | Tìm lỗi tương tự |
| Page Load | < 2s | First contentful paint |
| Concurrent Users | 100+ | Cùng lúc |
| Uptime | 99.9% | SLA |

---

## 7. Implementation Phases

### Phase 1: MVP (4-6 tuần)
- [ ] Database schema và API cơ bản
- [ ] Web UI: Chọn tầng/máy → Xem lỗi → Xem giải pháp
- [ ] Import dữ liệu từ Excel
- [ ] Simple keyword search

### Phase 2: AI Integration (4-6 tuần)
- [ ] Vector embeddings cho lỗi
- [ ] Similarity search với AI
- [ ] Feedback collection
- [ ] Learning loop cơ bản

### Phase 3: Advanced Features (4-6 tuần)
- [ ] Mobile app
- [ ] Real-time notifications
- [ ] Analytics dashboard
- [ ] Multi-language support

### Phase 4: Enterprise (Ongoing)
- [ ] SSO integration
- [ ] API cho third-party
- [ ] Advanced ML models
- [ ] Offline mode

---

## 8. Sample Data Format

### 8.1 Excel Import Template

```
Sheet 1: Errors
| floor | machine_name | error_code | error_name     | description              | severity |
|-------|--------------|------------|----------------|--------------------------|----------|
| 5     | Máy 1        | ERR_INV_001| Lỗi biến tần   | Biến tần không khởi động | critical |
| 3     | Máy 2        | ERR_MOT_003| Lỗi động cơ    | Động cơ quá nhiệt        | high     |

Sheet 2: Solutions
| error_code | step_order | step_description           | checklist_items          |
|------------|------------|----------------------------|--------------------------|
| ERR_INV_001| 1          | Kiểm tra nguồn điện        | A. Đo điện áp; B. Cầu chì|
| ERR_INV_001| 2          | Kiểm tra kết nối           | C. Dây điều khiển        |
```

---

## 9. Success Metrics

### 9.1 KPIs

| Metric | Target | Measurement |
|--------|--------|-------------|
| Time to Resolution | -50% | So với trước khi có AI |
| First-Time Fix Rate | > 80% | Tỷ lệ sửa đúng lần đầu |
| User Adoption | > 70% | % kỹ thuật viên sử dụng |
| AI Accuracy | > 85% | Đề xuất được đánh giá tốt |

### 9.2 Feedback Loop Metrics

- **Recommendation Acceptance Rate:** % đề xuất được chọn áp dụng
- **Success After Feedback:** Tỷ lệ thành công sau khi có feedback
- **Learning Velocity:** Thờigian để AI cải thiện đề xuất

---

## 10. Risk Assessment

| Risk | Impact | Mitigation |
|------|--------|------------|
| Insufficient training data | High | Start với rule-based, tích lũy dần |
| Low user adoption | Medium | Training + gamification |
| Integration with legacy systems | Medium | API layer, gradual migration |
| Data quality issues | High | Validation + data cleaning tools |

---

## 11. Appendix

### 11.1 Glossary
- **PLC:** Programmable Logic Controller
- **Inverter (Biến tần):** Thiết bị điều khiển tốc độ động cơ
- **Error Code:** Mã lỗi từ hệ thống PLC/máy móc

### 11.2 References
- Similar systems: Augury, Uptake, SparkCognition
- ML approaches: Case-Based Reasoning (CBR), Retrieval-Augmented Generation (RAG)

---

**Document Status:** Draft v1.0  
**Next Review:** After Phase 1 completion  
**Owner:** Product Team
