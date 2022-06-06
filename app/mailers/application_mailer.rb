# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'ad44inych@yandex.ru' # {}%{"Test Guru" <mail@testguru.com>}
  layout 'mailer'
end
