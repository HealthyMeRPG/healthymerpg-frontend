`import DS from 'ember-data'`

Activity = DS.Model.extend(
  activity_date: DS.attr('date')
  steps: DS.attr('number')
  calories_burned: DS.attr('number')
  floors_climbed: DS.attr('number')
  very_active_minutes: DS.attr('number')
  finalized: DS.attr('boolean')

  user: DS.belongsTo('user', async: true)
)

`export default Activity`
