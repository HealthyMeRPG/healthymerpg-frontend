`import DS from 'ember-data'`

Score = DS.Model.extend {
  stamina: DS.attr('number')
  strength: DS.attr('number')
  mind: DS.attr('number')
  vitality: DS.attr('number')
  agility: DS.attr('number')

  user: DS.belongsTo('user', async: true) # user the score belongs to

  overall: (->
    Math.ceil((@get('stamina') + @get('strength') + @get('mind') + @get('vitality') + @get('agility')) / 5)
  ).property('stamina', 'strength', 'mind', 'vitality', 'agility')
}

`export default Score`
