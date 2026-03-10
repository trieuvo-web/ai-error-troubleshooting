# Contributing to AI Industrial Error Troubleshooting

Cảm ơn bạn đã quan tâm đến việc đóng góp cho dự án! 🎉

## 🚀 Bắt đầu

1. Fork repository này
2. Clone về máy: `git clone https://github.com/your-username/ai-error-troubleshooting.git`
3. Tạo branch mới: `git checkout -b feature/your-feature-name`
4. Cài đặt dependencies: `npm run install:all`

## 📝 Quy trình phát triển

### 1. Tạo Issue
- Mô tả rõ ràng vấn đề hoặc feature
- Gán label phù hợp
- Assign cho bản thân hoặc để unassigned

### 2. Phát triển
- Tuân thủ code style hiện có
- Viết test cho feature mới
- Đảm bảo không break existing tests

### 3. Commit
```bash
git add .
git commit -m "feat: add error search functionality

- Implement fuzzy search for error codes
- Add filters by floor and machine
- Update tests"
```

**Commit message format:**
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation
- `style:` - Formatting, missing semi colons, etc
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

### 4. Pull Request
- Tạo PR với title rõ ràng
- Mô tả những gì đã thay đổi
- Link đến issue liên quan
- Đợi review và merge

## 🏗️ Code Style

### TypeScript/JavaScript
- Sử dụng ESLint và Prettier
- Run `npm run lint` trước khi commit
- Type annotations cho tất cả functions

### Python
- Tuân thủ PEP 8
- Sử dụng type hints
- Docstrings cho classes và functions

## 🧪 Testing

```bash
# Run all tests
npm test

# Run backend tests only
npm run test:backend

# Run frontend tests only
npm run test:frontend

# Run with coverage
npm run test:coverage
```

## 📋 Checklist trước khi tạo PR

- [ ] Code đã được test locally
- [ ] Không có console.log hoặc debugger
- [ ] Đã viết/cập nhật tests
- [ ] Đã cập nhật documentation nếu cần
- [ ] Commit messages rõ ràng
- [ ] Branch đã rebase với main

## 🐛 Báo cáo Bug

Khi báo cáo bug, vui lòng cung cấp:

1. **Mô tả ngắn gọn** về bug
2. **Cách reproduce** - các bước để tái hiện
3. **Expected behavior** - kết quả mong đợi
4. **Actual behavior** - kết quả thực tế
5. **Screenshots** nếu có
6. **Environment:**
   - OS: [e.g. macOS, Windows, Linux]
   - Browser: [e.g. Chrome, Safari]
   - Version: [e.g. 22]

## 💡 Đề xuất Feature

Mở issue mới với label `enhancement` và mô tả:
- Vấn đề bạn đang gặp
- Giải pháp bạn đề xuất
- Alternatives đã cân nhắc

## 📞 Liên hệ

- Discord: [Link]
- Email: your-email@example.com

## 📄 License

Bằng việc đóng góp, bạn đồng ý rằng đóng góp của bạn sẽ được license dưới [MIT License](./LICENSE).

---

Cảm ơn bạn! 🙏
