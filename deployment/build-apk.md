# Running GGUF Models on Android

This guide explains how to run your Qwen3 GGUF model on Android.

## Option 1: PocketPal AI (Easiest)

1. Install [PocketPal AI](https://play.google.com/store/apps/details?id=com.pocketpalai) from Play Store
2. Push model to phone:
   ```bash
   adb push Qwen3-0.6B.Q4_K_M.gguf /sdcard/Download/
   ```
3. Open app → Import → Select the GGUF file
4. Chat!

## Option 2: Termux + llama.cpp

```bash
# Install Termux from F-Droid (not Play Store)
pkg update && pkg upgrade
pkg install cmake git clang

# Clone and build llama.cpp
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make -j4

# Run model
./llama-cli -m /data/local/tmp/models/Qwen3-0.6B.Q4_K_M.gguf \
  -p "Hello! What can you help me with?" \
  -n 100
```

## Option 3: Build llama.cpp Android App

```bash
# Clone repo
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp

# Build for Android
mkdir build-android && cd build-android
cmake .. -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-28
make -j4
```

## Performance (Pixel 6)

| Model | Size | Speed |
|-------|------|-------|
| Q4_K_M | ~400MB | ~25 tok/s |
| Q8_0 | ~800MB | ~15 tok/s |
| F16 | ~1.2GB | ~8 tok/s |

## Troubleshooting

- **"Permission denied"**: Run `adb shell chmod 644 /path/to/model.gguf`
- **Out of memory**: Use smaller quantization (Q4_K_S or Q2_K)
- **Slow inference**: Close other apps, ensure not thermal throttling

## Resources

- [llama.cpp GitHub](https://github.com/ggerganov/llama.cpp)
- [GGUF Format Spec](https://github.com/ggerganov/ggml/blob/master/docs/gguf.md)
- [Quantization Guide](https://huggingface.co/docs/transformers/main/en/quantization)
