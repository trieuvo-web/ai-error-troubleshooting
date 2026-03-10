# AI Industrial Error Troubleshooting - Sample Data

## Excel Import Format

### Sheet 1: Errors (Lỗi)

| floor | machine_name | error_code | error_name | description | severity | symptoms | possible_causes | category | plc_code |
|-------|--------------|------------|------------|-------------|----------|----------|-----------------|----------|----------|
| 5 | Máy 1 | ERR_INV_001 | Lỗi biến tần | Biến tần không khởi động được, hiển thị lỗi E.OC | critical | Không có điện ra; Hiển thị E.OC | Quá dòng; Ngắn mạch đầu ra; Hỏng IGBT | Electrical | E.OC |
| 5 | Máy 1 | ERR_INV_002 | Lỗi nhiệt độ biến tần | Biến tần quá nhiệt, hiển thị E.OH | high | Hiển thị E.OH; Quạt không chạy | Tản nhiệt kém; Quạt hỏng; Nhiệt độ môi trường cao | Thermal | E.OH |
| 3 | Máy 2 | ERR_MOT_001 | Lỗi quá tải động cơ | Động cơ không quay, nóng bất thường | high | Động cơ nóng; Có mùi khét; Không quay | Quá tải cơ học; Hỏng vòng bi; Lệch tâm | Mechanical | - |
| 3 | Máy 2 | ERR_SEN_001 | Lỗi cảm biến nhiệt độ | Cảm biến báo nhiệt độ không chính xác | medium | Nhiệt độ hiển thị sai; Alarm liên tục | Cảm biến hỏng; Dây đứt; Nhiễu tín hiệu | Sensor | - |
| 1 | Máy 3 | ERR_PLC_001 | Lỗi communication PLC | PLC không giao tiếp với HMI | critical | HMI mất kết nối; Không điều khiển được | Dây cáp đứt; Sai địa chỉ; Noise | Communication | - |

### Sheet 2: Solutions (Giải pháp)

| error_code | step_order | step_description | checklist_items | warning | estimated_time_minutes | tools_required |
|------------|------------|------------------|-----------------|---------|----------------------|----------------|
| ERR_INV_001 | 1 | Kiểm tra nguồn điện đầu vào | A. Đo điện áp 3 pha (380V ±10%); B. Kiểm tra aptomat; C. Kiểm tra cầu chì | Ngắt nguồn trước khi kiểm tra | 5 | Đồng hồ vạn năng; Tua vít |
| ERR_INV_001 | 2 | Kiểm tra kết nối đầu ra | D. Kiểm tra dây điều khiển; E. Kiểm tra terminal; F. Đo điện trở cách điện | Đảm bảo biến tần đã tắt hoàn toàn | 10 | Đồng hồ vạn năng; Máy đo điện trở cách điện |
| ERR_INV_001 | 3 | Reset và test | G. Tắt nguồn 5 phút; H. Bật lại và test run; I. Kiểm tra thông số | Theo dõi nhiệt độ và dòng điện | 5 | - |
| ERR_INV_002 | 1 | Kiểm tra hệ thống tản nhiệt | A. Vệ sinh tản nhiệt; B. Kiểm tra quạt làm mát; C. Kiểm tra không gian thông gió | Tắt nguồn trước khi vệ sinh | 15 | Chổi; Khí nén; Tua vít |
| ERR_INV_002 | 2 | Kiểm tra nhiệt độ môi trường | D. Đo nhiệt độ phòng; E. Kiểm tra hệ thống điều hòa | Đảm bảo nhiệt độ < 40°C | 5 | Nhiệt kế |
| ERR_MOT_001 | 1 | Kiểm tra cơ khí | A. Kiểm tra vòng bi; B. Kiểm tra coupling; C. Kiểm tra tải | Ngắt nguồn và khóa tagout | 20 | Cờ lê; Búa gõ; Stethoscope |
| ERR_MOT_001 | 2 | Đo điện trở động cơ | D. Đo điện trở 3 pha; E. So sánh giá trị; F. Kiểm tra tiếp địa | Động cơ phải nguội | 10 | Đồng hồ vạn năng; Máy đo điện trở |

### Sheet 3: Machines (Máy móc)

| floor | machine_name | model | manufacturer | location | specifications |
|-------|--------------|-------|--------------|----------|----------------|
| 5 | Máy 1 | PLC-S7-1500 + G120 | Siemens | Dãy A, vị trí 1 | Power: 7.5kW; Voltage: 380V; Inverter: G120 |
| 5 | Máy 2 | PLC-S7-1200 + V20 | Siemens | Dãy A, vị trí 2 | Power: 3kW; Voltage: 380V; Inverter: V20 |
| 3 | Máy 1 | FX5U + FR-D720 | Mitsubishi | Khu đóng gói 1 | Power: 2.2kW; Voltage: 380V; Inverter: FR-D720 |
| 3 | Máy 2 | FX5U + FR-E720 | Mitsubishi | Khu đóng gói 2 | Power: 1.5kW; Voltage: 380V; Inverter: FR-E720 |
| 1 | Máy 1 | S7-1500 + MM440 | Siemens | Dãy sản xuất 1 | Power: 11kW; Voltage: 380V; Inverter: MM440 |

## Usage Instructions

1. Download template: `sample_data_template.xlsx`
2. Fill in your actual data following the format above
3. Go to Admin Panel → Import Data
4. Upload the Excel file
5. Review preview and confirm import

## Notes

- `floor`: Số tầng (1, 2, 3, ...)
- `severity`: low, medium, high, critical
- `step_order`: Thứ tự bước (1, 2, 3, ...)
- `checklist_items`: Ngăn cách bằng dấu chấm phẩy (;)
- `estimated_time_minutes`: Thờigian ước tính tính bằng phút
- Không để trống các cột bắt buộc: floor, machine_name, error_code, error_name
