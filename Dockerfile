FROM ruby:slim

ARG wkhtmltopdf_version

RUN ["sed", "-Ei", "s/^([^#].*)$/\\1 contrib/g", "/etc/apt/sources.list"]
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "libjpeg-dev", "libpng-dev", "libxrender-dev", "libfontconfig-dev", "libxext-dev", "msttcorefonts"]

RUN gem install wkhtmltopdf-binary -v $wkhtmltopdf_version

ENTRYPOINT ["wkhtmltopdf"]
