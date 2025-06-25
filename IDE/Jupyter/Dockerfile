FROM python:3.11-slim
RUN pip install --upgrade pip
RUN pip install notebook
RUN mkdir -p /notebook
COPY ./notebook
CMD ["jupyter", "notebook", "--port=8888", "-ip=0.0.0.0", "--allow-root", "--notebook-dir=/notebook"]
