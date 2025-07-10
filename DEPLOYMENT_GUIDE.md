# SDL2 Guessing Game - Deployment Guide

## 🚀 Quick Start

### Deploy in 3 Steps:

1. **Build the game**:
   ```bash
   julia +1.10 game.jl
   ```

2. **Create deployment bundle**:
   ```bash
   julia deploy.jl
   ```

3. **Transfer to target machine**:
   ```bash
   scp sdl2-guessing-game-*.tar.gz user@target:/destination/
   ```

### On Target Machine:

```bash
# Extract and run
tar -xzf sdl2-guessing-game-*.tar.gz
./run_game.sh
```

## 📦 What's Included

The deployment bundle contains:
- ✅ **Self-contained executables** (no Julia runtime needed)
- ✅ **All SDL2 libraries** (libSDL2, libiconv, libcharset)
- ✅ **Automatic library path setup** (RPATH + run script)
- ✅ **Comprehensive documentation** (README with troubleshooting)
- ✅ **Cross-distribution compatibility** (works on most Linux systems)

## 🎯 Target System Requirements

**Minimum**:
- Linux x86_64
- GLIBC 2.17+ (2012+)
- Basic graphics (X11/Wayland)
- ~15MB disk space

**Tested On**:
- Ubuntu 14.04+
- Fedora 20+
- Debian 8+
- CentOS 7+
- Arch Linux

## 🔧 Common Issues & Solutions

### Library Not Found Error
```bash
# Solution: Use the run script
./run_game.sh
```

### Permission Denied
```bash
# Solution: Fix permissions
chmod +x guessing_game run_game.sh
```

### No Graphics Display
```bash
# Solution: Set video driver
SDL_VIDEODRIVER=x11 ./guessing_game
```

## 📋 Deployment Checklist

**Before Deployment**:
- [ ] Game compiles: `julia +1.10 game.jl`
- [ ] Deployment works: `julia deploy.jl`
- [ ] Archive created: `*.tar.gz` file exists
- [ ] Test locally: `cd game_bundle && ./run_game.sh`

**On Target Machine**:
- [ ] Archive extracts without errors
- [ ] Game runs with `./run_game.sh`
- [ ] All controls work (0-9 keys, ESC)
- [ ] Colors change correctly (blue → red/green)

## 🎮 How to Play

1. **Start**: `./run_game.sh`
2. **Goal**: Guess the number 7
3. **Controls**: Press 0-9 to guess, ESC to quit
4. **Feedback**: 
   - Blue = waiting for input
   - Red = wrong guess
   - Green = correct guess (wins!)

## 📁 Bundle Contents

```
game_bundle/
├── guessing_game          # Main executable
├── complete_guess_game    # Alternative executable
├── run_game.sh           # Environment setup script
├── libs/                 # SDL2 libraries
│   ├── libSDL2-2.0.so.0
│   ├── libiconv.so.2
│   └── libcharset.so.1
├── README.md             # Detailed documentation
└── sdl_wrapper.c         # C source (reference)
```

## 💡 Pro Tips

1. **Always use `./run_game.sh`** for best compatibility
2. **Archive size**: ~3MB compressed, ~15MB extracted
3. **No installation required** on target machine
4. **Works offline** - no internet needed
5. **Portable** - can run from any directory

## 🔄 Alternative Deployment Methods

### Method 1: Direct Copy (Manual)
```bash
# Copy files manually
cp guessing_game complete_guess_game /target/
cp -r libs/ /target/
```

### Method 2: System Libraries (Smaller)
```bash
# Requires SDL2 installed on target
# Edit game.jl to use system_flags instead of portable_flags
```

## 📞 Support

If deployment fails:
1. Check system requirements
2. Verify archive integrity: `tar -tzf *.tar.gz`
3. Test locally first: `cd game_bundle && ./run_game.sh`
4. Check dependencies: `ldd guessing_game`

---

**🎯 Success**: Game runs without requiring Julia or manual library installation on target machine! 