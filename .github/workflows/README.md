# GitHub Workflows

## Pylint Workflow - STRICT MODE

### Mô tả
Workflow này chạy pylint với **YÊU CẦU NGHIÊM NGẶT 10/10** để kiểm tra chất lượng code Python. Workflow sẽ **FAIL** nếu score không đạt 10.00/10.

### ⚠️ REQUIREMENT NGHIÊM NGẶT
- **CHỈ PASS KHI SCORE = 10.00/10** ✅
- **FAIL KHI SCORE < 10.00/10** ❌
- Không chấp nhận code có bất kỳ warning hay error nào

### Cấu hình
- **Python version**: 3.10.6 (khớp chính xác với `pyproject.toml`)
- **Dependency management**: Poetry với caching để tăng tốc
- **Target directories**: `multi_agent/` và `server/` (với kiểm tra tồn tại)
- **Pylint config**: Tự động detect từ `pyproject.toml`
- **Score check**: Sử dụng Python để so sánh floating point chính xác

### Khi nào workflow chạy
- Push vào **tất cả các branch**
- **Tất cả pull request** (bất kể target branch)

### Behavior
- ✅ **Pass**: Khi score = 10.00/10 → Tích xanh
- ❌ **Fail**: Khi score < 10.00/10 → Tích đỏ, block merge
- 🔍 **Strict validation**: Không có tolerance cho bất kỳ issue nào

### Output
- **Score display**: Hiển thị score thực tế vs requirement
- **Detailed issues**: List tất cả issues cần fix (nếu có)
- **JSON + Text reports**: Upload như artifacts để review
- **Helpful hints**: Gợi ý cách fix các lỗi thường gặp

### Common Issues & Fixes
- **Missing newline**: Thêm dòng trống cuối file
- **Import order**: Sử dụng isort hoặc sắp xếp imports
- **Missing docstrings**: Thêm docstring cho functions/classes
- **Naming conventions**: Follow PEP8 naming

### Ignore patterns (từ pyproject.toml)
- `tests/`
- `.venv/`
- `.mypy_cache/`
- `.ruff_cache/`
- `server_old/`

### Disabled rules (từ pyproject.toml)
- `too-many-instance-attributes`
- `import-error`
- `too-few-public-methods`
- `missing-module-docstring`
- và nhiều rules khác...

### Cách xem kết quả
1. Vào tab "Actions" trong GitHub repository
2. Check status: ✅ = Perfect, ❌ = Needs work
3. Click vào workflow run để xem chi tiết
4. Download artifacts để xem full report

### Cách đạt 10/10
1. Chạy local: `poetry run pylint multi_agent/ server/`
2. Fix tất cả issues được báo cáo
3. Verify score = 10.00/10 trước khi push
4. Push code và workflow sẽ pass với tích xanh

### Cách customize
Để thay đổi cấu hình pylint, chỉnh sửa phần `[tool.pylint]` trong `pyproject.toml`. Workflow sẽ tự động sử dụng cấu hình mới. 