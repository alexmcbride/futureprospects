# Graded Unit 2 Project

Year two graded unit project created for HND Software Development at City of Glasgow College. The site is a college admissions site, developed using Ruby on Rails. Students sign up for accounts, apply for courses, and accept/decline offers.

**Installation**

To get the site running you need to create a file `config/application.yml` that contains the following:

```YML
# Figaro
# ------
# Add configuration values here, as shown below.

development:
  secret_key_base: <SECRET>
  webhost: 127.0.0.1:3000
  aws_access_key: <SECRET>
  aws_secret_access_key: <SECRET>
  aws_region: eu-west-2
  aws_bucket: futureprospects
  braintree_merchant_id: <SECRET>
  braintree_public_key: <SECRET>
  braintree_private_key: <SECRET>
  paypal_username: xandermcbride-facilitator_api1.gmail.com
  paypal_password: <SECRET>
  paypal_signature: <SECRET>
  recaptcha_site_key: <SECRET>-LB
  recaptcha_secret_key: <SECRET>
  twilio_sid: <SECRET>
  twilio_secret: <SECRET>
  twilio_phone_number: "<SECRET>"
  google_oauth2_client_id: <SECRET>
  google_oauth2_client_secret: <SECRET>
  facebook_oauth_app_id: <SECRET>
  facebook_oauth_app_secret: <SECRET>
  twitter_oauth_app_id: <SECRET>
  twitter_oauth_app_secret: <SECRET>
  test_payments: "true"

test:
  secret_key_base: <SECRET>
  aws_access_key: <SECRET>
  aws_secret_access_key: <SECRET>
  aws_region: eu-west-2
  aws_bucket: futureprospects

production:
  secret_key_base: <SECRET>
  webhost: futureprospects.herokuapp.com
  aws_access_key: <SECRET>
  aws_secret_access_key: <SECRET>
  aws_region: eu-west-2
  aws_bucket: futureprospects
  braintree_merchant_id: <SECRET>
  braintree_public_key: <SECRET>
  braintree_private_key: <SECRET>
  paypal_username: xandermcbride-facilitator_api1.gmail.com
  paypal_password: <SECRET>
  paypal_signature: <SECRET>
  recaptcha_site_key: <SECRET>
  recaptcha_secret_key: <SECRET>
  twilio_sid: <SECRET>
  twilio_secret: <SECRET>
  twilio_phone_number: <SECRET>
  google_oauth2_client_id: <SECRET>
  google_oauth2_client_secret: <SECRET>
  facebook_oauth_app_id: <SECRET>
  facebook_oauth_app_secret: <SECRET>
  twitter_oauth_app_id: <SECRET>
  twitter_oauth_app_secret: <SECRET>
  test_payments: "true"
```

You can create a secret using `ruby bin\rake secret`.
