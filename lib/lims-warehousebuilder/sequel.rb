unless defined?(DB) && defined?(DB_IMAGES)
  env = ENV["LIMS_WAREHOUSEBUILDER_ENV"]
  db_settings = YAML.load_file(File.join('config', 'database.yml'))
  DB = Sequel.connect(db_settings["warehouse_#{env}"])
  DB_IMAGES = Sequel.connect(db_settings["warehouse_images_#{env}"])
end

Sequel.default_timezone = :utc
