`import DS from 'ember-data'`

Quest = DS.Model.extend(
  title: DS.attr('string')
  staminaReward: DS.attr('number')
  strengthReward: DS.attr('number')
  mindReward: DS.attr('number')
  vitalityReward: DS.attr('number')
  agilityReward: DS.attr('number')
  activity: DS.attr('string')
  activity_amount: DS.attr('number')
)

`export default Quest`
