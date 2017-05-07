# Graded Unit 2 Project

Year two graded unit project created for HND Software Development at City of Glasgow College. The site is a college admissions site, developed using Ruby on Rails. Students sign up for accounts, apply for courses, and accept/decline offers.

**Installation**

To get the site running you need to create a file `config/application.yml` that contains the following:

```YML
development:
  secret_key_base: <SECRET>
  aws_access_key: <SECRET>
  aws_secret_access_key: <SECRET>
  aws_region: eu-west-2
  aws_bucket: <SECRET>
  braintree_merchant_id: <SECRET>
  braintree_public_key: <SECRET>
  braintree_private_key: <SECRET>
  paypal_username: <SECRET>
  paypal_password: <SECRET>
  paypal_signature: <SECRET>
  recaptcha_site_key: <SECRET>
  recaptcha_secret_key: <SECRET>

test:
  secret_key_base: <SECRET>
  aws_access_key: <SECRET>
  aws_secret_access_key: <SECRET>
  aws_region: eu-west-2
  aws_bucket: <SECRET>

production:
  secret_key_base: <SECRET>
  aws_access_key: <SECRET>
  aws_secret_access_key: <SECRET>
  aws_region: eu-west-2
  aws_bucket: <SECRET>
```

You can create a secret using `ruby bin\rake secret`.
