# Bản Sơ Bộ Giải Pháp AI Xử Lý Lỗi Công Nghiệp

**Ngày:** 10/03/2026  
**Khách hàng:** [Tên công ty]  
**Dự án:** Hệ thống AI hỗ trợ xử lý lỗi thiết bị công nghiệp

---

## 1. Tổng Quan Giải Pháp

### 1.1 Mô tả hệ thống
Hệ thống AI sử dụng kiến trúc **RAG (Retrieval-Augmented Generation)** kết hợp với **LLM chạy local** để:
- Lưu trữ và quản lý dữ liệu lỗi theo cấu trúc: **Tầng → Máy → Lỗi**
- Tìm kiếm thông minh các ca lỗi tương tự trong lịch sử
- Đề xuất giải pháp sửa chữa tự động bằng AI
- Học tập từ phản hồi của kỹ thuật viên để cải thiện đề xuất
- Hỗ trợ **đa ngôn ngữ** (Tiếng Việt, Tiếng Anh, Tiếng Nhật)

### 1.2 Kiến trúc hệ thống

```
┌─────────────────────────────────────────────────────────────┐
│  GIAO DIỆN NGƯỜI DÙNG (Web/Mobile)                          │
│  • Chọn Tầng → Máy → Xem lỗi                                │
│  • Hiển thị giải pháp AI với checklist A, B, C...          │
│  • Đánh giá độ hiệu quả                                     │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│  AI ENGINE (Local - Không cần internet)                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  ChromaDB    │→ │  RAG Pipeline│→ │  Ollama LLM  │      │
│  │  (Vector DB) │  │  (Retrieve + │  │  (Generate   │      │
│  │              │  │   Generate)  │  │   Solution)  │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│  DỮ LIỆU (Local)                                            │
│  • PostgreSQL (Thông tin lỗi, máy, giải pháp)              │
│  • Redis (Cache, Session)                                   │
│  • File Excel (Import/Export)                               │
└─────────────────────────────────────────────────────────────┘
```

### 1.3 Quy trình sử dụng

```
Bước 1: Kỹ thuật viên phát hiện lỗi máy
    ↓
Bước 2: Vào hệ thống → Chọn Tầng → Chọn Máy
    ↓
Bước 3: Xem danh sách lỗi đã có hoặc thêm lỗi mới
    ↓
Bước 4: AI tự động tìm các ca lỗi tương tự trong lịch sử
    ↓
Bước 5: AI đề xuất giải pháp với các bước kiểm tra (A, B, C...)
    ↓
Bước 6: Kỹ thuật viên áp dụng và đánh dấu checklist
    ↓
Bước 7: Đánh giá độ hiệu quả (Thành công/Không thành công)
    ↓
Bước 8: AI học từ phản hồi để cải thiện lần sau
```

---

## 2. Công Nghệ Sử Dụng

| Thành phần | Công nghệ | Mục đích |
|------------|-----------|----------|
| **Frontend** | React + Next.js | Giao diện web |
| **Backend** | Node.js / FastAPI | API server |
| **Database** | PostgreSQL | Lưu trữ dữ liệu |
| **Vector DB** | ChromaDB | Tìm kiếm tương đồng |
| **AI/ML** | Python + RAG | Xử lý ngôn ngữ tự nhiên |
| **LLM** | Ollama (Local) | Sinh giải pháp AI |
| **Embeddings** | sentence-transformers | Chuyển text thành vector |
| **Full-text Search** | PostgreSQL FTS | Tìm kiếm toàn văn |
| **Cache** | Redis | Tăng tốc độ |
| **Ngôn ngữ** | VI/EN/JP | Đa ngôn ngữ |

**Quan trọng:** Tất cả chạy **LOCAL** - Không cần kết nối API bên ngoài, không phụ thuộc internet.

---

## 3. Phân Loại Lỗi Hỗ Trợ

### 3.1 Theo thiết bị
- ✅ Biến tần (Inverter)
- ✅ PLC (Programmable Logic Controller)
- ✅ Động cơ (Motor)
- ✅ Cảm biến (Sensor)
- ✅ Bơm (Pump)
- ✅ Hệ thống điện
- ✅ Hệ thống cơ khí

### 3.2 Theo mức độ nghiêm trọng
| Mức độ | Màu | Mô tả | Ví dụ |
|--------|-----|-------|-------|
| 🔴 Critical | Đỏ | Dừng sản xuất ngay | Lỗi biến tần, mất điện |
| 🟡 High | Vàng | Cần xử lý trong 1-2h | Quá nhiệt, rung động |
| 🟠 Medium | Cam | Xử lý trong ca làm việc | Cảnh báo bảo trì |
| 🟢 Low | Xanh | Lên lịch bảo trì | Hiệu suất giảm nhẹ |

---

## 4. Tính Năng Chính

### 4.1 Quản lý dữ liệu
- Import dữ liệu từ file Excel
- Quản lý theo cấu trúc: Tầng → Máy → Lỗi
- Lưu trữ giải pháp với checklist chi tiết
- Phân loại theo thiết bị và mức độ nghiêm trọng

### 4.2 AI & Machine Learning
- Tìm kiếm lỗi tương tự bằng Vector Search
- Đề xuất giải pháp tự động bằng LLM
- Hiển thị độ tin cậy (Confidence Score) cho mỗi đề xuất
- Học tập từ phản hồi của kỹ thuật viên
- Hỗ trợ đa ngôn ngữ (VI/EN/JP)

### 4.3 Giao diện người dùng
- Chọn nhanh Tầng/Máy
- Tìm kiếm toàn văn (Full-text Search)
- Hiển thị checklist từng bước (A, B, C...)
- Đánh dấu hoàn thành từng bước
- Đánh giá độ hiệu quả sau sửa chữa

### 4.4 Báo cáo & Thống kê
- Thống kê tần suất lỗi
- Thời gian xử lý trung bình
- Hiệu quả của AI (tỷ lệ thành công)
- Xuất báo cáo Excel/PDF

---

## 5. Lợi Ích Dự Kiến

- Giảm đáng kể thời gian tìm kiếm giải pháp xử lý lỗi
- Nâng cao tỷ lệ sửa chữa thành công ngay lần đầu
- Giảm thời gian downtime máy móc
- Giảm chi phí đào tạo kỹ thuật viên mới nhờ knowledge base tập trung
- Tập trung hóa kiến thức xử lý lỗi, tránh phụ thuộc vào cá nhân

---

## 6. Kế Hoạch Phát Triển

### Giai đoạn 1: MVP
- Database + API cơ bản
- Web UI chọn Tầng/Máy/Xem lỗi
- Import Excel
- Setup Ollama LLM local

### Giai đoạn 2: AI Integration
- RAG pipeline (Retrieval + Generation)
- Vector search đa ngôn ngữ
- Feedback collection
- Multi-language UI

### Giai đoạn 3: Advanced
- Mobile app (React Native)
- Real-time notifications
- Analytics dashboard
- Hybrid search

### Giai đoạn 4: Enterprise
- SSO integration
- Offline mode
- Custom model fine-tuning

---

## 7. Yêu Cầu Phần Cứng (Server Local)

| Thành phần | Tối thiểu | Khuyến nghị |
|------------|-----------|-------------|
| CPU | 4 cores | 8+ cores |
| RAM | 8 GB | 16+ GB |
| Ổ cứng | 50 GB SSD | 100+ GB SSD |
| GPU | Không bắt buộc | 8+ GB VRAM (nhanh hơn) |
| Hệ điều hành | Linux/Ubuntu | Ubuntu 22.04 LTS |

**Lưu ý:** Có thể chạy trên máy tính cá nhân (Windows/Mac) cho testing.

---

## 8. Yêu Cầu Hiệu Năng

| Chỉ số | Mục tiêu | Ghi chú |
|--------|----------|---------|
| Tìm kiếm lỗi | < 500ms | Vector search + retrieval |
| Phản hồi AI (LLM) | < 3s | Sinh giải pháp bằng LLM local |
| Tải trang | < 2s | First contentful paint |
| Người dùng đồng thời | 100+ | Cùng lúc trên hệ thống |
| Uptime | 99.9% | Theo SLA |

---

## 9. Chi Phí Dự Kiến

### Chi phí một lần (Development)
- Phát triển hệ thống: Theo báo giá dự án
- Setup server: 1-2 ngày công

### Chi phí vận hành (Hàng năm)
| Hạng mục | Chi phí | Ghi chú |
|----------|---------|---------|
| Phần mềm | **$0** | Open source (MIT License) |
| Server | Theo cấu hình | Chạy local, không cần cloud |
| API bên ngoài | **$0** | Không cần OpenAI, etc. |
| Bảo trì | Theo hợp đồng | Cập nhật, hỗ trợ |

**Ưu điểm:** Không phụ thuộc vào dịch vụ cloud, không có chi phí API recurring.

---

## 10. Rủi Ro & Giải Pháp

| Rủi ro | Mức độ | Giải pháp |
|--------|--------|-----------|
| Thiếu dữ liệu train | Cao | Bắt đầu với rule-based, tích lũy dần |
| Chất lượng data đầu vào | Trung bình | Validation + training người dùng |
| Phần cứng không đủ mạnh | Trung bình | Tối ưu model hoặc nâng cấp RAM |
| Người dùng không adopt | Trung bình | Training + gamification |

---

## 11. Cam Kết & Bảo Hành

- ✅ Bảo hành phần mềm: 12 tháng
- ✅ Hỗ trợ kỹ thuật: Theo SLA
- ✅ Training người dùng: Bao gồm trong dự án
- ✅ Documentation đầy đủ

---

**Người lập:** trieugia008@gmail.com  
**Ngày lập:** 10/03/2026

---

*Xem thêm: [CHECKLIST_KHACH_HANG.md](./CHECKLIST_KHACH_HANG.md) - Danh sách công việc khách hàng cần chuẩn bị*
