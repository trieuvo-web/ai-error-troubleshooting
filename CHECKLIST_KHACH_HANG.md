# Danh Sách Công Việc Khách Hàng Cần Chuẩn Bị

**Dự án:** Hệ thống AI hỗ trợ xử lý lỗi thiết bị công nghiệp  
**Ngày:** 10/03/2026  
**Đơn vị thực hiện:** trieugia008@gmail.com

> Tài liệu này liệt kê những thông tin và điều kiện cần chuẩn bị từ phía khách hàng để dự án triển khai thuận lợi.
> Chi tiết giải pháp xem tại: [SOLUTION_OVERVIEW.md](./SOLUTION_OVERVIEW.md)

---

## PHẦN 1: DỮ LIỆU (QUAN TRỌNG NHẤT)

Dữ liệu lỗi là "nhiên liệu" cho AI. Càng nhiều dữ liệu chất lượng, AI càng đề xuất chính xác (Continuous Learning).

### 1.1 Danh sách tầng/khu vực sản xuất
- [ ] Liệt kê tất cả các tầng hoặc khu vực sản xuất
- [ ] Mô tả ngắn chức năng mỗi tầng/khu vực
- [ ] Sơ đồ mặt bằng (nếu có)

**Mẫu tham khảo:**

| Tầng | Tên khu vực | Mô tả |
|------|-------------|-------|
| 1 | Sản xuất chính | Dây chuyền lắp ráp |
| 3 | Đóng gói | Khu vực đóng gói sản phẩm |
| 5 | Kho nguyên liệu | Lưu trữ vật tư |

### 1.2 Danh sách máy móc thiết bị
- [ ] Tên máy (VD: VW-RH1, VW-RH2, VW-PG01)
- [ ] Model / Serial number
- [ ] Nhà sản xuất
- [ ] Vị trí đặt máy (Tầng + vị trí cụ thể)
- [ ] Thông số cơ bản (công suất, loại máy)

**Mẫu tham khảo:**

| Tầng | Tên máy | Model | Hãng sản xuất | Vị trí | Công suất |
|------|---------|-------|---------------|--------|-----------|
| 5 | VW-RH1 | PLC-S7-1500 | Siemens | Dãy A-1 | 7.5kW |
| 5 | VW-RH2 | PLC-S7-1200 | Siemens | Dãy A-2 | 5.5kW |
| 3 | VW-PG01 | FX5U | Mitsubishi | Kho 1 | 3kW |

### 1.3 Danh sách lỗi và cách xử lý (ƯU TIÊN CAO NHẤT)

Đây là dữ liệu được đưa vào **Knowledge Base** để AI học và đề xuất giải pháp. Mỗi ca lỗi cần có:

- [ ] Mã lỗi (nếu máy có hiển thị)
- [ ] Tên lỗi
- [ ] Triệu chứng (máy biểu hiện như thế nào?)
- [ ] Nguyên nhân (nếu biết)
- [ ] Cách xử lý chi tiết theo từng bước (A, B, C...)
- [ ] Công cụ cần dùng
- [ ] Thời gian xử lý ước tính
- [ ] Mức độ nghiêm trọng (Critical / High / Medium / Low)

**Mẫu chi tiết cho 1 ca lỗi:**
```
Tầng: 5
Máy: VW-RH1
Mã lỗi: ERR_INV_001
Tên lỗi: Lỗi biến tần 1/2 bơm nước rửa
Triệu chứng: Biến tần không khởi động, màn hình hiển thị E.OC
Mức độ: Critical

Cách xử lý:
Bước 1: Kiểm tra nguồn điện (5 phút)
  A. Đo điện áp 3 pha (380V ±10%)
  B. Kiểm tra aptomat
  C. Kiểm tra cầu chì
  ⚠️ Lưu ý: Ngắt nguồn trước khi kiểm tra

Bước 2: Kiểm tra kết nối (3 phút)
  D. Kiểm tra dây điều khiển
  E. Kiểm tra terminal

Công cụ cần thiết: Đồng hồ vạn năng, tua vít
Thời gian xử lý: 15-20 phút
```

> **Lưu ý:** Cần ít nhất **20-30 ca lỗi** với đầy đủ thông tin (triệu chứng + bước xử lý + kết quả) để AI có thể đề xuất chính xác. Đây là dữ liệu ban đầu cho Knowledge Base — sau triển khai, hệ thống sẽ tự tích lũy thêm thông qua **Continuous Learning** từ phản hồi của kỹ thuật viên.

### 1.4 Ngôn ngữ sử dụng (Multilingual AI)

Hệ thống hỗ trợ đa ngôn ngữ (VI/EN/JP). Để cấu hình phù hợp, vui lòng xác nhận:

- [ ] Dữ liệu lỗi sẽ nhập bằng ngôn ngữ nào? (Tiếng Việt / Tiếng Anh / Tiếng Nhật)
- [ ] Giao diện hệ thống mong muốn ngôn ngữ nào?
- [ ] Tài liệu máy móc (manual) bằng ngôn ngữ nào?
- [ ] Kỹ thuật viên quen dùng ngôn ngữ nào khi tra cứu?

> AI sử dụng **Multilingual NLP** nên kỹ thuật viên có thể tìm kiếm bằng bất kỳ ngôn ngữ nào được hỗ trợ, kể cả khi dữ liệu gốc ở ngôn ngữ khác.

### 1.5 File Excel tổng hợp
- [ ] Cung cấp file Excel tổng hợp dữ liệu lỗi (theo cấu trúc các mục trên)
  - Sheet 1: Danh sách máy (theo mẫu mục 1.2)
  - Sheet 2: Danh sách lỗi (theo mẫu mục 1.3)
  - Sheet 3: Giải pháp xử lý (theo mẫu mục 1.3)

---

## PHẦN 2: NHÂN SỰ

Hệ thống được thiết kế đơn giản, **chỉ cần 1-2 người** là có thể vận hành. AI đóng vai trò **Copilot** — hỗ trợ kỹ thuật viên, không thay thế.

### 2.1 Phương án nhân sự

**Phương án 1: 1 người (phù hợp nhà máy nhỏ)**
- [ ] **1 kỹ sư/kỹ thuật viên** kiêm quản lý hệ thống và sử dụng
  - Nhiệm vụ: Nhập dữ liệu, sử dụng tra cứu, xem báo cáo

**Phương án 2: 2 người (khuyến nghị)**
- [ ] **1 người quản lý** (kỹ sư / IT)
  - Cài đặt và cấu hình ban đầu (có sự hỗ trợ từ chúng tôi)
  - Nhập và cập nhật dữ liệu lỗi mới vào Knowledge Base
  - Hướng dẫn người dùng khác
  
- [ ] **1+ người sử dụng** (kỹ thuật viên / operator)
  - Tra cứu lỗi và giải pháp hàng ngày qua AI
  - Đánh giá kết quả sau sửa chữa (giúp AI cải thiện qua Feedback Loop)

### 2.2 Phân quyền

| Vai trò | Ai dùng | Quyền hạn |
|---------|---------|-----------|
| **Admin** | Kỹ sư / IT (1 người) | Nhập dữ liệu, cấu hình, xem báo cáo, quản lý người dùng |
| **User** | Kỹ thuật viên (1+ người) | Tra cứu lỗi, xem giải pháp AI, đánh giá kết quả |

> Không cần chuyên viên IT riêng. Kỹ sư bảo trì có thể tự quản lý hệ thống.

---

## PHẦN 3: HẠ TẦNG

Hệ thống chạy **On-Premise** (trên server nội bộ), không cần internet, đảm bảo **Data Privacy** — dữ liệu không ra khỏi nhà máy.

### 3.1 Máy chủ (Server)

**Lựa chọn 1: Server riêng (cho triển khai chính thức)**
- [ ] Một máy chủ hoặc PC với cấu hình:
  - CPU: 16+ cores (tối thiểu 8 cores)
  - RAM: 32+ GB (tối thiểu 16 GB)
  - Ổ cứng: 200+ GB SSD (tối thiểu 100 GB)
  - GPU: 8+ GB VRAM (không bắt buộc, có GPU thì AI phản hồi nhanh hơn ~5 lần)
- [ ] Hệ điều hành: Ubuntu hoặc Windows
- [ ] Kết nối mạng LAN nội bộ
- [ ] IP cố định trong mạng nội bộ

**Lựa chọn 2: Dùng PC có sẵn (cho giai đoạn demo/test)**
- [ ] PC hoặc laptop: RAM 16GB, ổ cứng trống 100GB
- [ ] Không cần mua thêm thiết bị

> **Tại sao cần cấu hình này?** Hệ thống chạy LLM (AI model) trực tiếp trên server. LLM cần ~5-6GB RAM riêng, cộng với các dịch vụ khác (database, search engine, web server) tổng cộng cần tối thiểu 16GB để hoạt động ổn định.

### 3.2 Mạng nội bộ
- [ ] Mạng LAN ổn định trong nhà máy
- [ ] Wifi (nếu kỹ thuật viên dùng điện thoại/tablet để tra cứu)

> Hệ thống hoạt động như **Edge AI** — không cần internet. Chỉ cần mạng LAN nội bộ để các thiết bị truy cập vào server.

### 3.3 Thiết bị cho người dùng
- [ ] Máy tính bàn hoặc laptop cho kỹ sư
- [ ] Điện thoại hoặc tablet cho kỹ thuật viên (giai đoạn sau, không bắt buộc)

### 3.4 Bảo mật & Backup
- [ ] Công ty có yêu cầu đặc biệt về bảo mật dữ liệu không?
- [ ] Có hệ thống backup dữ liệu sẵn không? (tần suất, nơi lưu)
- [ ] Có cần tích hợp với hệ thống đăng nhập hiện tại của công ty không?

> Vì là **On-Premise AI**, dữ liệu lỗi và giải pháp luôn nằm trong server nội bộ, không gửi ra bên ngoài — khác biệt cơ bản so với các giải pháp AI Cloud.

---

## PHẦN 4: TÀI LIỆU HIỆN CÓ

Các tài liệu này sẽ được đưa vào Knowledge Base để AI có thêm ngữ cảnh khi đề xuất giải pháp.

### 4.1 Tài liệu kỹ thuật
- [ ] Manual máy móc (PDF hoặc bản cứng)
- [ ] Sơ đồ điện
- [ ] Lịch sử bảo trì (sổ ghi chép, file Excel, v.v.)
- [ ] Báo cáo lỗi cũ (nếu có)

### 4.2 Quy trình hiện tại
- [ ] Hiện tại khi gặp lỗi, kỹ thuật viên xử lý theo quy trình nào?
- [ ] Có checklist bảo trì định kỳ không?
- [ ] Có danh sách liên hệ nhà cung cấp thiết bị không?

---

## PHẦN 5: QUY TRÌNH TRIỂN KHAI

### Giai đoạn 1: Chuẩn bị
- [ ] Họp khởi động dự án (online hoặc trực tiếp)
- [ ] Khách hàng cung cấp dữ liệu lỗi theo mẫu
- [ ] Chuẩn bị server hoặc PC test

### Giai đoạn 2: MVP — Knowledge Base + Basic AI
- [ ] Xem và góp ý giao diện (UI/UX)
- [ ] Import dữ liệu vào Knowledge Base
- [ ] Dùng thử tra cứu lỗi cơ bản và phản hồi
- [ ] Triển khai On-Premise LLM trên server

### Giai đoạn 3: Full RAG Pipeline + Chạy thử (Pilot)
- [ ] Kích hoạt Semantic Search + AI-generated Solutions
- [ ] Triển khai thử tại 1-2 tầng/khu vực
- [ ] Kỹ thuật viên sử dụng thực tế, đánh giá kết quả AI (Feedback Loop)
- [ ] Điều chỉnh theo phản hồi

### Giai đoạn 4: Triển khai chính thức
- [ ] Mở rộng cho toàn bộ nhà máy
- [ ] Hướng dẫn sử dụng cho toàn bộ nhân viên
- [ ] Bàn giao tài liệu hướng dẫn
- [ ] Nghiệm thu

---

## PHẦN 6: CAM KẾT TỪ KHÁCH HÀNG

### 6.1 Về dữ liệu
- [ ] Cung cấp dữ liệu lỗi chính xác, đầy đủ theo mẫu
- [ ] Cập nhật dữ liệu mới khi có lỗi phát sinh (giúp AI Continuous Learning)
- [ ] Xem xét và xác nhận giải pháp mà AI đề xuất (Human-in-the-Loop)

### 6.2 Về nhân sự
- [ ] Sắp xếp nhân sự tham gia hướng dẫn sử dụng
- [ ] Chỉ định 1 người phụ trách liên lạc dự án
- [ ] Khuyến khích nhân viên sử dụng hệ thống và đánh giá kết quả thường xuyên

### 6.3 Về phối hợp
- [ ] Tham gia các buổi họp review khi cần
- [ ] Phản hồi yêu cầu trong thời gian hợp lý
- [ ] Dành thời gian test và góp ý hệ thống

---

## BƯỚC TIẾP THEO

Để bắt đầu dự án, vui lòng gửi cho chúng tôi:

1. **File Excel dữ liệu** — theo cấu trúc mục 1.1 ~ 1.3
2. **Xác nhận cấu hình server** hoặc PC dùng để test
3. **Tên người phụ trách** dự án từ phía khách hàng

**Liên hệ:** trieugia008@gmail.com

---

**Người lập:** trieugia008@gmail.com  
**Ngày lập:** 10/03/2026  
**Phiên bản:** 1.2
