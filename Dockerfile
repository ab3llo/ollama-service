# Google tutorial https://cloud.google.com/run/docs/tutorials/gpu-gemma2-with-ollama
FROM ollama/ollama:0.5.7

# Listen on all interfaces, port 8080
ENV OLLAMA_HOST 0.0.0.0:8081

# Store model weight files in /models
ENV OLLAMA_MODELS /models

# Reduce logging verbosity  
ENV OLLAMA_DEBUG false

# Never unload model weights from the GPU
ENV OLLAMA_KEEP_ALLIVE -1 

# Store the model weights in the container image
# Llamma 3.2 small models https://ollama.com/library/llama3.2
ENV MODEL llama3.2:1b
RUN ollama serve & sleep 5 && ollama pull $MODEL

ENTRYPOINT [ "ollama", "serve" ]