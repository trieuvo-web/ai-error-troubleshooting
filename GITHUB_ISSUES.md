# GitHub Project Issues

## 📋 Issue Tracker

### Phase 1: MVP (4-6 tuần)

#### P0 - Critical
- [ ] **#1** Setup project structure và monorepo
  - Labels: `setup`, `p0`, `phase-1`
  - Estimate: 4h
  - Description: Khởi tạo project với backend, frontend, ai-service

- [ ] **#2** Database schema và migrations
  - Labels: `database`, `p0`, `phase-1`
  - Estimate: 6h
  - Description: Thiết kế schema cho Error, Solution, Interaction tables

- [ ] **#3** Backend API - Error CRUD endpoints
  - Labels: `backend`, `api`, `p0`, `phase-1`
  - Estimate: 8h
  - Description: REST API cho tạo, đọc, sửa, xóa lỗi

- [ ] **#4** Import Excel functionality
  - Labels: `backend`, `import`, `p0`, `phase-1`
  - Estimate: 6h
  - Description: Upload và parse file Excel chứa danh sách lỗi

- [ ] **#5** Frontend - Floor/Machine selector UI
  - Labels: `frontend`, `ui`, `p0`, `phase-1`
  - Estimate: 8h
  - Description: Component chọn Tầng → Máy với dropdown

- [ ] **#6** Frontend - Error list và detail view
  - Labels: `frontend`, `ui`, `p0`, `phase-1`
  - Estimate: 10h
  - Description: Hiển thị danh sách lỗi và chi tiết lỗi

- [ ] **#7** Frontend - Solution display với checklist
  - Labels: `frontend`, `ui`, `p0`, `phase-1`
  - Estimate: 8h
  - Description: Hiển thị giải pháp với các bước checklist A, B, C...

#### P1 - High Priority
- [ ] **#8** Search functionality (basic)
  - Labels: `feature`, `p1`, `phase-1`
  - Estimate: 6h
  - Description: Tìm kiếm lỗi theo keyword

- [ ] **#9** User authentication
  - Labels: `feature`, `auth`, `p1`, `phase-1`
  - Estimate: 8h
  - Description: Login/logout cho kỹ thuật viên

---

### Phase 2: AI Integration (4-6 tuần)

#### P0 - Critical
- [ ] **#10** Setup Vector Database (ChromaDB/Pinecone)
  - Labels: `ai`, `database`, `p0`, `phase-2`
  - Estimate: 6h
  - Description: Cài đặt và configure vector database

- [ ] **#11** Text embedding service
  - Labels: `ai`, `ml`, `p0`, `phase-2`
  - Estimate: 10h
  - Description: Tạo embeddings cho error descriptions sử dụng sentence-transformers

- [ ] **#12** Similarity search API
  - Labels: `ai`, `api`, `p0`, `phase-2`
  - Estimate: 8h
  - Description: API tìm lỗi tương tự dựa trên cosine similarity

- [ ] **#13** AI solution recommendation
  - Labels: `ai`, `feature`, `p0`, `phase-2`
  - Estimate: 12h
  - Description: Đề xuất giải pháp dựa trên lỗi tương tự trong lịch sử

#### P1 - High Priority
- [ ] **#14** Feedback collection system
  - Labels: `feature`, `ai`, `p1`, `phase-2`
  - Estimate: 8h
  - Description: Form đánh giá độ hiệu quả của giải pháp

- [ ] **#15** Learning loop implementation
  - Labels: `ai`, `ml`, `p1`, `phase-2`
  - Estimate: 12h
  - Description: Cập nhật weights dựa trên feedback

- [ ] **#16** Confidence score display
  - Labels: `frontend`, `ui`, `p1`, `phase-2`
  - Estimate: 4h
  - Description: Hiển thị độ tin cậy của đề xuất AI

---

### Phase 3: Advanced Features (4-6 tuần)

- [ ] **#17** Mobile app (React Native)
  - Labels: `mobile`, `p1`, `phase-3`
  - Estimate: 40h
  - Description: App mobile cho kỹ thuật viên

- [ ] **#18** Real-time notifications
  - Labels: `feature`, `p2`, `phase-3`
  - Estimate: 8h
  - Description: Push notification khi có lỗi mới

- [ ] **#19** Analytics dashboard
  - Labels: `feature`, `analytics`, `p2`, `phase-3`
  - Estimate: 16h
  - Description: Báo cáo thống kê lỗi, hiệu suất

- [ ] **#20** Multi-language support
  - Labels: `feature`, `i18n`, `p2`, `phase-3`
  - Estimate: 10h
  - Description: Hỗ trợ tiếng Việt và tiếng Anh

---

### Phase 4: Enterprise (Ongoing)

- [ ] **#21** SSO integration
  - Labels: `enterprise`, `auth`, `p2`, `phase-4`
  - Estimate: 12h
  - Description: Single Sign-On với company LDAP/AD

- [ ] **#22** API for third-party integration
  - Labels: `enterprise`, `api`, `p2`, `phase-4`
  - Estimate: 10h
  - Description: Public API cho tích hợp hệ thống khác

- [ ] **#23** Offline mode
  - Labels: `enterprise`, `mobile`, `p2`, `phase-4`
  - Estimate: 20h
  - Description: Làm việc offline với sync khi có mạng

- [ ] **#24** Advanced ML models
  - Labels: `ai`, `ml`, `p2`, `phase-4`
  - Estimate: 40h
  - Description: Deep learning models cho complex patterns

---

## 🏷️ Label Definitions

| Label | Color | Description |
|-------|-------|-------------|
| `p0` | 🔴 Red | Critical - Must have |
| `p1` | 🟠 Orange | High priority |
| `p2` | 🟡 Yellow | Medium priority |
| `setup` | 🔵 Blue | Project setup |
| `backend` | 🟢 Green | Backend related |
| `frontend` | 🟣 Purple | Frontend related |
| `ai` | 🤖 AI | AI/ML related |
| `database` | 🗄️ Gray | Database related |
| `ui` | 🎨 Pink | UI/UX related |
| `api` | 📡 API | API related |
| `feature` | ✨ Feature | New feature |
| `bug` | 🐛 Bug | Bug fix |
| `phase-1` | 1️⃣ | Phase 1 |
| `phase-2` | 2️⃣ | Phase 2 |
| `phase-3` | 3️⃣ | Phase 3 |
| `phase-4` | 4️⃣ | Phase 4 |

---

## 📊 Project Statistics

- **Total Issues:** 24
- **Phase 1:** 9 issues (estimate: 64h ~ 8 days)
- **Phase 2:** 7 issues (estimate: 60h ~ 7.5 days)
- **Phase 3:** 4 issues (estimate: 74h ~ 9 days)
- **Phase 4:** 4 issues (estimate: 82h ~ 10 days)
- **Total Estimate:** ~280h (~35 days)
