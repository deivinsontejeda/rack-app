# Middleware
class FakeIpMiddleware
  def initialize(app, ip)
    @app = app
    @ip = ip
  end

  def call(env)
    env['HTTP_X_FORWARDED_FOR'] = nil
    env['REMOTE_ADDR'] = @ip
    status, headers, response_body = @app.call(env)
    [status, headers, response_body]
  end
end
