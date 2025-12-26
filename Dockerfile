FROM ollama/ollama:latest

# Listen on all interfaces, port 8080
ENV OLLAMA_HOST 0.0.0.0:8080

# Store model weight files in /models
ENV OLLAMA_MODELS /models

# Reduce logging verbosity
ENV OLLAMA_DEBUG false

# Never unload model weights from the GPU
#ENV OLLAMA_KEEP_ALIVE -1
ENV OLLAMA_KEEP_ALIVE 100

# Store the model weights in the container image
ENV MODEL1 gemma3:4b-it-qat
ENV MODEL2 gemma3:12b-it-qat
ENV MODEL3 nomic-embed-text
RUN ollama serve & sleep 5 && ollama pull $MODEL1 && ollama pull $MODEL2 && ollama pull $MODEL3

# Start Ollama
ENTRYPOINT ["ollama", "serve"]
