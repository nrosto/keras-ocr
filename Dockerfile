FROM tensorflow/tensorflow:latest-gpu

WORKDIR /tf

RUN apt-get update && apt-get install -y libgl1-mesa-glx

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]