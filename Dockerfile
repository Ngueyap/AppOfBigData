
FROM python:3.8 as base1

RUN mkdir -p /projet
WORKDIR /projet
RUN mkdir $(pwd)/image
RUN mkdir $(pwd)/prediction

COPY requirements.txt .

# Install modules 
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt 


# Copy model and script
COPY weather_classification_tp.py ./
COPY ResNet152V2-Weather-Classification-03.h5 ./
RUN pwd && ls -R


# run image
CMD ["python", "weather_classification_tp.py"]