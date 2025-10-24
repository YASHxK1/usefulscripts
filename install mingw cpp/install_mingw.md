## ⚙️ How to use

1. **Save the script as** `install_mingw.sh`
2. **Give execute permission:**
   ```bash
   chmod +x install_mingw.sh
   ```
3. **Run it:**
   ```bash
   ./install_mingw.sh
   ```

---

## ✅ After installation (for testing)

To compile a Windows program:

```bash
x86_64-w64-mingw32-g++ -o hello.exe hello.cpp
```

It will generate a `hello.exe` executable that runs on Windows.
