# GitHub Workflows

## Pylint Workflow

### Mô tả
Workflow này chạy pylint để kiểm tra chất lượng code Python trong dự án. Nó sử dụng cấu hình từ `pyproject.toml` và tự động chạy khi có push hoặc pull request.

### Cấu hình
- **Python version**: 3.10.6 (khớp chính xác với `pyproject.toml`)
- **Dependency management**: Poetry với caching để tăng tốc
- **Target directories**: `multi_agent/` và `server/` (với kiểm tra tồn tại)
- **Pylint config**: Tự động detect từ `pyproject.toml`

### Khi nào workflow chạy
- Push vào **tất cả các branch**
- **Tất cả pull request** (bất kể target branch)

### Output
- **Console logs**: Hiển thị kết quả pylint với format màu sắc
- **JSON report**: Upload như artifact để review sau
- **Smart summary**: Tóm tắt số lượng issues với emoji và thông báo rõ ràng

### Tính năng an toàn
- ✅ **Kiểm tra thư mục tồn tại** trước khi chạy pylint
- ✅ **--exit-zero**: Không fail CI khi có lỗi pylint
- ✅ **Error handling**: Graceful fallback khi có vấn đề
- ✅ **Cache dependencies**: Tăng tốc độ chạy với Poetry cache

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
2. Click vào workflow run muốn xem
3. Check logs của từng step
4. Download "pylint-report" artifact để xem chi tiết JSON

### Cách customize
Để thay đổi cấu hình pylint, chỉnh sửa phần `[tool.pylint]` trong `pyproject.toml`. Workflow sẽ tự động sử dụng cấu hình mới. 