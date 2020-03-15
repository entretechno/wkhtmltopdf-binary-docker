# `wkhtmltopf-binary-docker`

Forces [`wicked_pdf`](https://rubygems.org/gems/wicked_pdf) to use a Docker
container to render PDFs when calling
[`wkhtmltopdf-binary`](https://rubygems.org/gems/wkhtmltopdf-binary)

## Setup

1. Install Docker
2. Ensure [Docker has access](https://docs.docker.com/docker-for-mac/#file-sharing) to:
    - `wicked_pdf`'s tempfile directory:
        - See `WickedPdf::WickedPdfTempfile.new('').path`
    - Your project directory
3. Create or amend the `RUBYOPT` environment variable to require `exe_path.rb`
    - This can be set permanently by adding the following to your `~/.profile`:
        ```
        if [ -n "$RUBYOPT" ]; then
          export RUBYOPT="$RUBYOPT -r/path/to/wkhtmltopdf-binary-docker/exe_path"
        else
          export RUBYOPT='-r/path/to/wkhtmltopdf-binary-docker/exe_path'
        fi
        ```
