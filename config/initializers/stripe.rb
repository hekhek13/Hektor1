if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['pk_live_0foxFlXNrzF6FrfqvCrH6dyS'],
    :secret_key => ENV['sk_live_E4mW49RM6uG79NuzwEavZCeZ']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_4WWRn82EPEseBpXWgaYikxRY',
    :secret_key => 'sk_test_Pv2vHHotKXhNryfq8kkQufxl'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]