FROM python:3.11-slim
RUN pip install --upgrade pip
RUN pip install notebook
RUN mkdir -p /notebook
EXPOSE 8888
ENV JUPYTER_OPTIONS="--port=8888 --allow-root --notebook-dir='/notebook' --NotebookApp.allow_origin='*' --NotebookApp.ip=0.0.0.0"
CMD jupyter notebook $JUPYTER_OPTIONS
