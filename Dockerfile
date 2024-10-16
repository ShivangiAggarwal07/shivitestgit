FROM jupyter/scipy-notebook

# Create a directory for models
RUN mkdir /home/jovyan/my-model

# Set environment variables for model paths
ENV MODEL_DIR=/home/jovyan/my-model
ENV MODEL_FILE_LDA=clf_lda.joblib
ENV MODEL_FILE_NN=clf_nn.joblib

# Install required Python packages
RUN pip install joblib

# Set the working directory to /home/jovyan (the default directory in this base image)
WORKDIR /home/jovyan/

# Copy CSV and Python script files into the container
COPY train.csv ./train.csv
COPY test.csv ./test.csv
COPY train.py ./train.py
COPY inference.py ./inference.py

# Run the training script
RUN python3 train.py
