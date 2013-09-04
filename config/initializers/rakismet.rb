enki_config = YAML.load(IO.read("#{Rails.root}/config/enki.yml")).symbolize_keys
rakismet_config = Rails.application.config.rakismet
rakismet_config.key  ||= enki_config[:rakismet]['key']
rakismet_config.host ||= enki_config[:rakismet]['host']
rakismet_config.url  ||= enki_config[:rakismet]['url'] || enki_config[:url]
