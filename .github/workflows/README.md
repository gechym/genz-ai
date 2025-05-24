# GitHub Workflows - Code Quality Suite

## 🔥 STRICT MODE - ZERO TOLERANCE QUALITY CONTROL

Bộ workflows này đảm bảo **CHẤT LƯỢNG CODE HOÀN HẢO** với requirement nghiêm ngặt:
- ✅ **CHỈ PASS KHI TẤT CẢ TOOLS ĐẠT ĐIỂM TUYỆT ĐỐI**
- ❌ **FAIL KHI CÓ BẤT KỲ WARNING/ERROR NÀO**

## 📋 Available Workflows

### 1. 🏆 **Code Quality (All-in-One)** - `code-quality.yml`
**WORKFLOW CHÍNH - RECOMMENDED** 
- Chạy **TẤT CẢ** tools cùng lúc: Ruff + MyPy + Pylint
- **Fastest execution** - chỉ 1 job setup
- **Comprehensive report** - tất cả results trong 1 chỗ
- **Fail-fast** - dừng ngay khi có lỗi đầu tiên

### 2. 📊 **Pylint** - `pylint.yml`
**CODE QUALITY ANALYSIS**
- ✅ **PASS**: Score = 10.00/10
- ❌ **FAIL**: Score < 10.00/10
- Sử dụng config từ `pyproject.toml`

### 3. 🎨 **Ruff** - `ruff.yml`
**FORMATTING & LINTING**
- ✅ **PASS**: Zero linting issues + perfect formatting
- ❌ **FAIL**: Any format or lint violations
- Fast Rust-based checker

### 4. 🔬 **MyPy** - `mypy.yml`
**TYPE SAFETY**
- ✅ **PASS**: Zero type errors
- ❌ **FAIL**: Any type violations
- Generates JSON, HTML, text reports

## ⚡ **BEHAVIOR**

### 🎯 Strict Requirements
| Tool | Requirement | Action if Failed |
|------|-------------|-----------------|
| **Ruff Format** | Perfect formatting | ❌ Block merge |
| **Ruff Lint** | Zero violations | ❌ Block merge |
| **MyPy** | Zero type errors | ❌ Block merge |
| **Pylint** | Score = 10.00/10 | ❌ Block merge |

### 🔄 Workflow Triggers
**TẤT CẢ workflows chạy khi:**
- Push vào **bất kỳ branch nào**
- **Bất kỳ pull request nào**

## 🚀 **GETTING STARTED**

### Option 1: Use All-in-One (Recommended)
```bash
# Check all tools locally before pushing
poetry run ruff format multi_agent/ server/
poetry run ruff check multi_agent/ server/ --fix
poetry run mypy multi_agent/ server/
poetry run pylint multi_agent/ server/
```

### Option 2: Individual Tools
```bash
# Format code
poetry run ruff format multi_agent/ server/

# Check linting  
poetry run ruff check multi_agent/ server/

# Type checking
poetry run mypy multi_agent/ server/

# Quality score
poetry run pylint multi_agent/ server/
```

## 🎉 **SUCCESS OUTPUT**
Khi tất cả pass, bạn sẽ thấy:
```
🎉 ==============================================
🏆 ALL CODE QUALITY CHECKS PASSED!
==============================================
✅ Ruff Format: PERFECT
✅ Ruff Linting: CLEAN  
✅ MyPy Types: SAFE
✅ Pylint Score: 10/10
==============================================
🚀 Code is ready for merge! 🚀
==============================================
```

## 📊 **CONFIGURATION**

### Python Version
- **3.10.6** (khớp chính xác với `pyproject.toml`)

### Target Directories
- `multi_agent/`
- `server/`

### Config Files
- **Pylint**: `[tool.pylint]` trong `pyproject.toml`
- **Ruff**: `[tool.ruff]` trong `pyproject.toml`  
- **MyPy**: `[tool.mypy]` trong `pyproject.toml`

## 🛠️ **COMMON FIXES**

### Ruff Issues
```bash
# Auto-format
poetry run ruff format .

# Auto-fix linting
poetry run ruff check . --fix
```

### MyPy Issues
```bash
# Add type hints
def function(param: int) -> str:
    return str(param)

# Import types
from typing import List, Dict, Optional
```

### Pylint Issues
```bash
# Missing newline at EOF
echo "" >> file.py

# Import order
# Use isort or rearrange imports

# Add docstrings
def function():
    """Function description."""
    pass
```

## 📈 **REPORTS & ARTIFACTS**

### Individual Workflows
- `pylint-report` - JSON + text reports
- `ruff-reports` - JSON + text reports
- `mypy-reports` - JSON + HTML + text reports

### All-in-One Workflow
- `all-quality-reports` - Comprehensive reports from all tools

## 🎯 **WORKFLOW RECOMMENDATIONS**

### For Daily Development
- **Use All-in-One workflow** - fastest and most comprehensive

### For Debugging Specific Issues
- **Use individual workflows** - detailed focus on specific tool

### For CI/CD Pipeline
- **Disable individual workflows** if using All-in-One
- Or **keep both** for redundancy

## ⚠️ **IMPORTANT NOTES**

1. **Zero Tolerance**: No warnings or errors allowed
2. **Perfect Scores Only**: Pylint must be exactly 10.00/10
3. **Type Safety**: All type annotations required for MyPy
4. **Consistent Formatting**: Ruff format enforced strictly

## 🔧 **TROUBLESHOOTING**

### Workflow Fails?
1. Run tools locally first
2. Fix all reported issues
3. Verify all tools pass with 0 issues
4. Push clean code

### Multiple Tools Failing?
1. Start with **Ruff format** - fixes formatting
2. Then **Ruff check** - fixes basic linting
3. Then **MyPy** - adds type hints
4. Finally **Pylint** - ensures perfect score

**🎯 Remember: Only PERFECT code gets merged!** 🚀 