# config-schema
[![Build Status](http://img.shields.io/travis/slang800/config-schema.svg?style=flat)](https://travis-ci.org/slang800/config-schema)

A lightweight wrapper for configuration options using JSON schema.

## example
This is an example, lifted from ship:

```coffee
@configSchema = new ConfigSchema()

@configSchema.schema.projectRoot =
  required: true
  default: './'
  type: 'string'
  description: 'The path to the root of the project to be shipped.'
@configSchema.schema.sourceDir =
  required: true
  default: './public'
  type: 'string'
  description: ''
@configSchema.schema.ignore =
  required: true
  default: ['ship*.opts']
  type: 'array'
  description: 'Minimatch-style strings for what files to ignore. This can be repeated to add multiple ignored patterns.'
```
