`import DS from 'ember-data'`

{ moment } = window

ScoreHistory = DS.Model.extend {
  date: DS.attr('date')
  score: DS.attr('number')

  name: (->
    moment(@get('date')).format('MMM Do')
  ).property('date')
}

`export default ScoreHistory`
