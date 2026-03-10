# AI Industrial Error Troubleshooting System

Hệ thống AI hỗ trợ xử lý lỗi công nghiệp - Tự động đề xuất giải pháp sửa chữa dựa trên dữ liệu lịch sử.

## 🎯 Tính năng chính

- 🔍 **Tìm kiếm thông minh** - Tìm lỗi tương tự bằng AI/ML
- 🏭 **Quản lý theo vị trí** - Tổ chức theo Tầng → Máy → Lỗi
- 🤖 **Đề xuất tự động** - AI gợi ý cách xử lý với độ tin cậy
- 📊 **Học tập liên tục** - Cải thiện từ phản hồi kỹ thuật viên
- 📱 **Giao diện trực quan** - Web và Mobile app

## 🏗️ Kiến trúc hệ thống

```
Frontend (React/Next.js) → API (Node.js) → Database (PostgreSQL + Vector DB)
                                    ↓
                              AI/ML (Python)
```

## 📋 Các Phase phát triển

- **Phase 1:** MVP cơ bản (Web UI + Database + Import Excel)
- **Phase 2:** AI Integration (Similarity Search + Learning Loop)
- **Phase 3:** Mobile App + Advanced Features
- **Phase 4:** Enterprise (SSO, API, Offline)

## 📖 Tài liệu

- [PRD - Product Requirements](./PRD.md)
- [API Documentation](./docs/API.md) (WIP)
- [Database Schema](./docs/DB_SCHEMA.md) (WIP)

## 🚀 Quick Start

```bash
# Clone repository
git clone https://github.com/your-org/ai-error-troubleshooting.git
cd ai-error-troubleshooting

# Setup backend
cd backend
npm install
cp .env.example .env
npm run dev

# Setup frontend
cd ../frontend
npm install
npm run dev
```

## 📊 Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React, Next.js, TailwindCSS |
| Backend | Node.js, Express, TypeScript |
| Database | PostgreSQL, ChromaDB |
| AI/ML | Python, scikit-learn, sentence-transformers |
| Mobile | React Native |

## 🤝 Đóng góp

Xem [CONTRIBUTING.md](./CONTRIBUTING.md) để biết thêm chi tiết.

## 📄 License

[MIT License](./LICENSE)

---

Built with ❤️ for industrial maintenance teams.
