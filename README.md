# Qwen3-0.6B GGUF Deployment on Pixel 6

[![Kaggle](https://img.shields.io/badge/Kaggle-Notebook-green)](https://www.kaggle.com/code/YOUR_USERNAME/qwen3-phone-deploy)
[![Tokens/s](https://img.shields.io/badge/Pixel_6-~25_tokens/s-orange)](https://unsloth.ai/docs/deploy-llms-phone)

Fine-tuned **Qwen3-0.6B** with Unsloth → exported to **GGUF Q4_K_M** → running **offline** on **Pixel 6** at ~25 tokens/s.

## 🚀 What you'll get
- ✅ **Full end-to-end pipeline**: Kaggle fine-tuning → GGUF export → Phone deployment
- ✅ **Production-ready**: Q4_K_M quantized, privacy-first, no internet required
- ✅ **Pixel 6 optimized**: Tested on Tensor SoC, ~400MB model size

## 📁 Project Structure
```
qwen3-mobile-executorch/
├── models/
│   ├── Qwen3-0.6B.Q4_K_M.gguf   # GGUF model (~400MB)
│   └── tokenizer.json           # Qwen3 tokenizer
├── kaggle/
│   └── qwen3-phone-deploy.ipynb # Full training + export notebook
├── deployment/
│   ├── adb_deploy.bat           # Windows deployment script
│   └── build-apk.md             # llama.cpp Android instructions
├── README.md
└── LICENSE                      # MIT License
```

## 🎯 Use Cases
- Offline AI agents
- Privacy-first mobile chatbots  
- AR/VR real-time LLM
- Enterprise on-device inference

## ⚡ Deploy in 5 minutes
```bash
adb push models/Qwen3-0.6B.Q4_K_M.gguf /data/local/tmp/models/
adb push models/tokenizer.json /data/local/tmp/models/
# Open PocketPal AI app → Import model → Chat!
```

## 📱 Recommended Apps
- **[PocketPal AI](https://play.google.com/store/apps/details?id=com.pocketpalai)** - Free, GGUF native
- **[MLC Chat](https://mlc.ai/mlc-llm/)** - Open source
- **Termux + llama.cpp** - CLI inference

**Built with [Unsloth](https://unsloth.ai) + [llama.cpp](https://github.com/ggerganov/llama.cpp)**

---

## 🏷️ Tags
```
unsloth, gguf, qwen3, mobile-llm, pixel6, android-ai, on-device-inference, edge-ai, quantization, llama-cpp
```
