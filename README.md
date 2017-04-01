# Graded Unit 2 Project

Year two graded unit project created for HND Software Development at City of Glasgow College. The site is a college admissions site, developed using Ruby on Rails. Students sign up for accounts, apply for courses, and accept/decline offers. The initial brief is included below.

**Installation**

To get the site running you need to create a file `config/application.yml` that contains the following:

```
development:
  secret_key_base: <SECRET DEVELOPMENT KEY>

test:
  secret_key_base: <SECRET TEST KEY>

production:
  secret_key_base: <SECRET PRODUCTION KEY>
```

You can create a secret using `ruby bin\rake secret`.
