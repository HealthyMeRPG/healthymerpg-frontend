`import DS from 'ember-data'`

User = DS.Model.extend(
  username: DS.attr('string')
  email: DS.attr('string')
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  password: DS.attr('string')
  passwordConfirmation: DS.attr('string')

  trackers: DS.hasMany('tracker', async: true) # the tracker is not loaded when the model is loaded

  fullName: (->
    "#{@get('firstName')} #{@get('lastName')}"
  ).property('firstName', 'lastName')
)

`export default User`
