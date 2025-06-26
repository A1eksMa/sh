# Jupyter Notebook

See more:
[Installing Jupyter: Get up and running on your computer](https://jupyter.org/install)

## Installation

Install the classic Jupyter Notebook with:
```bash
pip3 install notebook
```

To run the notebook:
```bash
jupyter notebook
```

## Docker

Dockerfile contains Jupyter Notebook based on Python 3.11: slim image.

Build container:
```bash
docker build -t jupyter .
```

Run container:
```bash
docker run -p 80:8888 jupyter
```
