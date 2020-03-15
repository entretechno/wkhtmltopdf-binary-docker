class WickedPdf
  # This script is loaded before `wicked_pdf`, so we can't override `config=`
  # since that doesn't exist yet. Instead, we can override `cattr_accessor`,
  # which `wicked_pdf` calls while setting up the class (and, importantly,
  # AFTER `@@config` has been initialized) to force the `exe_path` option to
  # be what we want.
  def self.cattr_accessor(*attrs, &block)
    @@forced_wicked_pdf_config_opts = {
      exe_path: File.join(__dir__, 'wkhtmltopdf')
    }

    @@config.merge!(@@forced_wicked_pdf_config_opts) if attrs == %i[config]

    super

    returns unless attrs == %i[config]

    class << self
      define_method :config= do |val|
        @@config = val.merge(@@forced_wicked_pdf_config_opts)
      end
    end
  end
end
