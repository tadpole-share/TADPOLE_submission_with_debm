# BUILD:
# docker build . -t "ebm"

# RUN:
# if data is in /localdata
# docker run --rm -it -v /localdata:/data:ro ebm

FROM r-base

RUN apt-get update && \
    apt-get install -y python3 python3-pip git && \
    pip3 install pandas openpyxl scipy && \
    mkdir /src && \
#    git clone https://github.com/88vikram/TADPOLE_submission_with_debm.git /src && \
#    git clone https://github.com/tadpole-share/TADPOLE_submission_with_debm.git /src && \
    git clone https://github.com/88vikram/pyebm.git /pyebm && \
    pip3 install -r /pyebm/requirements.txt

WORKDIR /src

COPY . /src

ENV PYTHONPATH=.:/pyebm

CMD ["python3", "main_EMC1.py"]


