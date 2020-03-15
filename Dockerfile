FROM ruby:slim

ARG wkhtmltopdf_version

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "software-properties-common"]
RUN ["apt-add-repository", "contrib"]
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "libjpeg-dev", "libpng-dev", "libxrender-dev", "libfontconfig1-dev", "libxext-dev", "msttcorefonts"]

RUN gem install wkhtmltopdf-binary -v $wkhtmltopdf_version

ENTRYPOINT ["wkhtmltopdf"]
