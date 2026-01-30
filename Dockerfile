FROM vllm/vllm-openai:v0.6.6.post1
# FROM vllm/vllm-openai:v0.11.0

ENV DO_NOT_TRACK=1

RUN pip uninstall -y flashinfer || true
RUN pip install --upgrade vllm==0.11.2
RUN pip install --upgrade huggingface-hub==0.36.0 transformers==4.57.6

RUN pip check 2>&1 \
    | grep -v "pygobject.*pycairo" \
    | grep -v "outlines.*outlines-core" \
    | grep -E "^[a-zA-Z]" && exit 1 || echo "✓ Dependencies OK (ignoring known-safe issues)"

COPY --chmod=775 endpoints-entrypoint.sh entrypoint.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
CMD [""]
