# Checklist Công Việc Khách Hàng Cần Chuẩn Bị

**Dự án:** Hệ thống AI hỗ trợ xử lý lỗi thiết bị công nghiệp  
**Ngày:** 10/03/2026

---

## PHẦN 1: DỮ LIỆU (QUAN TRỌNG NHẤT)

### 1.1 Danh sách tầng/khu vực sản xuất
- [ ] Liệt kê tất cả các tầng (Floor 1, 2, 3...)
- [ ] Mô tả chức năng mỗi tầng
- [ ] Bản đồ sơ đồ tầng (nếu có)

**Mẫu:**
```
| Tầng | Tên khu vực | Mô tả |
|------|-------------|-------|
| 1 | Sản xuất chính | Dây chuyền lắp ráp |
| 3 | Đóng gói | Khu vực đóng gói SP |
| 5 | Kho nguyên liệu | Lưu trữ vật tư |
```

### 1.2 Danh sách máy móc thiết bị
- [ ] Tên máy (VD: VW-RH1, VW-RH2, VW-PG01)
- [ ] Model/Serial number
- [ ] Nhà sản xuất
- [ ] Vị trí (Tầng + Vị trí cụ thể)
- [ ] Thông số kỹ thuật cơ bản

**Mẫu:**
```
| Tầng | Tên máy | Model | Hãng | Vị trí | Công suất |
|------|---------|-------|------|--------|-----------|
| 5 | VW-RH1 | PLC-S7-1500 | Siemens | Dãy A-1 | 7.5kW |
| 5 | VW-RH2 | PLC-S7-1200 | Siemens | Dãy A-2 | 5.5kW |
| 3 | VW-PG01 | FX5U | Mitsubishi | Kho 1 | 3kW |
```

### 1.3 Danh sách lỗi và cách xử lý (ƯU TIÊN CAO)
- [ ] Mã lỗi (nếu có từ PLC)
- [ ] Tên lỗi (VD: "Lỗi biến tần 1/2 bơm nước rửa")
- [ ] Mô tả triệu chứng
- [ ] Nguyên nhân (nếu biết)
- [ ] Cách xử lý chi tiết theo từng bước (A, B, C...)
- [ ] Công cụ cần thiết
- [ ] Thờigian xử lý ước tính
- [ ] Mức độ nghiêm trọng (Critical/High/Medium/Low)

**Mẫu chi tiết:**
```
Tầng: 5
Máy: VW-RH1
Mã lỗi: ERR_INV_001
Tên lỗi: Lỗi biến tần 1/2 bơm nước rửa
Triệu chứng: Biến tần không khởi động, hiển thị E.OC
Mức độ: Critical

Cách xử lý:
Bước 1: Kiểm tra nguồn điện (5 phút)
  A. Đo điện áp 3 pha (380V ±10%)
  B. Kiểm tra aptomat
  C. Kiểm tra cầu chì
  ⚠️ Cảnh báo: Ngắt nguồn trước khi kiểm tra

Bước 2: Kiểm tra kết nối (3 phút)
  D. Kiểm tra dây điều khiển
  E. Kiểm tra terminal

Công cụ cần thiết: Đồng hồ vạn năng, tua vít
Thờigian xử lý: 15-20 phút
```

### 1.4 File Excel tổng hợp
- [ ] Tạo file Excel theo mẫu đính kèm
- [ ] Sheet 1: Danh sách máy
- [ ] Sheet 2: Danh sách lỗi
- [ ] Sheet 3: Giải pháp xử lý

**Mẫu file Excel sẽ được cung cấp sau khi ký hợp đồng**

---

## PHẦN 2: NHÂN SỰ (Tối ưu cho team nhỏ)

### 2.1 Team kỹ thuật tối thiểu (1-2 ngườ)

**Phương án 1: 1 ngườ (All-in-one)**
- [ ] **Kỹ sư/kỹ thuật viên** - Vừa quản lý hệ thống, vừa nhập dữ liệu, vừa sử dụng
  - Quyền: Admin + Engineer + Operator
  - Nhiệm vụ: Cài đặt, nhập dữ liệu, sử dụng, báo cáo

**Phương án 2: 2 ngườ (Khuyến nghị)**
- [ ] **Ngườiquản lý hệ thống** - IT/Engineer (0.5-1 ngườ)
  - Cài đặt và cấu hình ban đầu
  - Quản lý server và backup
  - Training ngườidùng
  - Cập nhật dữ liệu lỗi mới
  
- [ ] **Ngườisử dụng chính** - Operator/Technician (1 ngườ)
  - Sử dụng hệ thống hàng ngày
  - Nhập feedback sau sửa chữa
  - Báo cáo lỗi hệ thống

### 2.2 Phân quyền đơn giản (2 cấp)
| Vai trò | Ngườidùng | Quyền hạn |
|---------|-----------|-----------|
| **Admin** | 1 ngườ (IT/Engineer) | Toàn quyền: cài đặt, nhập dữ liệu, sử dụng, báo cáo |
| **User** | 1+ ngườ (Operator) | Xem lỗi, áp dụng giải pháp, feedback |

**Lưu ý:**
- Team nhỏ 1-2 ngườ vẫn vận hành tốt hệ thống
- Không cần IT chuyên sâu, engineer có thể tự quản lý
- Có thể mở rộng thêm ngườisau khi hệ thống ổn định

---

## PHẦN 3: HẠ TẦNG CÔNG NGHỆ

### 3.1 Máy chủ (Server)
**Tùy chọn 1: Máy chủ vật lý**
- [ ] Máy chủ đáp ứng yêu cầu:
  - CPU: 8+ cores
  - RAM: 16+ GB
  - SSD: 100+ GB
- [ ] Hệ điều hành: Ubuntu 22.04 LTS (khuyến nghị)
- [ ] Kết nối mạng LAN
- [ ] Địa chỉ IP tĩnh

**Tùy chọn 2: Chạy trên máy tính cá nhân (POC)**
- [ ] PC/MAC để test trước
- [ ] Cấu hình: 16GB RAM, 50GB disk trống

### 3.2 Mạng nội bộ
- [ ] Mạng LAN ổn định
- [ ] Wifi cho kỹ thuật viên (nếu dùng mobile)
- [ ] Cổng mở: 3000, 3001, 3002, 5432, 6379, 8000, 11434

### 3.3 Thiết bị đầu cuối
- [ ] Máy tính bàn/laptop cho kỹ sư
- [ ] Máy tính bảng/điện thoại cho kỹ thuật viên (Phase 2)
- [ ] Máy quét mã QR (optional)

---

## PHẦN 4: TÀI LIỆU

### 4.1 Tài liệu kỹ thuật hiện có
- [ ] Manual máy móc (PDF)
- [ ] Sơ đồ điện (Electrical diagrams)
- [ ] Lịch sử bảo trì (Maintenance logs)
- [ ] Báo cáo lỗi cũ (Error reports)

### 4.2 Quy trình hiện tại
- [ ] Quy trình báo cáo lỗi hiện tại
- [ ] Quy trình sửa chữa
- [ ] Checklist bảo trì định kỳ
- [ ] Contact list nhà cung cấp

---

## PHẦN 5: QUY TRÌNH TRIỂN KHAI

### Giai đoạn 1: Chuẩn bị (Tuần 1)
- [ ] Họp kickoff
- [ ] Thu thập dữ liệu lỗi
- [ ] Chuẩn bị server
- [ ] Xác định team dự án

### Giai đoạn 2: Phát triển MVP (Tuần 2-5)
- [ ] Review UI/UX mockup
- [ ] Import dữ liệu test
- [ ] Test chức năng cơ bản
- [ ] Training team kỹ thuật

### Giai đoạn 3: Pilot (Tuần 6-8)
- [ ] Triển khai tại 1-2 tầng
- [ ] Thu thập feedback
- [ ] Điều chỉnh giải pháp
- [ ] Training toàn bộ nhân viên

### Giai đoạn 4: Go-live (Tuần 9-10)
- [ ] Triển khai toàn bộ nhà máy
- [ ] Hỗ trợ vận hành
- [ ] Bàn giao tài liệu
- [ ] Ký nghiệm thu

---

## PHẦN 6: CAM KẾT TỪ KHÁCH HÀNG

### 6.1 Về dữ liệu
- [ ] Đảm bảo dữ liệu lỗi chính xác, đầy đủ
- [ ] Cập nhật dữ liệu mới khi có lỗi phát sinh
- [ ] Review và xác nhận giải pháp AI đề xuất

### 6.2 Về nhân sự
- [ ] Sắp xếp nhân sự tham gia training
- [ ] Chỉ định ngườiphụ trách dự án
- [ ] Đảm bảo team sử dụng hệ thống đều đặn

### 6.3 Về thờigian
- [ ] Tham gia các buổi họp review
- [ ] Phản hồi yêu cầu trong 24h
- [ ] Dành thờigian test hệ thống

---

## PHẦN 7: CHECKLIST TỔNG HỢP

### Trước khi bắt đầu dự án (Pre-kickoff)
- [ ] Xác nhận ngân sách dự án
- [ ] Ký hợp đồng/PO
- [ ] Cung cấp danh sách tầng/máy ban đầu
- [ ] Chuẩn bị server hoặc PC test
- [ ] Xác nhận team dự án từ phía khách hàng

### Trong quá trình phát triển (Development)
- [ ] Cung cấp dữ liệu lỗi (ít nhất 20-30 ca lỗi)
- [ ] Review và approve UI/UX design
- [ ] Test chức trên môi trường staging
- [ ] Tham gia training sessions

### Trước khi go-live (Pre-launch)
- [ ] Xác nhận dữ liệu production
- [ ] Training toàn bộ ngườidùng
- [ ] Chuẩn bị kế hoạch rollback (nếu cần)
- [ ] Xác nhận bảo trì sau triển khai

---

## MẪU FILE EXCEL CHUẨN BỊ

### Sheet 1: MACHINES (Máy móc)
```
| floor | machine_name | model | manufacturer | location | specs |
|-------|--------------|-------|--------------|----------|-------|
| 5 | VW-RH1 | PLC-S7-1500 | Siemens | Tầng 5, Dãy A | 7.5kW |
| 5 | VW-RH2 | PLC-S7-1200 | Siemens | Tầng 5, Dãy B | 5.5kW |
| 3 | VW-PG01 | FX5U | Mitsubishi | Tầng 3, Kho 1 | 3kW |
```

### Sheet 2: ERRORS (Lỗi)
```
| floor | machine_name | error_code | error_name | description | severity |
|-------|--------------|------------|------------|-------------|----------|
| 5 | VW-RH1 | ERR_INV_001 | Lỗi biến tần | Không khởi động | critical |
| 5 | VW-RH2 | ERR_MOT_002 | Lỗi động cơ | Quá nhiệt | high |
```

### Sheet 3: SOLUTIONS (Giải pháp)
```
| error_code | step_order | step_desc | checklist | warning | time_min |
|------------|------------|-----------|-----------|---------|----------|
| ERR_INV_001 | 1 | Kiểm tra nguồn | A. Đo điện áp; B. Cầu chì | Ngắt nguồn | 5 |
| ERR_INV_001 | 2 | Kiểm tra kết nối | C. Dây điều khiển | - | 3 |
```

---

## LIÊN HỆ & HỖ TRỢ

**Để bắt đầu dự án, vui lòng gửi:**
1. File Excel dữ liệu theo mẫu trên
2. Xác nhận cấu hình server
3. Danh sách team tham gia

**Mọi thắc mắc vui lòng liên hệ:**
- Email: [support@example.com]
- Phone: [Số điện thoại]

---

**Ngườilập:** OpenCode Agent  
**Ngày lập:** 10/03/2026  
**Phiên bản:** 1.0

---

*Checklist này sẽ được cập nhật theo tiến độ dự án*
