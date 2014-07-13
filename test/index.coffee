should = require 'should'
ConfigSchema = require '../lib'

describe 'ConfigSchema', ->
  beforeEach ->
    @config = new ConfigSchema()

  it 'should have all the right attributes', ->
    @config.schema.should.eql({})
    @config.validate({}).should.eql({})

  it 'should validate', ->
    @config.schema =
      someOption:
        type: 'boolean'

    @config
      .validate(someOption: true)
      .should.eql(someOption: true)

  it 'should throw validate errors', ->
    @config.schema =
      someOption:
        type: 'boolean'

    (=> @config.validate(someOption: 42)).should.throw(
      'number value found, but a boolean is required'
    )

  it 'should validate individual options', ->
    @config.schema =
      someOption:
        type: 'boolean'

    @config.validateOption('someOption', true).should.eql(
      errors: []
      valid: true
    )

    @config.validateOption('someOption', 42).should.eql(
      errors: ['number value found, but a boolean is required']
      valid: false
    )

  it 'should apply defaults with validate() without mutating @data', ->
    @config.schema =
      someOption:
        type: 'boolean'
        default: true

    data = {}
    @config.validate(data).should.eql(someOption: true)
    data.should.eql({})

  it 'should error when extraneous attributes are passed', ->
    @config.schema =
      someOption:
        type: 'boolean'
        default: true

    data = {aBadOption: 42}
    try
      @config.validate(data)
    catch error
      error.should.match /The property aBadOption is not defined in the schema/
