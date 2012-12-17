Rails.application.config.before_initialize do
  config = YAML.load(File.read(File.join(Rails.root, "/config/services.yml")))
  SERVICES = config[Rails.env]
end

EventMachine.next_tick do
  connection = AMQP.connect(:host => SERVICES["RABBIT_MQ_HOST"])
  channel = AMQP::Channel.new(connection)
  AUTH_SERVICE_EXCHANGER = channel.fanout("auth-service")
end
