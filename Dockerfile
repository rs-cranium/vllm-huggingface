FROM vllm/vllm-openai:v0.6.6.post1
# FROM vllm/vllm-openai:v0.11.0

ENV DO_NOT_TRACK=1

# Upgrade huggingface packages
RUN pip install --upgrade huggingface-hub transformers vllm

COPY --chmod=775 endpoints-entrypoint.sh entrypoint.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
CMD [""]
