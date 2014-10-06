`import DS from 'ember-data'`

Tracker = DS.Model.extend {
  uuid: DS.attr('string') # unique identifier
  tracker: DS.attr('string') # ex. fitbit, jawbone, etc.
  user: DS.belongsTo('user', async: true) # user the tracker belongs to
}

`export default Tracker`
