FROM vllm/vllm-openai:v0.11.2

ENV DO_NOT_TRACK=1

RUN pip check 2>&1 \
    | grep -v "pygobject.*pycairo" \
    | grep -E "^[a-zA-Z]" && exit 1 || echo "✓ Dependencies OK (ignoring known-safe issues)"

COPY --chmod=775 endpoints-entrypoint.sh entrypoint.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
CMD [""]
